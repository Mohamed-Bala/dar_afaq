import 'package:dar_afaq/core/resources/color_manager.dart';
import 'package:dar_afaq/core/widgets/app_text_button.dart';
import 'package:dar_afaq/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../core/helper/spacing.dart';
import '../../core/resources/styles_manager.dart';

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
            title: const Text(
              "نتجية الحساب",
              textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "القيمة التقديرية للعقار",
                  style: StylesManager.font18BlackBold,
                ),
                verticalSpace(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "د.ك",
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
                child: const Text(
                  "إغلاق",
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
        title: const Text("حاسبة القيمة السوقية العادلة"),
        backgroundColor: ColorManager.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel("مساحة الأرض (م²)"),
              AppTextFormField(
                controller: areaController,
                hintText: 'مثال 400',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال القيمة';
                  }
                  return null;
                },
              ),
              verticalSpace(10),
              _buildLabel("الموقع الجغرافي"),
              _buildDropdown(
                hint: "العاصمة - مناطق داخلية",
                items: ["العاصمة - مناطق داخلية", "حولي", "الفروانية"],
                onChanged: (val) {
                  setState(() => selectedLocation = val);
                },
              ),
              verticalSpace(10),
              _buildLabel("موقع القسيمة والارتداد"),
              _buildDropdown(
                hint: "شارع واحد",
                items: ["شارع واحد", "زاوية", "بطن وظهر"],
                onChanged: (val) {
                  setState(() => selectedPosition = val);
                },
              ),
              verticalSpace(10),
              _buildLabel("عمر البناء"),
              _buildDropdown(
                hint: "جديد (0-3 سنوات)",
                items: ["جديد (0-3 سنوات)", "متوسط (4-10 سنوات)", "قديم"],
                onChanged: (val) {
                  (val) => setState(() => selectedAge = val);
                },
              ),
              verticalSpace(10),
              _buildLabel("نوع ومستوى التشطيب"),
              _buildDropdown(
                hint: 'أرض فضاء',
                items: ["أرض فضاء", "سوبر لوكس", "عادي"],
                onChanged: (val) {
                  setState(() => selectedFinishing = val);
                },
              ),
              verticalSpace(10),
              _buildLabel("المميزات الإضافية"),
              _buildDropdown(
                hint: 'لايوجد',
                items: ["لا يوجد", "حمام سباحة", "حديقة"],
                onChanged: (val) {
                  setState(() => selectedExtra = val);
                },
              ),
              verticalSpace(30),
              AppTextButton(
                buttonText: 'احسب القيمة الآن',
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

  // Helper Widget for Labels
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: ColorManager.black,
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String hint,
    required List<String> items,
    required Function(String?) onChanged,
    String? value,
    String? Function(String?)? validator,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
        hintText: hint,
        hintStyle: StylesManager.font12GrayRegular,
        fillColor: ColorManager.lighterGray,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorManager.lighterGray,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      icon: Icon(Icons.keyboard_arrow_down, color: ColorManager.grey),
      style: StylesManager.font12GrayRegular,
      hint: Text(hint, style: StylesManager.font12GrayRegular),
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
      validator: validator ??
          (value) {
            return null;
          },
    );
  }
}
