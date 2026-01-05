import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import 'sections/section_services.dart';

Widget buildGridItem(
  SectionServices item,
  bool isSelected,
) {
  return Material(
    color: Colors.white,
    elevation: 4,
    borderRadius: BorderRadius.circular(15.0.r),
    child: Container(
      width: 90.w,
      height: 90.h,
      decoration: BoxDecoration(
        color: isSelected ? ColorManager.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(6.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.0.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Icon(
                item.icon,
                size: 20.sp,
                color: isSelected ? ColorManager.white : ColorManager.primary,
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Text(
            item.label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? ColorManager.white : ColorManager.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
