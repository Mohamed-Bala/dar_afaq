import 'package:dar_afaq/core/resources/color_manager.dart';
import 'package:dar_afaq/features/dashboard/view/ads_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/styles_manager.dart';
import '../../auctions/auction_view.dart';
import '../../deals/deals_view.dart';
import '../../profile/profile_drawer.dart';
import 'add_ads_view.dart';
import 'home.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
// 1. State variable to track the currently selected index
  int _currentIndex = 0;

  // 2. A list of screen widgets corresponding to each navigation item
  final List<Widget> _pages = [
    const Home(),
    AuctionView(),
    const PackageSelectionScreen(),
    const AdsView(),
    const DealsView(),
  ];

  final List<String> _titel = [
    "دار أفاق",
    "المزادات",
    "اضافة اعلان",
    "الاعلانات",
    "الصفقات",
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        endDrawer: const Profile(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: ColorManager.black,
              size: 30.sp,
            ),
            onPressed: () {},
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
          physics: const NeverScrollableScrollPhysics(), // Disable swiping
          children: _pages,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.gavel),
              label: 'المزادات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'اضافة اعلان',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.campaign),
              label: 'الاعلانات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.swap_calls),
              label: 'الصفقات',
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
