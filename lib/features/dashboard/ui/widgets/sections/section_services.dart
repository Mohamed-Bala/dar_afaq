import 'package:afaq_real_estate/core/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
              title: AppStrings.apartmentForRent.tr(), icon: Icons.apartment),
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
      // Start engineering Widget
      SectionServices(
        icon: Icons.engineering,
        label: AppStrings.contractors.tr(),
        dbValue: "مقاولات",
        subCategories: [
          SubCategoryModel(
            title: AppStrings.plumbing.tr(),
            icon: Icons.plumbing,
          ),
          SubCategoryModel(
            title: AppStrings.locks.tr(),
            icon: Icons.lock,
          ),
          SubCategoryModel(
            title: AppStrings.sanitaryContractor.tr(),
            icon: Icons.handyman,
          ),
          SubCategoryModel(
            title: AppStrings.pestControl.tr(),
            icon: Icons.bug_report,
          ),
          SubCategoryModel(
            title: AppStrings.gardens.tr(),
            icon: Icons.grass,
          ),
          SubCategoryModel(
            title: AppStrings.decor.tr(),
            icon: Icons.design_services,
          ),
          SubCategoryModel(
            title: AppStrings.paint.tr(),
            icon: Icons.format_paint,
          ),
          SubCategoryModel(
            title: AppStrings.airConditioning.tr(),
            icon: Icons.ac_unit,
          ),
          SubCategoryModel(
            title: AppStrings.blacksmith.tr(),
            icon: Icons.construction,
          ),
          SubCategoryModel(
            title: AppStrings.carpenter.tr(),
            icon: Icons.carpenter,
          ),
          SubCategoryModel(
            title: AppStrings.electrician.tr(),
            icon: Icons.electrical_services,
          ),
          SubCategoryModel(
            title: AppStrings.applianceRepair.tr(),
            icon: Icons.build,
          ),
          SubCategoryModel(
            title: AppStrings.buildingContracting.tr(),
            icon: Icons.home_work,
          ),
          SubCategoryModel(
            title: AppStrings.aluminum.tr(),
            icon: Icons.window,
          ),
          SubCategoryModel(
            title: AppStrings.insulation.tr(),
            icon: Icons.layers,
          ),
          SubCategoryModel(
            title: AppStrings.tilesCeramic.tr(),
            icon: Icons.grid_view,
          ),
          SubCategoryModel(
            title: AppStrings.ventilation.tr(),
            icon: Icons.air,
          ),
          SubCategoryModel(
            title: AppStrings.elevators.tr(),
            icon: Icons.elevator,
          ),
          SubCategoryModel(
            title: AppStrings.doors.tr(),
            icon: Icons.door_front_door,
          ),
          SubCategoryModel(
            title: AppStrings.glassTechnician.tr(),
            icon: Icons.crop_square,
          ),
          SubCategoryModel(
            title: AppStrings.buildingMaterials.tr(),
            icon: Icons.inventory,
          ),
          SubCategoryModel(
            title: AppStrings.agriculturalProducts.tr(),
            icon: Icons.eco,
          ),
          SubCategoryModel(
            title: AppStrings.waterTanks.tr(),
            icon: Icons.water_drop,
          ),
        ],
      ),
      // End engineering Widget
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
        icon: Icons.work_outline,
        label: AppStrings.jobs.tr(),
        dbValue: " وظائف",
        subCategories: [
          SubCategoryModel(
            title: AppStrings.vacancies.tr(),
            icon: Icons.add_business,
          ),
          SubCategoryModel(
            title: AppStrings.jobSeeker.tr(),
            icon: Icons.person_search,
          ),
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
    List<SubCategoryModel> subOptions) {
  return GestureDetector(
    onTap: () {
      showAnimatedOptions(context, item.label, subOptions);
    },
    child: Column(
      children: [
        Stack(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                item.icon,
              ),
            ),
          ],
        ),
        SizedBox(height: 6),
        Text(
          item.label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ],
    ),
  );
}
