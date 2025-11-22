import 'package:dar_afaq/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/spacing.dart';
import '../widgets/ads/ads_List_view_widget.dart';
import '../widgets/category/category_list_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, // For Arabic text
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Section 3: Upcoming Auctions
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
              child: const AuctionSectionHeader(title: 'المزادات القادمة'),
            ),
            const AuctionCard(),
            // verticalSpace(10),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
              child: const AuctionSectionHeader(title: 'اعلانات  مميزة'),
            ),
            const CategoryListView(),
            verticalSpace(10),
            AdsListViewWidget(),
            verticalSpace(10),
          ],
        ),
      ),
    );
  }
}

// --- AUCTION CARD WIDGET ---
class AuctionCard extends StatelessWidget {
  const AuctionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManager.white,
      margin: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: EdgeInsets.all(14.0.h),
        child: Column(
          children: [
            // --- Top Row (Time, Date, Location) ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Right Side (Time)
                Row(
                  children: [
                    Icon(Icons.access_time,
                        size: 18, color: ColorManager.primary2),
                    horizontalSpace(4),
                    const Text(
                      '09:00',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                // Center (Date)
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 18.sp,
                      color: ColorManager.primary2,
                    ),
                    horizontalSpace(4),
                    const Text(
                      '20.11.2025',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                // Left Side (Ministry Logo - Placeholder)
                Row(
                  children: [
                    Container(
                      width: 18.w,
                      height: 18.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          '⚖️',
                          style: TextStyle(color: ColorManager.white),
                        ),
                      ),
                    ),
                    horizontalSpace(4),
                    const Text(
                      'وزارة العدل',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),

            Divider(height: 16.h),

            // --- Middle Row (Details) ---
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'قصر العدل الجديد - الطابق الثامن - قاعة 5',
                        style: TextStyle(
                            color: ColorManager.grey, fontSize: 12.sp),
                      ),
                    ],
                  ),
                  horizontalSpace(8),
                  Icon(
                    Icons.location_on,
                    size: 18.sp,
                    color: ColorManager.primary2,
                  ),
                ],
              ),
            ),

            verticalSpace(14),

            // --- Bottom Row (Price Details) ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Offered Count
                Column(
                  children: [
                    Text(
                      'المعروض',
                      style:
                          TextStyle(color: ColorManager.grey, fontSize: 12.sp),
                    ),
                    Text(
                      '13 عقارات',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),

                // Starting Price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'السعر الابتدائي',
                      style:
                          TextStyle(color: ColorManager.grey, fontSize: 12.sp),
                    ),
                    Text(
                      '171,242 د.ك',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: ColorManager.primary2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// --- AUCTION HEADER WIDGET ---
class AuctionSectionHeader extends StatelessWidget {
  final String title;

  const AuctionSectionHeader({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left Side: View All Button
        TextButton(
          onPressed: () {},
          child: Text(
            '<  عرض الكل ',
            style: TextStyle(color: ColorManager.primary, fontSize: 14.sp),
          ),
        ),
        // Right Side: Title
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ),
      ],
    );
  }
}

// --- FEATURED ADS HEADER WIDGET (with Search Bar and Tabs) ---
class FeaturedAdsHeader extends StatelessWidget {
  const FeaturedAdsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Title
        Text(
          'إعلانات مميزة:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ),
        verticalSpace(10),

        // Search Bar (Simulated)
        // Container(
        //   padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        //   decoration: BoxDecoration(
        //     color: Colors.grey[100],
        //     borderRadius: BorderRadius.circular(20.r),
        //     border: Border.all(color: Colors.grey[300]!),
        //   ),
        //   child: const Row(
        //     children: [
        //       Icon(Icons.search, color: Colors.grey),
        //       SizedBox(width: 8),
        //       Text(
        //         'ابحث في إعلاناتنا',
        //         style: TextStyle(color: Colors.grey),
        //       ),
        //       Spacer(),
        //     ],
        //   ),
        // ),
        verticalSpace(10),

        // Filter Tabs
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTab('للبيع', isSelected: true),
            _buildTab('للإيجار'),
            _buildTab('للبدل'),
          ],
        ),
        verticalSpace(10),
      ],
    );
  }

  Widget _buildTab(String label, {bool isSelected = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isSelected ? ColorManager.white : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: isSelected ? null : Border.all(color: Colors.grey[400]!),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
