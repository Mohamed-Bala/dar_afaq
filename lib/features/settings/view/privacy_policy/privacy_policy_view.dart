import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/resources/color_manager.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        title: Text(
          'privacy_title'.tr(),
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        backgroundColor: ColorManager.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // مقدمة الاتفاقية
            _buildIntroSection(),
            verticalSpace(20),

            // القسم الأول: الخصوصية
            _buildSectionTitle('section_1_title'.tr()),
            _buildContentItem('section_1_sub1'.tr(), 'section_1_body1'.tr()),
            _buildContentItem('section_1_sub2'.tr(), 'section_1_body2'.tr()),

            // القسم الثاني: شروط الاستخدام
            _buildSectionTitle('section_2_title'.tr()),
            _buildContentItem('section_2_sub1'.tr(), 'section_2_body1'.tr()),
            _buildContentItem('section_2_sub3'.tr(), 'section_2_body3'.tr()),

            // القسم الثالث: إخلاء المسؤولية
            _buildWarningSection(context),

            // القسم الرابع: الملكية الفكرية
            _buildSectionTitle('section_4_title'.tr()),
            _buildContentText('section_4_body'.tr()),

            // القسم الخامس: حقوق المستخدم
            _buildSectionTitle('section_5_title'.tr()),
            _buildContentText('section_5_body'.tr()),

            // القانون المطبق
            _buildSectionTitle('section_7_title'.tr()),
            _buildContentText('section_7_body'.tr()),

            verticalSpace(40),
          ],
        ),
      ),
    );
  }

  // --- UI Helpers ---

  Widget _buildIntroSection() {
    return Container(
      padding: EdgeInsets.all(15.h),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: ColorManager.primary),
      ),
      child: Text(
        'intro_text'.tr(),
        style:
            TextStyle(fontSize: 14.sp, color: ColorManager.black, height: 1.6),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
          color: ColorManager.black, // لونك الأساسي
        ),
      ),
    );
  }

  Widget _buildContentItem(String subtitle, String body) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subtitle,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.black)),
          verticalSpace(4),
          Text(body,
              style: TextStyle(
                  fontSize: 14.sp, color: ColorManager.grey, height: 1.5)),
        ],
      ),
    );
  }

  Widget _buildContentText(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Text(text,
          style: TextStyle(
              fontSize: 14.sp, color: ColorManager.grey, height: 1.5)),
    );
  }

  Widget _buildWarningSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.05),
        border: Border(
          right: context.locale.languageCode == 'ar'
              ? BorderSide(color: Colors.red, width: 4.w)
              : BorderSide.none,
          left: context.locale.languageCode == 'en'
              ? BorderSide(color: Colors.red, width: 4.w)
              : BorderSide.none,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('section_3_title'.tr(),
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.red)),
          verticalSpace(5),
          Text(
            'section_3_body'.tr(),
            style: TextStyle(
                fontSize: 12.sp, color: ColorManager.black, height: 1.6),
          ),
        ],
      ),
    );
  }
}
