import 'package:afaq_real_estate/core/helper/extensions.dart';
import 'package:afaq_real_estate/core/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/helper/spacing.dart';
import '../../../../../../../core/resources/styles_manager.dart';
import '../../../../../../../core/routing/routes.dart';
import '../../../../../../../core/widgets/app_text_button.dart';
import '../../../../../../../core/widgets/search_widget.dart';
import '../../../../../logic/home_cubit.dart';
import '../../../../widgets/build_gridItem.dart';
import '../../../../widgets/sections/section_services.dart';

class PackageSelection extends StatefulWidget {
  const PackageSelection({super.key});

  @override
  State<PackageSelection> createState() => _PackageSelectionState();
}

class _PackageSelectionState extends State<PackageSelection>
    with SingleTickerProviderStateMixin {
  int? _selectedAdTypeIndex;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(10),
        SearchWidget(
          context,
          onTap: () {
            context.read<NavigationCubit>().changeIndex(1);
          },
        ),
        verticalSpace(20),
        Expanded(
          child: GridView.builder(
            itemCount: sectionServicesList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              final item = sectionServicesList[index];

              final animation = Tween<double>(begin: 0, end: 1).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: Interval(
                    (index / sectionServicesList.length),
                    1,
                    curve: Curves.easeOut,
                  ),
                ),
              );

              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: animation,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedAdTypeIndex = index;
                      });
                    },
                    child: buildGridItem(
                      item,
                      _selectedAdTypeIndex == index,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        if (_selectedAdTypeIndex != null)
          Center(
            child: AppTextButton(
              buttonText: AppStrings.addAd.tr(),
              buttonWidth: 250.w,
              textStyle: StylesManager.font16White,
              onPressed: () async {
                if (_selectedAdTypeIndex != null) {
                  AuthGuard.runAction(context, onAuthenticated: () {
                    _navigateToForm(context);
                  });
                }
              },
            ),
          ),
        verticalSpace(100),
      ],
    );
  }

  // دالة مساعدة للانتقال لتقليل تكرار الكود
  void _navigateToForm(BuildContext context) {
    final selectedItem = sectionServicesList[_selectedAdTypeIndex!];
    context.pushNamed(
      Routes.addRoute,
      arguments: selectedItem,
    );
  }
}
