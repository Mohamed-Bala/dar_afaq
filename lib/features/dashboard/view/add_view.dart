import 'package:dar_afaq/core/helper/extensions.dart';
import 'package:dar_afaq/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/routing/routes.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/app_text_form_field.dart';

class AddView extends StatefulWidget {
  const AddView({super.key});

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  String? _selectedCategory;
  String? _selectedArea;
  String _selectedTransaction = 'بيع';
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'إضافة عقار',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: ListView(padding: const EdgeInsets.all(16.0), children: [
          _buildPackageBanner(
            price: '٤٠ د.ك',
            packageName: 'الباقة المختارة  : سوبر',
          ),
          const SizedBox(height: 24),

          const Text(
            'نوع المعاملة',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            spacing: 10,
            runSpacing: 10,
            children: [
              ArabicTransactionButton(
                label: 'بيع', // Sale
                icon: Icons.monetization_on,
                isSelected: _selectedTransaction == 'بيع',
                onTap: () => setState(() => _selectedTransaction = 'بيع'),
              ),
              ArabicTransactionButton(
                label: 'إيجار', // Rent
                icon: Icons.home,
                isSelected: _selectedTransaction == 'إيجار',
                onTap: () => setState(() => _selectedTransaction = 'إيجار'),
              ),
              ArabicTransactionButton(
                label: 'بدل', // Exchange
                icon: Icons.sync_alt,
                isSelected: _selectedTransaction == 'بدل',
                onTap: () => setState(() => _selectedTransaction = 'بدل'),
              ),
            ],
          ),
          verticalSpace(24),

          const Text(
            'وصف العقار', // Property Description
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          verticalSpace(10),
          TextFormField(
            controller: _descriptionController,
            maxLines: 5,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              hintText: 'تفاصيل العقار',
              hintTextDirection: TextDirection.rtl,
            ),
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
          ),
          verticalSpace(10),
          _buildFilterDropdown(
            label: 'فئة العقار', // Property Category
            hint: 'اختر النوع', // Choose Type
            value: _selectedCategory,
            items: ['شقة', 'فيلا', 'بيت', 'ارض'],
            onChanged: (value) => setState(() => _selectedCategory = value),
          ),
          verticalSpace(10),
          _buildFilterDropdown(
            label: 'المناطق', // Areas
            hint: 'صباح الناصر', // Sabah Al-Nasser (Example)
            value: _selectedArea,
            items: ['صباح الناصر', 'الاندلس', 'القرين', 'حولي'],
            onChanged: (value) => setState(() => _selectedArea = value),
          ),

          verticalSpace(30),
          AppTextFormField(
            hintText: 'عدد الغرف',
            keyboardType: TextInputType.number,
            validator: (value) {},
          ),
          verticalSpace(10),
          AppTextFormField(
            hintText: 'عدد الصالات',
            keyboardType: TextInputType.number,
            validator: (value) {},
          ),
          verticalSpace(10),
          AppTextFormField(
            hintText: 'المساحة (م²)',
            keyboardType: TextInputType.number,
            validator: (value) {},
          ),
          verticalSpace(10),
          AppTextFormField(
            hintText: 'السعر (د.ك)',
            keyboardType: TextInputType.number,
            validator: (value) {},
          ),
          verticalSpace(10),
          AppTextFormField(
            hintText: 'العنوان التفصيلي',
            keyboardType: TextInputType.number,
            validator: (value) {},
          ),
          verticalSpace(10),
          // --- 4. Upload Zones (88888888.PNG) ---
          const DashedUploadZone(
            title: 'رفع فيديو (30 ثانية)', // Upload video (30 seconds)
            hint:
                'اسحب الفيديو هنا أو اضغط للرفع', // Drag video here or press to upload
          ),
          const SizedBox(height: 20),
          const DashedUploadZone(
            title: 'رفع صور العقار', // Upload property photos
            hint:
                'اسحب الصور هنا أو اضغط للرفع', // Drag photos here or press to upload
          ),
          const SizedBox(height: 40),
          AppTextButton(
            buttonText: 'إضافة عقار',
            textStyle: StylesManager.font16White,
            onPressed: () {
              //  context.pushNamed(Routes.addRoute);
            },
          ),
        ]),
      ),
    );
  }

  // Helper method to build filter dropdowns (666666666.PNG)
  Widget _buildFilterDropdown({
    required String label,
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 8),
        DropdownButtonHideUnderline(
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManager.primary,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManager.white,
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
              fillColor: ColorManager.lighterGray,
              filled: true,
            ),
            value: value,
            hint: Text(
              hint,
              style: const TextStyle(color: Colors.grey),
              textDirection: TextDirection.rtl,
            ),
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
            isExpanded: true,
            style: const TextStyle(color: Colors.black87, fontSize: 14),
            onChanged: onChanged,
            items: items.map<DropdownMenuItem<String>>((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  // --- Helper Widgets ---
  Widget _buildPackageBanner(
      {required String price, required String packageName}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: ColorManager.primary.withOpacity(.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'السعر: $price', // Price: 40 D.K
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ColorManager.primary,
            ),
          ),
          Text(
            packageName, // VIP: Selected Package
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
}

class ArabicTransactionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const ArabicTransactionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        isSelected ? ColorManager.primary.withOpacity(0.1) : Colors.white;
    final Color iconTextColor =
        isSelected ? ColorManager.primary : Colors.grey.shade700;

    return Directionality(
      textDirection: TextDirection.rtl, // Force RTL for the button content
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? ColorManager.primary : Colors.grey.shade300,
              width: 1.0,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min, // Wrap content horizontally
            children: [
              Icon(icon, color: iconTextColor, size: 20),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: iconTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashedUploadZone extends StatelessWidget {
  final String title;
  final String hint;

  const DashedUploadZone({
    super.key,
    required this.title,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align to right for Arabic
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey.shade400,
              style: BorderStyle.solid,
              width: 1.5,
            ),
          ),
          child: Center(
            child: Text(
              hint,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
