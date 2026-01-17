import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/app_text_form_field.dart';
import '../widget/build_dropdown.dart';
import '../widget/build_label.dart';

class BudgetCalculatorView extends StatefulWidget {
  const BudgetCalculatorView({super.key});

  @override
  State<BudgetCalculatorView> createState() => _BudgetCalculatorViewState();
}

class _BudgetCalculatorViewState extends State<BudgetCalculatorView> {
  final _formKey = GlobalKey<FormState>();
  // Controllers & Selection Variables
  final TextEditingController areaController = TextEditingController();
  String? selectedLocation;
  String? selectedPosition;
  String? selectedAge;
  String? selectedFinishing;
  String? selectedExtra;
  double calculationResult = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        title: Text('حاسبة ميزانية البناء التفصيلية'),
        backgroundColor: ColorManager.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildLabel('إجمالي المسطحات (م²)'),
              AppTextFormField(
                controller: areaController,
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
              buildLabel('الهيكل (الأسود)'),
              buildDropdown(
                hint: "أسود عادي",
                items: ["سيغما وتكسية خارجية -  ", "هوردي عازل", "أسود عادي"],
                onChanged: (val) {
                  setState(() => selectedLocation = val);
                },
              ),
              verticalSpace(10),
              buildLabel("نوع التشطيب"),
              buildDropdown(
                hint: "اقتصادي",
                items: ["سوبر ديلوكس فاخر", "ديلوكس", "اقتصادي"],
                onChanged: (val) {
                  setState(() => selectedPosition = val);
                },
              ),
              verticalSpace(10),
              buildLabel("نظام التكييف"),
              buildDropdown(
                hint: "وحدات منفصلة",
                items: ["مركزي توفير طاقة", "مركزي", "وحدات منفصلة"],
                onChanged: (val) {
                  (val) => setState(() => selectedAge = val);
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
                  setState(() => selectedFinishing = val);
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
                  setState(() => selectedExtra = val);
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
              AppTextButton(
                buttonText: "تقدير ميزانية البيناء الاجمالية",
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
              'إجمالي التكلفة التقديرية (على المفتاح)',
              textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'شاملة (الهيكل، التشطيب، التكييف، الصحي، والمصاعد)',
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
}
