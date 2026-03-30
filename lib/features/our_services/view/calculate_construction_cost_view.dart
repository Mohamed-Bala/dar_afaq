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
import '../widget/calculate_construction_cost_blocListener.dart';

class CalculateConstructionCostView extends StatefulWidget {
  const CalculateConstructionCostView({super.key});

  @override
  State<CalculateConstructionCostView> createState() =>
      _CalculateConstructionCostViewState();
}

class _CalculateConstructionCostViewState
    extends State<CalculateConstructionCostView> {
  void _calculate(BuildContext context) {
    if (context
        .read<CalculateConstructionCostCubit>()
        .formKey
        .currentState!
        .validate()) {
      context
          .read<CalculateConstructionCostCubit>()
          .emitCalculateConstructionCost();
    }
  }

  final TextEditingController areaController = TextEditingController();
  String? selectedLocation;
  String? selectedPosition;
  String? selectedAge;
  String? selectedFinishing;
  String? selectedExtra;
  double calculationResult = 0.0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<CalculateConstructionCostCubit>(),
      child: Builder(builder: (context) {
        final cubit = context.read<CalculateConstructionCostCubit>();
        return Scaffold(
          backgroundColor: ColorManager.white,
          appBar: AppBar(
            title: Text('حاسبة ميزانية البناء التفصيلية'),
            backgroundColor: ColorManager.white,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(20.0.h),
            child: Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLabel('إجمالي المسطحات (م²)'),
                  AppTextFormField(
                    controller: cubit.buildingArea,
                    hintText: ' مثال 1200',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.pleaseEnterValue.tr();
                      }
                      return null;
                    },
                  ),
                  verticalSpace(10),
                  buildLabel('الهيكل'),
                  AppTextFormField(
                    controller: cubit.structureType,
                    hintText: ' مثال 1200',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.pleaseEnterValue.tr();
                      }
                      return null;
                    },
                  ),
                  // buildDropdown(
                  //   hint: "أسود عادي",
                  //   items: ["سيغما وتكسية خارجية -  ", "هوردي عازل", "أسود عادي"],
                  //   onChanged: (val) {
                  //     setState(() => selectedLocation = val);
                  //   },
                  // ),
                  verticalSpace(10),
                  buildLabel("نوع التشطيب"),
                  buildDropdown(
                    hint: "اقتصادي",
                    items: ["سوبر ديلوكس فاخر", "ديلوكس", "اقتصادي"],
                    onChanged: (val) {
                      setState(() => cubit.finishingType = val as int?);
                    },
                  ),
                  verticalSpace(10),
                  buildLabel("نظام التكييف"),
                  buildDropdown(
                    hint: "وحدات منفصلة",
                    items: ["مركزي توفير طاقة", "مركزي", "وحدات منفصلة"],
                    onChanged: (val) {
                      (val) => setState(() => cubit.acType = val);
                    },
                  ),
                  verticalSpace(10),
                  buildLabel("تأسيس المصاعد"),
                  buildDropdown(
                    hint: "بدون مصعد",
                    items: [
                      "مصعدين (الأدوارالمتعددة)",
                      "مصعد واحد (3أدوار)",
                      "بدون مصعد"
                    ],
                    onChanged: (val) {
                      setState(() => cubit.elevators = val as int?);
                    },
                  ),
                  verticalSpace(10),
                  buildLabel("الأعمال الصحية والكهربائية"),
                  buildDropdown(
                    hint: "تأسيس عادي",
                    items: [
                      "أنظمة ذكية",
                      "تأسيس معلق (عدساني/بابيرز)",
                      "تأسيس عادي"
                    ],
                    onChanged: (val) {
                      setState(() => cubit.plumbingType = val as int?);
                    },
                  ),
                  verticalSpace(10),
                  buildLabel("نظام السرداب (إن وجد)"),
                  buildDropdown(
                    hint: "لا يوجد سرداب",
                    items: [
                      "سرداب مع حفر عميق وعزل",
                      "سرداب عادي",
                      "لا يوجد سرداب"
                    ],
                    onChanged: (val) {
                      setState(() => selectedExtra = val);
                    },
                  ),
                  verticalSpace(30),
                  BlocBuilder<CalculateConstructionCostCubit,
                      CalculateConstructionCostState>(
                    builder: (context, state) {
                      final isLoading =
                          state is CalculateConstructionCostLoading;

                      return !isLoading
                          ? AppTextButton(
                              buttonText: "تقدير ميزانية البناء الاجمالية",
                              textStyle: TextStyle(
                                  fontSize: 18.sp, color: Colors.white),
                              onPressed: () {
                                _calculate(context);
                              },
                            )
                          : Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                    },
                  ),
                  CalculateConstructionCostBloclistener(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
