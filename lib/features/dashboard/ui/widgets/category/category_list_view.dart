import 'package:afaq_real_estate/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/routing/routes.dart';
import 'category_items_widget.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({super.key});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  // Menu items for the horizontal scroller (same as previous example)
  final List<Map<String, dynamic>> _menuItems = [
    {
      'label': "rent_calc",
      'icon': Icons.calculate_outlined,
      'index': 0,
      'route': Routes.calculationCostRoute,
    },
    {
      'label': "build_calc",
      'icon': Icons.construction,
      'index': 1,
      'route': Routes.rentCalculationRoute,
    },
    {
      'label': "valuation",
      'icon': Icons.calendar_month,
      'index': 2,
      'route': Routes.officialRequestRoute,
    },
    {
      'label': "property_mgmt",
      'icon': Icons.apartment,
      'index': 3,
      'route': Routes.managingOthersPropertiesRoute,
    },
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    String currentLang = Localizations.localeOf(context).languageCode;

    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _menuItems.length,
        itemBuilder: (context, index) {
          final category = _menuItems[index];
          final isSelected = index == _selectedIndex;
          final String localizedLabel = AppStrings.getString(
            category['label'] as String,
            currentLang,
          );
          return Padding(
            padding: EdgeInsets.only(
              left: 16.0.w,
              right: index == _menuItems.length - 1 ? 16.0 : 0,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: CircularIconMenuItem(
                label: localizedLabel,
                icon: category['icon'] as IconData,
                isSelected: isSelected,
                onTap: () {
                  AuthGuard.runAction(context, onAuthenticated: () {
                    if (category['route'] != null) {
                      context.pushNamed(category['route'] as String);
                    }
                  });

                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
