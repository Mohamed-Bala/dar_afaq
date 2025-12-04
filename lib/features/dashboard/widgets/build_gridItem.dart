import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/color_manager.dart';

Widget buildGridItem(
    ServiceItem item, Color iconColor, Color itemBackgroundColor) {
  return Material(
    color: Colors.white,
    elevation: 4, // Shadow effect
    borderRadius: BorderRadius.circular(15.0.r),
    child: Container(
      // width: 90.w,
      // height: 90.h,
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
                color: ColorManager.primary,
              ),
              Positioned(
                bottom: -6,
                right: -20,
                child: Container(
                  padding: EdgeInsets.all(2.h),
                  decoration: BoxDecoration(
                    color: itemBackgroundColor,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Icon(
                    Icons.calculate,
                    size: 14.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Text(
            item.label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorManager.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

class ServiceItem {
  final IconData icon;
  final String label;

  ServiceItem({required this.icon, required this.label});
}

// List of all services (based on the provided image)
final List<ServiceItem> realEstateServices = [
  ServiceItem(
      icon: Icons.home, label: 'عقار للبيع'), // Real Estate for Sale (Top Left)
  ServiceItem(icon: Icons.sync_alt, label: 'بدل'), // Exchange / Swap
  ServiceItem(
      icon: Icons.vpn_key, label: 'عقار للإيجار'), // Real Estate for Rent
  // ServiceItem(
  //     icon: Icons.attach_money,
  //     label:
  //         'عقار للبيع'), // Real Estate for Sale (Duplicate label, different icon)
  ServiceItem(icon: Icons.construction, label: 'المقاولون'), // Contractors
  ServiceItem(
      icon: Icons.check_box_outlined,
      label: 'إدارة أملاك الغير'), // Third-Party Property Management
  ServiceItem(icon: Icons.business, label: 'مكتب عقاري'), // Real Estate Office
  ServiceItem(
      icon: Icons.public, label: 'عقار دولي'), // International Real Estate
  ServiceItem(
      icon: Icons.gavel, label: 'مزاد'), // Auction (Lower Row, Center-Left)
  ServiceItem(
      icon: Icons.architecture,
      label:
          'المكاتب الهندسية'), // Engineering Offices (Lower Row, Center-Right)
];
