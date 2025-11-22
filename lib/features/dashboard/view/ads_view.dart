import 'package:flutter/material.dart';

import '../../../core/helper/spacing.dart';
import '../widgets/ads/ads_List_view_widget.dart';
import '../widgets/build_filter_widget.dart';

class AdsView extends StatelessWidget {
  const AdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const FilterWidget(),
          verticalSpace(10),
          AdsListViewWidget(),
        ],
      ),
    );
  }
}
