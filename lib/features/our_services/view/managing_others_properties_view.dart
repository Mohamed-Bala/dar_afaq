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

bool isLoading = false;

class ManagingOthersPropertiesView extends StatefulWidget {
  const ManagingOthersPropertiesView({super.key});

  @override
  State<ManagingOthersPropertiesView> createState() =>
      _ManagingOthersPropertiesViewState();
}

class _ManagingOthersPropertiesViewState
    extends State<ManagingOthersPropertiesView> {
  final _formKey = GlobalKey<FormState>();
  // Controllers & Selection Variables
  final TextEditingController unetController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        title: Text('إدارة أملاك الغير'),
        backgroundColor: ColorManager.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildLabel('اسم مالك العقار'),
              AppTextFormField(
                controller: nameController,
                hintText: 'الأسم الثلاثي',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء ادخال الاسم';
                  }
                  return null;
                },
              ),
              verticalSpace(10),
              buildLabel('تصنيف العقار'),
              buildDropdown(
                hint: "عمارة استثمارية",
                items: [
                  "عمارة استثمارية",
                  "مجمع تجاري",
                  "قسيمة صناعية",
                  "بيت/فيلا مؤجرة"
                ],
                onChanged: (val) {
                  //  setState(() => selectedLocation = val);
                },
              ),
              verticalSpace(10),
              buildLabel("عدد الوحدات الإجمالي"),
              AppTextFormField(
                controller: unetController,
                hintText: 'عدد الشقق أو المحلات',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'ادخال عدد الوحدات';
                  }
                  return null;
                },
              ),
              verticalSpace(10),
              buildLabel("موقع العقار"),
              AppTextFormField(
                controller: locationController,
                hintText: 'المنطقة والقطعة',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'كتابة موقع العقار';
                  }
                  return null;
                },
              ),
              verticalSpace(10),
              buildLabel("رقم هاتف المالك"),
              AppTextFormField(
                controller: phoneController,
                hintText: '965xxxxxxxxxx',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء ادخال رقم الهاتف';
                  }
                  return null;
                },
              ),
              verticalSpace(30),
              AppTextButton(
                buttonText: " ارسال طلب إدارة الأملاك عبر واتساب",
                textStyle: TextStyle(fontSize: 18, color: Colors.white),
                onPressed: () {
                  _sendManagementRequest();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? selectedCategory;

  void _sendManagementRequest() async {
    if (_formKey.currentState!.validate()) {
      final String category = selectedCategory ?? "عمارة استثمارية";

      final String message = "🏢 *طلب إدارة أملاك جديد*\n"
          "--------------------------\n"
          "👤 *مالك العقار:* ${nameController.text.trim()}\n"
          "🏘️ *تصنيف العقار:* $category\n"
          "🔢 *عدد الوحدات:* ${unetController.text.trim()}\n"
          "📍 *الموقع:* ${locationController.text.trim()}\n"
          "📞 *هاتف التواصل:* ${phoneController.text.trim()}\n"
          "--------------------------\n"
          "تم الإرسال عبر تطبيق *أفاق العقارية*";

      final String url =
          "https://wa.me/${AppConstants.afaqPhoneNumber}?text=${Uri.encodeComponent(message)}";

      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("تعذر فتح واتساب")),
        );
      }
    }
  }
}
