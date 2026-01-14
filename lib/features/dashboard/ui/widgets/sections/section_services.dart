import 'package:afaq_real_estate/core/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../services_grid.dart';

class SectionServices {
  final IconData icon;
  final String label;
  final String dbValue;

  final List<SubCategoryModel> subCategories;

  SectionServices({
    required this.label,
    required this.icon,
    required this.subCategories,
    required this.dbValue,
  });
}

List<SectionServices> get sectionServicesList => [
      SectionServices(
        icon: Icons.home,
        label: AppStrings.forSale.tr(),
        dbValue: "عقارات للبيع",
        subCategories: [
          SubCategoryModel(
              title: AppStrings.houseSale.tr(), icon: Icons.domain),
          SubCategoryModel(
              title: AppStrings.buildingFloors.tr(), icon: Icons.home),
          SubCategoryModel(
              title: AppStrings.aptSale.tr(), icon: Icons.door_front_door),
          SubCategoryModel(
              title: AppStrings.restHouse.tr(), icon: Icons.bungalow),
          SubCategoryModel(
              title: AppStrings.chaletSale.tr(), icon: Icons.storefront),
          SubCategoryModel(
              title: AppStrings.farmSale.tr(), icon: Icons.agriculture),
          SubCategoryModel(
              title: AppStrings.landSale.tr(), icon: Icons.landscape),
          SubCategoryModel(title: AppStrings.resPlot.tr(), icon: Icons.factory),
          SubCategoryModel(title: AppStrings.invPlot.tr(), icon: Icons.layers),
          SubCategoryModel(title: AppStrings.shopSale.tr(), icon: Icons.store),
          SubCategoryModel(
              title: AppStrings.companySale.tr(), icon: Icons.business),
        ],
      ),
      SectionServices(
        icon: Icons.vpn_key,
        label: AppStrings.forRent.tr(),
        dbValue: "عقارات للإيجار",
        subCategories: [
          SubCategoryModel(
              title: AppStrings.houseRent.tr(), icon: Icons.domain),
          SubCategoryModel(title: AppStrings.fullFloor.tr(), icon: Icons.home),
          SubCategoryModel(
              title: AppStrings.furnishedApt.tr(), icon: Icons.door_front_door),
          SubCategoryModel(
              title: AppStrings.duplexApt.tr(), icon: Icons.bungalow),
          SubCategoryModel(
              title: AppStrings.shopRent.tr(), icon: Icons.storefront),
          SubCategoryModel(
              title: AppStrings.office.tr(), icon: Icons.business_center),
          SubCategoryModel(
              title: AppStrings.warehouse.tr(), icon: Icons.warehouse),
          SubCategoryModel(
              title: AppStrings.farmRent.tr(), icon: Icons.agriculture),
          SubCategoryModel(title: AppStrings.indPlot.tr(), icon: Icons.factory),
          SubCategoryModel(
              title: AppStrings.restHouseRent.tr(),
              icon: Icons.holiday_village),
          SubCategoryModel(
              title: AppStrings.chaletRent.tr(), icon: Icons.store),
        ],
      ),
      SectionServices(
        icon: Icons.sync,
        label: AppStrings.forExchange.tr(),
        dbValue: "عقار للبدل",
        subCategories: [
          SubCategoryModel(
              title: AppStrings.houseExchange.tr(), icon: Icons.apartment),
        ],
      ),
      SectionServices(
        icon: Icons.engineering,
        label: AppStrings.contractors.tr(),
        dbValue: "مقاولون",
        subCategories: [
          SubCategoryModel(
              title: AppStrings.constServices.tr(), icon: Icons.construction),
          SubCategoryModel(
              title: AppStrings.finishingServices.tr(),
              icon: Icons.format_paint),
        ],
      ),
      SectionServices(
        icon: Icons.business,
        label: AppStrings.realEstateOffices.tr(),
        dbValue: "مكاتب عقارية",
        subCategories: [
          SubCategoryModel(
              title: AppStrings.equippedOffices.tr(),
              icon: Icons.settings_suggest),
        ],
      ),
      SectionServices(
        icon: Icons.public,
        label: AppStrings.internationalProperties.tr(),
        dbValue: "العقارات الدولية",
        subCategories: [
          SubCategoryModel(
              title: AppStrings.intlProperty.tr(), icon: Icons.language),
        ],
      ),
      SectionServices(
        icon: Icons.architecture,
        label: AppStrings.engineeringOffices.tr(),
        dbValue: "مكاتب هندسية",
        subCategories: [
          SubCategoryModel(
              title: AppStrings.archDesign.tr(), icon: Icons.architecture),
          SubCategoryModel(
              title: AppStrings.engDesign.tr(), icon: Icons.layers),
          SubCategoryModel(
              title: AppStrings.supervision.tr(), icon: Icons.remove_red_eye),
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
