import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';

class SectionServices {
  final IconData icon;
  final String label;

  SectionServices({required this.icon, required this.label});
}

final List<SectionServices> sectionServicesList = [
  SectionServices(icon: Icons.home, label: 'عقار للبيع'),
  SectionServices(icon: Icons.sync_alt, label: 'بدل'),
  SectionServices(icon: Icons.vpn_key, label: 'عقار للإيجار'),
  SectionServices(icon: Icons.construction, label: 'المقاولون'),
  SectionServices(icon: Icons.check_box_outlined, label: 'إدارة أملاك الغير'),
  SectionServices(icon: Icons.business, label: 'مكتب عقاري'),
  SectionServices(icon: Icons.public, label: 'عقار دولي'),
  SectionServices(icon: Icons.gavel, label: 'مزاد'),
  SectionServices(icon: Icons.architecture, label: 'المكاتب الهندسية'),
];

Widget buildSectionItem(SectionServices item) {
  return Material(
    color: Colors.white,
    elevation: 4,
    borderRadius: BorderRadius.circular(15.0),
    child: Container(
      width: 90.w,
      height: 75.h,
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Icon(
                item.icon,
                size: 25.sp,
                color: ColorManager.primary,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            item.label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorManager.black,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    ),
  );
}
