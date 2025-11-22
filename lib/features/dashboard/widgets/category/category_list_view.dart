import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_items_widget.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({super.key});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  // Menu items for the horizontal scroller (same as previous example)
  final List<Map<String, dynamic>> _menuItems = [
    {'label': 'للبيع', 'icon': Icons.sell, 'index': 0},
    {'label': 'للإيجار', 'icon': Icons.apartment, 'index': 1},
    {'label': 'طلب شراء', 'icon': Icons.vpn_key, 'index': 2},
    {'label': 'طلب إيجار', 'icon': Icons.location_city, 'index': 3},
    {'label': 'للبدل', 'icon': Icons.swap_vert, 'index': 4},
  ];

  int _selectedIndex = 0;

  // Reverse to match RTL visual order

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        height: 80.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _menuItems.length,
          itemBuilder: (context, index) {
            final category = _menuItems[index];
            final isSelected = index == _selectedIndex;

            return Padding(
              padding: EdgeInsets.only(
                left: 16.0.w,
                right: index == _menuItems.length - 1 ? 16.0 : 0,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                    // Add filtering logic here
                  });
                },
                child: CircularIconMenuItem(
                  label: category['label'] as String,
                  icon: category['icon'] as IconData,
                  isSelected: isSelected,
                  onTap: () {},
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
