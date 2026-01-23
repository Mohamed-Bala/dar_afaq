import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/resources/color_manager.dart';

class CircularIconMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CircularIconMenuItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: 70.w,
                maxHeight: 70.w,
              ),
              width: 55.w,
              height: 55.h,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? ColorManager.primary : Colors.grey[300]!,
                  width: isSelected ? 2.5.w : 1.0.w,
                ),
                boxShadow: [
                  if (isSelected)
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      spreadRadius: 1,
                    )
                ],
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: isSelected ? ColorManager.primary : Colors.grey[700],
                  size: 28.sp,
                ),
              ),
            ),
            verticalSpace(8),
            SizedBox(
              width: 80.w,
              child: Text(
                label,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: ColorManager.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 12.sp,
                  height: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
