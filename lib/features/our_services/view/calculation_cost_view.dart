import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/di/di.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/app_text_form_field.dart';
import '../../dashboard/logic/home_cubit.dart';
import '../../dashboard/logic/home_state.dart';
import '../widget/build_dropdown.dart';
import '../widget/build_label.dart';

class CalculationCostView extends StatefulWidget {
  const CalculationCostView({super.key});

  @override
  State<CalculationCostView> createState() => _CalculationCostViewState();
}

class _CalculationCostViewState extends State<CalculationCostView> {
  final _formKey = GlobalKey<FormState>();
  // Controllers & Selection Variables
  final TextEditingController areaController = TextEditingController();
  String? selectedLocation;
  String? selectedPosition;
  String? selectedAge;
  String? selectedFinishing;
  String? selectedExtra;
  double calculationResult = 0.0;
  void _calculateAndShowAlert(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      double enteredValue = double.tryParse(areaController.text) ?? 0.0;

      double calculationResult = enteredValue * 800;

      String formattedValue =
          NumberFormat.decimalPattern().format(calculationResult);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text(
              AppStrings.calculationResult.tr(),
              textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.estimatedValue.tr(),
                  style: StylesManager.font18BlackBold,
                ),
                verticalSpace(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.currency.tr(),
                      style: StylesManager.font24Black700Weight.copyWith(
                        color: ColorManager.primary,
                      ),
                    ),
                    horizontalSpace(8),
                    Text(formattedValue,
                        style: StylesManager.font24Black700Weight.copyWith(
                          color: ColorManager.primary,
                        )),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  AppStrings.close.tr(),
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        title: Text(AppStrings.calculatorTitle.tr()),
        backgroundColor: ColorManager.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildLabel(AppStrings.landArea.tr()),
              AppTextFormField(
                controller: areaController,
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
              buildLabel(AppStrings.geographicLocation.tr()),
              BlocProvider(
                create: (context) => di<AddAdvertisementCubit>(),
                child:
                    BlocBuilder<AddAdvertisementCubit, AddAdvertisementState>(
                  builder: (context, state) {
                    return buildDropdown(
                      hint: AppStrings.locationHint.tr(),
                      items: context.watch<AddAdvertisementCubit>().regions,
                      onChanged: (val) =>
                          setState(() => selectedLocation = val),
                    );
                  },
                ),
              ),
              verticalSpace(10),
              buildLabel(AppStrings.plotPosition.tr()),
              buildDropdown(
                hint: AppStrings.oneStreet.tr(),
                items: ["شارع واحد", "زاوية", "بطن وظهر"],
                onChanged: (val) {
                  setState(() => selectedPosition = val);
                },
              ),
              verticalSpace(10),
              buildLabel(AppStrings.buildingAge.tr()),
              buildDropdown(
                hint: AppStrings.newAge.tr(),
                items: ["جديد (0-3 سنوات)", "متوسط (4-10 سنوات)", "قديم"],
                onChanged: (val) {
                  (val) => setState(() => selectedAge = val);
                },
              ),
              verticalSpace(10),
              buildLabel(AppStrings.finishingType.tr()),
              buildDropdown(
                hint: AppStrings.vacantLand.tr(),
                items: ["أرض فضاء", "سوبر لوكس", "عادي"],
                onChanged: (val) {
                  setState(() => selectedFinishing = val);
                },
              ),
              verticalSpace(10),
              buildLabel(AppStrings.extraFeatures.tr()),
              buildDropdown(
                hint: AppStrings.none.tr(),
                items: ["لا يوجد", "حمام سباحة", "حديقة"],
                onChanged: (val) {
                  setState(() => selectedExtra = val);
                },
              ),
              verticalSpace(30),
              AppTextButton(
                buttonText: AppStrings.calculateNow.tr(),
                textStyle: TextStyle(fontSize: 18, color: Colors.white),
                onPressed: () {
                  _calculateAndShowAlert(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
