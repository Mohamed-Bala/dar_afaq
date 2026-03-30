import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';

Padding SearchWidget(BuildContext context, {required void Function()? onTap}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: ColorManager.primary),
            SizedBox(width: 10.w),
            Text(
              'ابحث عن الأقسام أو الخدمات...',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
          ],
        ),
      ),
    ),
  );
}
