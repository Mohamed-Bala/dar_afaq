import 'package:flutter/material.dart';

import '../../../../../../../core/resources/color_manager.dart';

Widget buildPackageBanner({required String packageName}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    decoration: BoxDecoration(
      color: ColorManager.primary.withOpacity(.1),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Text(
        //   'السعر: $price',
        //   style: TextStyle(
        //     fontSize: 16,
        //     fontWeight: FontWeight.bold,
        //     color: ColorManager.primary,
        //   ),
        // ),
        Text(
          packageName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: ColorManager.primary,
          ),
        ),
      ],
    ),
  );
}
