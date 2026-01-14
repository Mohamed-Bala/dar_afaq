import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/di.dart';
import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../auctions/auction_view.dart';
import '../../../auth/logic/cubit_cubit.dart';
import '../../../deals/deals_view.dart';
import '../../../notification/notification_view.dart';
import '../../../settings/view/profile/profile_drawer.dart';
import '../../logic/home_cubit.dart';
import 'advertisements/view/ads/ads_view.dart';
import 'advertisements/widgets/add_ads/package_selection.dart';
import 'home/home.dart';

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
      create: (context) => HomeCubit(di())..getAllAuction(),
      child: const AuctionView(),
    ),
    const PackageSelection(),
    const DealsView(),
    BlocProvider(
      create: (context) => HomeCubit(di())..getAllAds(),
      child: const AdsView(),
    ),
  ];

  final List<String> _titel = [
    AppStrings.appName.tr(),
    AppStrings.auctions.tr(),
    AppStrings.addAd.tr(),
    AppStrings.deals.tr(),
    AppStrings.advertisements.tr(),
  ];

  final PageController _pageController = PageController();
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        endDrawer: FutureBuilder(
          future: SharedPrefHelper.getInt(SharedPrefKeys.userId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final int currentUserId = snapshot.data as int;
              return BlocProvider(
                create: (context) =>
                    di<UserInfoCubit>()..emitGetUserInfo(currentUserId),
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
          leading: IconButton(
            icon: Stack(
              children: [
                Icon(
                  Icons.notifications_none,
                  color: ColorManager.black,
                  size: 30.sp,
                ),
              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => di<NotificationsCubit>(),
                    child: const NotificationsView(),
                  ),
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
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: AppStrings.home.tr(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.gavel),
              label: AppStrings.auctions.tr(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ads_click_outlined),
              label: AppStrings.addAd.tr(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.swap_calls),
              label: AppStrings.deals.tr(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.campaign),
              label: AppStrings.advertisements.tr(),
            ),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: ColorManager.primary,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
