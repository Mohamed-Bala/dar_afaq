import 'package:dar_afaq/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helper/spacing.dart';
import '../../core/widgets/app_text_form_field.dart';

class DealsView extends StatelessWidget {
  const DealsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      // Set direction to Right-to-Left for Arabic content
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(14.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 2. Filter/Search Bar
            const FilterBarRow(),
            verticalSpace(20),

            // 3. Category Tabs
            const CategoryTabs(),
            verticalSpace(20),

            // 4. Summary/Metrics
            // SummaryMetrics(),

            // 5. Main Transaction Card (Detailed)
            // DetailedTransactionCard(),
            // verticalSpace(20),

            // 6. Transaction List (Simulated)
            const SmallerTransactionCard(price: '425,000 د.ك'),
            verticalSpace(10),
            const SmallerTransactionCard(price: '335,000 د.ك'),
            verticalSpace(10),
            const SmallerTransactionCard(price: '425,000 د.ك'),
            verticalSpace(10),
            const SmallerTransactionCard(price: '425,000 د.ك'),
            verticalSpace(10),
            const SmallerTransactionCard(price: '425,000 د.ك'),
            // Add more as needed...
          ],
        ),
      ),
    );
  }
}

class FilterBarRow extends StatelessWidget {
  const FilterBarRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Dropdown 1: العام الحالي
        const Expanded(child: FilterDropdown(label: 'العام الحالي')),
        horizontalSpace(8),
        // Dropdown 2: المنطقة
        const Expanded(child: FilterDropdown(label: 'المنطقة')),
        // Swap button
        IconButton(
          icon: const Icon(Icons.swap_horiz, color: Colors.grey),
          onPressed: () {},
        ),
      ],
    );
  }
}

// Helper Widget for the styled dropdowns
class FilterDropdown extends StatelessWidget {
  final String label;
  const FilterDropdown({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 14.sp),
          ),
          const Icon(Icons.arrow_drop_down, color: Colors.grey),
        ],
      ),
    );
  }
}

// CategoryTabs (Section 3)
class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    // The design uses a Row of buttons/icons inside round containers.
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CategoryButton(
            label: 'استثماري', icon: Icons.apartment, isSelected: false),
        CategoryButton(label: 'تجاري', icon: Icons.store, isSelected: false),
        CategoryButton(label: 'صناعي', icon: Icons.factory, isSelected: false),
        CategoryButton(label: 'خاص', icon: Icons.house, isSelected: false),
        CategoryButton(
          label: 'الكل',
          icon: Icons.list,
          isSelected: true,
        ),
      ],
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;

  const CategoryButton({
    required this.label,
    required this.icon,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12.h),
          decoration: BoxDecoration(
            color: isSelected ? ColorManager.primary : Colors.grey.shade100,
            shape: BoxShape.circle,
            border: isSelected ? null : Border.all(color: Colors.grey.shade300),
          ),
          child: Icon(
            icon,
            color: isSelected ? Colors.white : Colors.blueGrey,
            size: 24,
          ),
        ),
        verticalSpace(4),
        Text(
          label,
          style: TextStyle(fontSize: 12.sp),
        ),
      ],
    );
  }
}

class DetailedTransactionCard extends StatelessWidget {
  const DetailedTransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManager.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ), // Blue border for selection/highlight
        ),
        child: Column(
          children: [
            // Header Row (Top right: date, Top left: label/heart)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TransactionStatusLabel(),
                Text(
                  '2025-11-19',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
            verticalSpace(15),
            Row(
              children: [
                Expanded(
                  child: AppTextFormField(
                    //controller: _streetController,
                    hintText: '800,000',
                    validator: (value) {},
                  ),
                ),
                Expanded(
                  child: AppTextFormField(
                    //controller: _streetController,
                    hintText: 'بيت',
                    validator: (value) {},
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: AppTextFormField(
                    //controller: _streetController,
                    hintText: '%100.00',
                    validator: (value) {},
                  ),
                ),
                Expanded(
                  child: AppTextFormField(
                    //controller: _streetController,
                    hintText: '1000 م',
                    validator: (value) {},
                  ),
                ),
              ],
            ),

            // Main Data Grid (using a Wrap or a grid of Rows)
            const Wrap(
              // spacing: 10.0, // horizontal space
              runSpacing: 10.0, // vertical space
              children: <Widget>[
                // Row 1
                // TransactionField(
                //     label: 'سعر الصفقة', value: '800,000', isLarge: true),
                // TransactionField(
                //     label: 'نوع العقار', value: 'بيت', isLarge: true),
                // TransactionField(
                //     label: 'فئة العقار', value: 'خاص', isLarge: true),

                // Row 2
                TransactionField(label: 'سعر (م2)', value: '800'),
                TransactionField(label: 'نسبة العرض', value: '%100.00'),
                TransactionField(label: 'المساحة', value: '1000 م2'),

                // Row 3
                TransactionField(label: 'القطعة', value: '3'),
                // Empty placeholders or other fields
              ],
            ),
            verticalSpace(10),
            // Footer (Area Label)
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(top: 8.0.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'المنطقة',
                      style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'العمرية',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Icon(Icons.keyboard_arrow_up, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

// Helper Widget for a single data field
class TransactionField extends StatelessWidget {
  final String label;
  final String value;
  final bool isLarge;

  const TransactionField(
      {required this.label,
      required this.value,
      this.isLarge = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey, fontSize: 10.sp),
          ),
          verticalSpace(2),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8.r),
              color: value.contains(',')
                  ? Colors.yellow.shade100
                  : Colors.white, // Highlight the price
            ),
            child: Text(
              value,
              style: TextStyle(
                fontWeight:
                    value.contains(',') ? FontWeight.bold : FontWeight.normal,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Helper Widget for the colored label
class TransactionStatusLabel extends StatelessWidget {
  const TransactionStatusLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: ColorManager.primary.withOpacity(.2),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'صفقة خاص',
            style: TextStyle(
              color: ColorManager.primary,
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
          ),
          horizontalSpace(4),
          Icon(Icons.favorite, color: ColorManager.primary, size: 12.sp),
        ],
      ),
    );
  }
}

class SmallerTransactionCard extends StatelessWidget {
  final String price;
  final String area;
  final String category;
  final String date;
  final String region;

  const SmallerTransactionCard({
    required this.price,
    this.area = '400 م2',
    this.category = 'خاص',
    this.date = '2025-11-19',
    this.region = 'المطلاع',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManager.white,
      elevation: 2,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.all(15.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price & Status Label
                Row(
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                        color: ColorManager.primary,
                      ),
                    ),
                    horizontalSpace(8),
                    const TransactionStatusLabel(),
                  ],
                ),
                // Date
                Text(date, style: TextStyle(color: Colors.grey.shade600)),
              ],
            ),
            verticalSpace(8),

            // Details Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Area
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'المساحة',
                      style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                    ),
                    Text(
                      area,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                // Category
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'فئة العقار',
                      style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                    ),
                    Text(
                      category,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                // Region
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'المنطقة',
                      style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                    ),
                    Text(
                      region,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
            // The small arrow to hide the card
            const Center(
              child: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
