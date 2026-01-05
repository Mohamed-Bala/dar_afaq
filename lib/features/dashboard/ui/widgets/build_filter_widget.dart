// Helper method to build filter dropdowns
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../logic/home_cubit.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  // State for filter dropdowns
  String? _selectedCategory;
  String? _selectedArea;
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     try {
  //       context.read<AddAdvertisementCubit>().fetchRegions();
  //     } catch (_) {}
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // --- Filter Row ---
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: buildFilterDropdown(
                label: 'فئة العقار',
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
                label: 'المناطق',
                value: _selectedArea,
                items: context.watch<AddAdvertisementCubit>().regions,
                onChanged: (value) {
                  setState(() {
                    context.read<AddAdvertisementCubit>().updateRegion(value!);
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
