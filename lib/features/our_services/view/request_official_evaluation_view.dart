import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/constants_manager.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/app_text_form_field.dart';
import '../widget/build_dropdown.dart';
import '../widget/build_label.dart';

class RequestOfficialEvaluationView extends StatefulWidget {
  const RequestOfficialEvaluationView({super.key});

  @override
  State<RequestOfficialEvaluationView> createState() =>
      _RequestOfficialEvaluationViewState();
}

class _RequestOfficialEvaluationViewState
    extends State<RequestOfficialEvaluationView> {
  final _formKey = GlobalKey<FormState>();
  // Controllers & Selection Variables
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  String? selectedLocation;
  String? selectedPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        title: Text('طلب تقييم رسمي معتمد'),
        backgroundColor: ColorManager.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildLabel('اسم مقدم الطلب'),
              AppTextFormField(
                controller: nameController,
                hintText: 'الأسم الكامل',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء ادخال الاسم';
                  }
                  return null;
                },
              ),
              verticalSpace(10),
              buildLabel('الغرض من التقييم'),
              buildDropdown(
                hint: "للبيع والشراء",
                items: [
                  "للبيع والشراء",
                  "للبنك/تمويل عقاري",
                  " حصر ورثة/فرز",
                  "قضايا وتثمين"
                ],
                onChanged: (val) {
                  setState(() => selectedLocation = val);
                },
              ),
              verticalSpace(10),
              buildLabel("رقم التواصل"),
              AppTextFormField(
                controller: phoneController,
                hintText: '965xxxxxxxxxxx',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء ادخال رقم الهاتف';
                  }
                  return null;
                },
              ),
              verticalSpace(10),
              buildLabel("المنطقة والقطعة"),
              AppTextFormField(
                controller: areaController,
                hintText: 'مثال: القبة م4',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء ادخال كتابة المنطقة';
                  }
                  return null;
                },
              ),
              verticalSpace(10),
              buildLabel("نوع العقار"),
              buildDropdown(
                hint: "سكني خاص",
                items: [
                  "سكني خاص",
                  "عماري استثمارية",
                  "تجاري/مجمع",
                  "شاليه/مزرعة"
                ],
                onChanged: (val) {
                  setState(() => selectedPosition = val);
                },
              ),
              verticalSpace(30),
              AppTextButton(
                buttonText: " ارسال الطلب الرسمي عبر واتساب",
                textStyle: TextStyle(fontSize: 18, color: Colors.white),
                onPressed: () {
                  _sendToWhatsApp();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _sendToWhatsApp() async {
    final String purpose = selectedLocation ?? "للبيع والشراء";
    final String propertyType = selectedPosition ?? "سكني خاص";
    // 1. التحقق من صحة جميع الحقول النصية (Validator)
    if (_formKey.currentState!.validate()) {
      if (selectedLocation == null || selectedPosition == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("يرجى اختيار الغرض من التقييم ونوع العقار أولاً"),
            backgroundColor: Colors.orange,
          ),
        );
        return;
      }

      // 3. تجهيز نص الرسالة وتنسيقها بشكل احترافي
      final String message = "السلام عليكم، أريد طلب تقييم رسمي معتمد:\n\n"
          "👤 *اسم مقدم الطلب:* ${nameController.text}\n"
          "📞 *رقم التواصل:* ${phoneController.text}\n"
          "📍 *المنطقة والقطعة:* ${areaController.text}\n"
          "🎯 *الغرض من التقييم:* $purpose\n"
          "🏠 *نوع العقار:* $propertyType\n\n"
          "تم الإرسال عبر تطبيق أفاق العقارية.";

      final Uri whatsappUri = Uri.parse(
        "whatsapp://send?phone=${AppConstants.afaqPhoneNumber}&text=${Uri.encodeComponent(message)}",
      );

      try {
        if (await canLaunchUrl(whatsappUri)) {
          await launchUrl(whatsappUri);
        } else {
          final Uri webUri = Uri.parse(
            "https://wa.me/${AppConstants.afaqPhoneNumber}?text=${Uri.encodeComponent(message)}",
          );
          await launchUrl(webUri, mode: LaunchMode.externalApplication);
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("عذراً، فشل فتح تطبيق واتساب")),
        );
      }
    }
  }
}
