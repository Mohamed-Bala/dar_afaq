import 'package:dar_afaq/core/helper/extensions.dart';
import 'package:dar_afaq/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/routing/routes.dart';
import '../widgets/ads/ads_List_view_widget.dart';
import '../widgets/category/category_list_view.dart';
import '../widgets/home_list_view.dart';
import '../widgets/real_estate_banner.dart';

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
            verticalSpace(20),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
              child: AuctionSectionHeader(
                title: ' الأقسام',
                onPressed: () {
                  context.pushNamed(Routes.servicesGridRoute);
                },
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCalculatorItem(
                      ' العقار', // Real Estate Calculator
                      Icons.apartment, // A placeholder icon for Real Estate
                      ColorManager.primary,
                      ColorManager.primary,
                    ),
                    horizontalSpace(12),
                    _buildCalculatorItem(
                      ' الإيجار', // Rent Calculator
                      Icons.business, // A placeholder icon for Rent
                      ColorManager.primary,
                      ColorManager.primary,
                    ),
                    horizontalSpace(12),
                    _buildCalculatorItem(
                      ' البنيان', // Building Calculator
                      Icons
                          .construction, // A placeholder icon for Building/Construction
                      ColorManager.primary,
                      ColorManager.primary,
                    ),
                    horizontalSpace(12),
                    _buildCalculatorItem(
                      ' التمويل', // Finance Calculator
                      Icons.account_balance, // Icon for Finance/Bank
                      ColorManager.primary,
                      ColorManager.primary,
                    ),
                  ],
                ),
              ),
            ),

            // Section 3: Upcoming Auctions
            // Padding(
            //   padding:
            //       EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
            //   child: const AuctionSectionHeader(title: 'المزادات القادمة'),
            // ),
            // const AuctionCard(),
            // verticalSpace(10),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
              child: const AuctionSectionHeader(title: 'اعلانات  مميزة'),
            ),
            const CategoryListView(),
            verticalSpace(10),
            HomeListView(),
            verticalSpace(10),
            const RealEstateBanner(),
            verticalSpace(10),
            const NewsArticleList(),
          ],
        ),
      ),
    );
  }

  ///===========================================================================
  // --- Helper Widget to build each calculator card ---
  Widget _buildCalculatorItem(
      String title, IconData mainIcon, Color iconColor, Color accentColor) {
    return Material(
      color: Colors.white,
      elevation: 4, // Shadow effect
      borderRadius: BorderRadius.circular(15.0), // Rounded corners
      child: Container(
        width: 90.w, // Fixed width for a uniform look
        height: 75.h, // Fixed height for a uniform look
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // --- Icon Stack (to simulate the calculator symbol overlay) ---
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                // Main Icon (Building/Finance/etc.)
                Icon(
                  mainIcon,
                  size: 20.sp,
                  color: iconColor,
                ),
                // Small Calculator Symbol (simulated with a container/icon)
                Positioned(
                  bottom: -5,
                  right: -5,
                  child: Container(
                    padding: EdgeInsets.all(2.h),
                    decoration: BoxDecoration(
                      color: accentColor, // Yellow background for the symbol
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(
                      Icons.calculate, // Placeholder for the calculator symbol
                      size: 14.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h), // Spacing between icon and text
            // --- Text Label ---
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: iconColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
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
                        size: 18, color: ColorManager.primary),
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
                      color: ColorManager.primary,
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
                    color: ColorManager.primary,
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
                        color: ColorManager.primary,
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
  final void Function()? onPressed;

  const AuctionSectionHeader({this.onPressed, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left Side: View All Button
        TextButton(
          onPressed: onPressed,
          child: Text(
            '  عرض الكل ',
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

// --- Color Constants (redefined for clarity) ---
// const Color primaryBlue = Color(0xFF0D1B44);
// const Color accentBlue = Color(0xFF4C9FFD);
const Color lightGreyBackground = Color(0xFFF0F2F5);

class NewsArticleList extends StatelessWidget {
  const NewsArticleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        // color: lightGreyBackground, // Match the image background
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // --- Title Row: أخبار ومقالات (News and Articles) & عرض الكل (View All) ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'أخبار ومقالات',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                  ),
                  TextButton(
                    onPressed: () {
                      context.pushNamed(Routes.articlesNewsRoute);
                    },
                    child: Text(
                      'عرض الكل',
                      style:
                          TextStyle(color: ColorManager.primary, fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // --- Article Items ---
              _buildArticleItem(
                context,
                title: '«سكن 106».. تجربة تستحق الدراسة في الكويت',
                author:
                    'https://images.pexels.com/photos/1755695/pexels-photo-1755695.jpeg',
                date: '2025-10-15',
                readTime: '3 دقيقة',
              ),
              _buildArticleItem(
                context,
                title: 'نزول أم تصحيح في أسعار السكن الخاص؟',
                author:
                    'https://images.pexels.com/photos/2773484/pexels-photo-2773484.jpeg',
                date: '2025-10-14',
                readTime: '3 دقيقة',
              ),
              _buildArticleItem(
                context,
                title: 'تصميم البيت العائلي وعلاقته بتربية الأبناء',
                author:
                    'https://images.pexels.com/photos/2773415/pexels-photo-2773415.jpeg',
                date: '2025-10-01',
                readTime: '3 دقيقة',
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Helper for News Article Item
  Widget _buildArticleItem(
    BuildContext context, {
    required String title,
    required String author,
    required String date,
    required String readTime,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2))
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Author/Image Placeholder on the right (RTL standard flow)
          Container(
            width: 80,
            height: 80, // Taller container to match the image ratio
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(author),
                fit: BoxFit.cover,
              ),
              // color: ColorManager.primary,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 10),
          // Title and Metadata
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: ColorManager.primary,
                  ),
                  textAlign: TextAlign.right,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      readTime,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ), // Read Time
                    const SizedBox(width: 4),
                    const Icon(Icons.access_time, size: 12, color: Colors.grey),
                    const SizedBox(width: 70),
                    Text(
                      date,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.calendar_today,
                        size: 12, color: Colors.grey),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
