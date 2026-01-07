import 'package:dar_afaq/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/helper/spacing.dart';
import '../../../../../../../core/resources/styles_manager.dart';
import '../../../../../../../core/routing/routes.dart';
import '../../../../../../../core/widgets/app_text_button.dart';
import '../../../../widgets/build_gridItem.dart';
import '../../../../widgets/sections/section_services.dart';

class PackageSelection extends StatefulWidget {
  const PackageSelection({super.key});

  @override
  State<PackageSelection> createState() => _PackageSelectionState();
}

class _PackageSelectionState extends State<PackageSelection> {
  int? _selectedAdTypeIndex;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sectionServicesList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              itemBuilder: (context, index) {
                final item = sectionServicesList[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedAdTypeIndex = index;
                    });
                  },
                  child: buildGridItem(
                    item,
                    _selectedAdTypeIndex == index,
                  ),
                );
              },
            ),
            verticalSpace(90),
            if (_selectedAdTypeIndex != null)
              Center(
                child: AppTextButton(
                  buttonText: "اضافة اعلان",
                  buttonWidth: 250.w,
                  textStyle: StylesManager.font16White,
                  onPressed: () {
                    if (_selectedAdTypeIndex != null) {
                      final selectedItem =
                          sectionServicesList[_selectedAdTypeIndex!];

                     // print("Sending Title: ${selectedItem.label}");

                      context.pushNamed(
                        Routes.addRoute,
                        arguments: selectedItem.label,
                      );
                    }
                  },
                ),
              ),
            verticalSpace(40),
          ],
        ),
      ),
    );
  }
}
