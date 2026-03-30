import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/di/di.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/app_text_form_field.dart';
import '../../dashboard/logic/home_cubit.dart';
import '../../dashboard/logic/home_state.dart';
import '../widget/build_dropdown.dart';
import '../widget/build_label.dart';
import '../widget/calculate_market_value_blocListener.dart';

class CalculateMarketValueView extends StatefulWidget {
  const CalculateMarketValueView({super.key});

  @override
  State<CalculateMarketValueView> createState() =>
      _CalculateMarketValueViewState();
}

class _CalculateMarketValueViewState extends State<CalculateMarketValueView> {
  String? selectedLocation;
  String? selectedFeature;

  void _calculate(BuildContext context) {
    if (context
        .read<CalculateMarketValueCubit>()
        .formKey
        .currentState!
        .validate()) {
      context.read<CalculateMarketValueCubit>().emitCalculateMarketValue();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<CalculateMarketValueCubit>(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<CalculateMarketValueCubit>();
          return Scaffold(
            backgroundColor: ColorManager.white,
            appBar: AppBar(
              title: Text(AppStrings.calculatorTitle.tr()),
              backgroundColor: ColorManager.white,
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(20.0.h),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Land Size
                    buildLabel(AppStrings.landArea.tr()),
                    AppTextFormField(
                      controller: cubit.areaController,
                      hintText: AppStrings.example400.tr(),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.pleaseEnterValue.tr();
                        }
                        return null;
                      },
                    ),
                    verticalSpace(10),
                    // Location Dropdown
                    buildLabel(AppStrings.geographicLocation.tr()),
                    AppTextFormField(
                      controller: cubit.location,
                      hintText: AppStrings.locationHint.tr(),
                      keyboardType: TextInputType.text,
                      validator: (value) =>
                          value == null ? "مطلوب اختيار منطقة" : null,
                    ),

                    verticalSpace(10),
                    // Position
                    buildLabel(AppStrings.plotPosition.tr()),
                    AppTextFormField(
                      controller: cubit.position,
                      hintText: AppStrings.oneStreet.tr(),
                      keyboardType: TextInputType.text,
                      validator: (value) =>
                          value == null ? "مطلوب اختيار الموقع" : null,
                    ),
                    verticalSpace(10),
                    // Building Age
                    buildLabel(AppStrings.buildingAge.tr()),
                    AppTextFormField(
                      controller: cubit.buildingAge,
                      hintText: AppStrings.newAge.tr(),
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          value == null || value.isEmpty ? "مطلوب" : null,
                    ),
                    verticalSpace(10),
                    // Finishing Level
                    buildLabel(AppStrings.finishingType.tr()),
                    AppTextFormField(
                      controller: cubit.finishingLevel,
                      hintText: AppStrings.vacantLand.tr(),
                      keyboardType: TextInputType.text,
                      validator: (value) =>
                          value == null || value.isEmpty ? "مطلوب" : null,
                    ),
                    verticalSpace(10),
                    // Features Dropdown
                    buildLabel(AppStrings.extraFeatures.tr()),
                    buildDropdown(
                      hint: AppStrings.none.tr(),
                      items: ["لا يوجد", "حمام سباحة", "حديقة"],
                      onChanged: (val) {
                        setState(() {
                          selectedFeature = val;
                          cubit.features = val != null ? [val] : [];
                        });
                      },
                    ),

                    verticalSpace(30),
                    BlocBuilder<CalculateMarketValueCubit,
                        CalculateMarketValueState>(
                      builder: (context, state) {
                        final isLoading = state is CalculateMarketValueLoading;
                        return !isLoading
                            ? AppTextButton(
                                buttonText: AppStrings.calculateNow.tr(),
                                textStyle: TextStyle(
                                    fontSize: 18.sp, color: Colors.white),
                                onPressed: () {
                                  _calculate(context);
                                },
                              )
                            : Center(
                                child: CircularProgressIndicator.adaptive());
                      },
                    ),
                    CalculateMarketValueBlocListener(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
