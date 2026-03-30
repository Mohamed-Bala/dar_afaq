import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/di.dart';
import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../search/search_view.dart';
import '../../../auth/logic/cubit_cubit.dart';
import '../../../sections/sections_view.dart';
import '../../../notification/notification_view.dart';
import '../../../settings/view/profile/profile_drawer.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';
import 'advertisements/view/ads/ads_view.dart';
import 'advertisements/widgets/add_ads/package_selection.dart';
import 'home/home.dart';

class EdgeSwipeExit extends StatelessWidget {
  final Widget child;
  final double edgeThreshold =
      30.0; // زيادة الحساسية قليلاً لتناسب الشاشات الكبيرة

  EdgeSwipeExit({required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (details) {
        double screenWidth = MediaQuery.of(context).size.width;
        double startX = details.globalPosition.dx;

        // إذا سحب المستخدم من الحافة اليسرى أو اليمنى
        if (startX < edgeThreshold || startX > (screenWidth - edgeThreshold)) {
          // تنفيذ الخروج
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        }
      },
      child: child,
    );
  }
}

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    BlocProvider(
      create: (context) => HomeCubit(di())..getVipAds(),
      child: const Home(),
    ),
    BlocProvider(
      create: (context) => di<SearchFilterCubit>(),
      child: const SearchView(),
    ),
    BlocProvider(
        create: (BuildContext context) => di<FilterSctionCubit>(),
        child: const PackageSelection()),
    const SectionsView(),
    BlocProvider(
      create: (context) => HomeCubit(di())..getAllAds(),
      child: const AdsView(),
    ),
  ];

  final List<String> _titel = [
    AppStrings.appName.tr(),
    AppStrings.search.tr(),
    AppStrings.addAd.tr(),
    AppStrings.sections.tr(),
    AppStrings.advertisements.tr(),
  ];

  final PageController _pageController = PageController();
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  //   _pageController.jumpToPage(index);
  // }

  @override
  void initState() {
    super.initState();
    context.read<NavigationCubit>().setController(_pageController);
    context.read<NotificationsCubit>().emitGetNotifications();
  }

  void _onItemTapped(int index) {
    context.read<NavigationCubit>().changeIndex(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<bool> onWillPop() async {
    if (_currentIndex != 0) {
      _pageController.jumpToPage(0);

      setState(() {
        _currentIndex = 0;
      });

      return false;
    }

    SystemNavigator.pop();
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        endDrawer: FutureBuilder(
          future: SharedPrefHelper.getInt(SharedPrefKeys.userId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final int currentUserId = snapshot.data as int;
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) =>
                        di<UserInfoCubit>()..emitGetUserInfo(currentUserId),
                  ),
                  BlocProvider(
                    create: (context) => di<UserMonthlyPointsCubit>(),
                  )
                ],
                child: Profile(),
              );
            } else {
              return const Drawer(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BlocBuilder<NotificationsCubit, NotificationsState>(
            builder: (context, state) {
              int count = 0;

              state.maybeWhen(
                notificationsSuccess: (data) {
                  count = data.notificationsDataResponse?.length ?? 0;
                },
                orElse: () {},
              );

              return IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) =>
                            di<NotificationsCubit>()..emitGetNotifications(),
                        child: const NotificationsView(),
                      ),
                    ),
                  );
                },
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(
                      Icons.notifications_none,
                      color: ColorManager.black,
                      size: 30.sp,
                    ),

                    /// 🔴 BADGE
                    if (count > 0)
                      Positioned(
                        right: -2,
                        top: -2,
                        child: Container(
                          padding: EdgeInsets.all(4.h),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          constraints: BoxConstraints(
                            minWidth: 14.w,
                            minHeight: 14.h,
                          ),
                          child: Center(
                            child: Text(
                              count > 99 ? "99+" : "$count",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
          title: Text(
            _titel[_currentIndex],
            style: StylesManager.font12GrayRegular.copyWith(
              color: ColorManager.black,
              fontSize: 20.sp,
            ),
          ),
          centerTitle: true,
        ),
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: _pages,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: ColorManager.primary,
          onPressed: () {
            _onItemTapped(2);
          },
          child: Icon(
            Icons.ads_click_outlined,
            color: Colors.white,
            size: 30.sp,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BlocBuilder<NavigationCubit, int>(
          builder: (context, currentIndex) {
            return BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: AppStrings.home.tr(),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: AppStrings.search.tr(),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.ads_click_outlined),
                  label: AppStrings.addAd.tr(),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.grid_view),
                  label: AppStrings.sections.tr(),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.campaign),
                  label: AppStrings.advertisements.tr(),
                ),
              ],
              currentIndex: currentIndex,
              selectedItemColor: ColorManager.primary,
              backgroundColor: Colors.white,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              // onTap: (index) => _onItemTapped,
              onTap: (index) => _onItemTapped(index),
            );
          },
        ),
      ),
    );
  }
}
