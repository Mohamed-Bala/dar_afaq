import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../services_grid.dart';

class SectionServices {
  final IconData icon;
  final String label;
  final List<SubCategoryModel> subCategories;

  SectionServices({
    required this.label,
    required this.icon,
    required this.subCategories,
  });
}

final List<SectionServices> sectionServicesList = [
  SectionServices(
    icon: Icons.home,
    label: 'عقارات للبيع',
    subCategories: [
      SubCategoryModel(title: "بيت للبيع", icon: Icons.domain),
      SubCategoryModel(title: "عماره او ادوار", icon: Icons.home),
      SubCategoryModel(title: "شقة للبيع", icon: Icons.door_front_door),
      SubCategoryModel(title: "استراحه", icon: Icons.bungalow),
      SubCategoryModel(title: "شاليه للبيع", icon: Icons.storefront),
      SubCategoryModel(title: "مزارع للبيع", icon: Icons.agriculture),
      SubCategoryModel(title: "ارض للبيع", icon: Icons.landscape),
      SubCategoryModel(title: "قسيمه سكنيه", icon: Icons.factory),
      SubCategoryModel(title: "قسيمه استثماريه", icon: Icons.layers),
      SubCategoryModel(title: "محل للبيع", icon: Icons.store),
      SubCategoryModel(title: "شركات للبيع", icon: Icons.business),
    ],
  ),
  SectionServices(
    icon: Icons.vpn_key,
    label: 'عقارات للإيجار',
    subCategories: [
      SubCategoryModel(title: "بيت للإيجار", icon: Icons.domain),
      SubCategoryModel(title: "دور كامل", icon: Icons.home),
      SubCategoryModel(
          title: "شقة مفروشة للإيجار", icon: Icons.door_front_door),
      SubCategoryModel(title: "شقة للإيجار دوبليكس", icon: Icons.bungalow),
      SubCategoryModel(title: "محل للإيجار", icon: Icons.storefront),
      SubCategoryModel(title: "مكتب", icon: Icons.business_center),
      SubCategoryModel(title: "مخازن", icon: Icons.warehouse),
      SubCategoryModel(title: "مزارع للإيجار", icon: Icons.agriculture),
      SubCategoryModel(title: "قسيمه صناعيه", icon: Icons.factory),
      SubCategoryModel(title: "استراحه للإيجار", icon: Icons.holiday_village),
      SubCategoryModel(title: "شاليه للإيجار", icon: Icons.store),
    ],
  ),
  SectionServices(
    icon: Icons.sync,
    label: 'عقار للبدل',
    subCategories: [
      SubCategoryModel(title: "تبادل بيت", icon: Icons.apartment),
    ],
  ),
  SectionServices(
    icon: Icons.engineering,
    label: 'مقاولون',
    subCategories: [
      SubCategoryModel(title: "خدمات البناء", icon: Icons.construction),
      SubCategoryModel(title: "خدمات التشطيب", icon: Icons.format_paint),
    ],
  ),
  SectionServices(
    icon: Icons.business,
    label: 'مكاتب عقارية',
    subCategories: [
      SubCategoryModel(title: "مكاتب مجهزة", icon: Icons.settings_suggest),
    ],
  ),
  SectionServices(
    icon: Icons.public,
    label: 'العقارات الدولية',
    subCategories: [
      SubCategoryModel(title: "عقار دولي", icon: Icons.language),
    ],
  ),
  SectionServices(
    icon: Icons.architecture,
    label: 'مكاتب هندسية',
    subCategories: [
      SubCategoryModel(title: "تصميم معماري", icon: Icons.architecture),
      SubCategoryModel(title: "تصميم هندسي", icon: Icons.layers),
      SubCategoryModel(title: "إشراف ومتابعة", icon: Icons.remove_red_eye),
    ],
  ),
];

Widget buildSectionItem(BuildContext context, SectionServices item,
    List<SubCategoryModel> subOptions // أضفنا هذا البارامتر لجعله ديناميكياً
    ) {
  return Material(
    color: Colors.white,
    elevation: 4,
    borderRadius: BorderRadius.circular(15.0.r),
    child: InkWell(
      // أفضل من GestureDetector لإعطاء تأثير النقر (Ripple Effect)
      borderRadius: BorderRadius.circular(15.0.r),
      onTap: () {
        // نمرر العنوان والخيارات الخاصة بهذا القسم تحديداً
        showAnimatedOptions(context, item.label, subOptions);
      },
      child: Container(
        width: 90.w,
        height: 75.h,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              item.icon,
              size: 25.sp,
              color: ColorManager.primary,
            ),
            SizedBox(height: 8.h),
            Text(
              item.label,
              textAlign: TextAlign.center,
              maxLines: 2, // لمنع تمدد النص وتخريب التصميم
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: ColorManager.black,
                fontWeight: FontWeight.bold,
                fontSize: 12.sp, // صغرنا الخط قليلاً ليتناسب مع العرض
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
