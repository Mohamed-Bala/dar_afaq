import 'package:dar_afaq/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

import 'build_gridItem.dart';

// (Paste the ServiceItem class and realEstateServices list here)
// ...

class ServicesGrid extends StatelessWidget {
  const ServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('الأقسام'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: realEstateServices.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final item = realEstateServices[index];
            return buildGridItem(
                item, ColorManager.iconColor, ColorManager.itemBackgroundColor);
          },
        ),
      ),
    );
  }
}
