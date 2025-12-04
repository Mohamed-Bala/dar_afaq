import 'package:flutter/material.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/resources/color_manager.dart';
import '../widgets/ads/ads_List_view_widget.dart';
import '../widgets/build_filter_widget.dart';
import '../widgets/build_gridItem.dart';

class AdsView extends StatelessWidget {
  const AdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: realEstateServices.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (context, index) {
              final item = realEstateServices[index];
              return buildGridItem(item, ColorManager.iconColor,
                  ColorManager.itemBackgroundColor);
            },
          ),
          verticalSpace(10),
          const FilterWidget(),
          verticalSpace(10),
          AdsListViewWidget(),
        ],
      ),
    );
  }
}
