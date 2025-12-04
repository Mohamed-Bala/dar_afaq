import 'package:dar_afaq/core/helper/extensions.dart';
import 'package:dar_afaq/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helper/spacing.dart';
import '../../core/resources/styles_manager.dart';
import '../../core/routing/routes.dart';

class AuctionView extends StatelessWidget {
  AuctionView({super.key});

  // Data for auction list (simplified)
  final List<Map<String, String>> _auctionData = List.generate(
    5,
    (index) => {
      'time': '09:00',
      'date': '2${index + 1}.11.2025',
      'ministry': 'وزارة العدل',
      'location': 'قصر العدل الجديد - الطابق الثامن - قاعة 5',
    },
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const FilterAuctionWidget(),

          // Segmented Filter Buttons
          Container(
            padding: EdgeInsets.all(4.h),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFilterButton('القادمة', isSelected: true),
                _buildFilterButton('السابقة'),
                const SizedBox(width: 8),
                _buildFilterButton('المنظم'),
                _buildFilterButton('حسب العقار'),
              ],
            ),
          ),
          // --- Auction List ---
          SizedBox(
            height: 900.h,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
              itemCount: _auctionData.length,
              itemBuilder: (context, index) {
                final auction = _auctionData[index];
                return AuctionListItem(
                  time: auction['time']!,
                  date: auction['date']!,
                  ministry: auction['ministry']!,
                  location: auction['location']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Helper for Filter Buttons
  Widget _buildFilterButton(String text, {bool isSelected = false}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0.w, horizontal: 8.0.h),
        decoration: BoxDecoration(
          color: isSelected ? ColorManager.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}

// --- Auction List Item Widget ---
class AuctionListItem extends StatelessWidget {
  final String time;
  final String date;
  final String ministry;
  final String location;

  const AuctionListItem({
    super.key,
    required this.time,
    required this.date,
    required this.ministry,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.auctionDetailsRoute);
      },
      child: Card(
        color: ColorManager.white,
        margin: EdgeInsets.symmetric(vertical: 8.0.w, horizontal: 8.0.h),
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(15.0.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Side (Ministry Logo)
              // Container(
              //   width: 50,
              //   height: 50,
              //   decoration: BoxDecoration(
              //     color: Colors.red[100], // Placeholder color
              //     borderRadius: BorderRadius.circular(8),
              //     image: const DecorationImage(
              //       image: AssetImage(
              //           'assets/ministry_logo.png'), // Replace with actual logo
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              //   child: const Center(
              //     child: Text('🇰🇼',
              //         style: TextStyle(fontSize: 24)), // Placeholder if no image
              //   ),
              // ),
              horizontalSpace(12),

              // Middle Section (Details)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.bookmark_border,
                              color: ColorManager.primary,
                            ),
                            horizontalSpace(4),
                            Text(
                              ministry,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 16.sp,
                              color: ColorManager.primary,
                            ),
                            horizontalSpace(4),
                            Text(
                              time,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 16.sp,
                              color: ColorManager.primary,
                            ),
                            horizontalSpace(4),
                            Text(
                              date,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16.sp,
                          color: ColorManager.primary,
                        ),
                        horizontalSpace(4),
                        Expanded(
                          child: Text(
                            location,
                            style: TextStyle(
                                color: ColorManager.grey, fontSize: 13.sp),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          'ذكرني',
                          style: TextStyle(
                            color: ColorManager.primary,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Right Side (Bookmark Icon)
              const Column(
                children: [
                  // IconButton(
                  //   icon: const Icon(Icons.bookmark_border, color: Colors.grey),
                  //   onPressed: () {},
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterAuctionWidget extends StatefulWidget {
  const FilterAuctionWidget({super.key});

  @override
  State<FilterAuctionWidget> createState() => _FilterAuctionWidgetState();
}

class _FilterAuctionWidgetState extends State<FilterAuctionWidget> {
  // State for filter dropdowns
  String? _selectedCategory;
  String? _selectedArea;
  @override
  Widget build(BuildContext context) {
    // --- Filter Row ---
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Directionality(
        textDirection: TextDirection.rtl, // Force RTL for the filter row
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: buildFilterDropdown(
                label: 'فئة العقار', // Property Category
                value: _selectedCategory,
                items: ['شقة', 'فيلا', 'ارض', 'محل'],
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
            ),
            horizontalSpace(5),
            Expanded(
              child: buildFilterDropdown(
                label: 'المناطق', // Areas
                value: _selectedArea,
                items: ['الاندلس', 'القرين', 'حولي', 'السالمية'],
                onChanged: (value) {
                  setState(() {
                    _selectedArea = value;
                  });
                },
              ),
            ),
            horizontalSpace(5),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.grey),
              ),
              child: IconButton(
                icon: Icon(Icons.filter_list, color: ColorManager.primary),
                onPressed: () {
                  // Handle filter action
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildFilterDropdown({
  required String label,
  required String? value,
  required List<String> items,
  required ValueChanged<String?> onChanged,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(color: Colors.grey),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: value,
        hint: Text(
          label,
          style: StylesManager.font12GrayRegular,
          textDirection: TextDirection.rtl,
        ),
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        isExpanded: true,
        style: TextStyle(color: Colors.black87, fontSize: 14.sp),
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<String>>((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
            ),
          );
        }).toList(),
        // Add `dropdownColor` if you want to customize dropdown menu background
        // dropdownColor: Colors.white,
      ),
    ),
  );
}
