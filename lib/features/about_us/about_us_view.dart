import 'package:dar_afaq/core/helper/spacing.dart';
import 'package:dar_afaq/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resources/styles_manager.dart';

// --- Main About Us Screen Widget ---
class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Colors.white,
      ),
      // ListView makes the content scrollable
      body: ListView(
        padding: EdgeInsets.all(20.0.h),
        children: <Widget>[
          // Section 1: App/Company Identity
          const AppIdentitySection(),
          Divider(height: 30.h, thickness: 1),

          // Section 2: Mission Statement
          const MissionSection(),
          Divider(height: 30.h, thickness: 1),

          // Section 3: Contact Information / Links
          const ContactSection(),
          Divider(height: 20.h, thickness: 1),

          const LegalInfoSection(),
        ],
      ),
    );
  }
}

// --- Reusable Component Widgets ---

class AppIdentitySection extends StatelessWidget {
  const AppIdentitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 60.r,
          backgroundImage: const AssetImage('assets/images/logo.png'),
        ),
        // verticalSpace(5),
        Text(
          'دار أفاق',
          style: StylesManager.font25PrimaryBold,
        ),
        verticalSpace(8),
        Text(
          'منصة متكاملة لبيانات السوق العقاري: المزادات، الصفقات المسجلة، التقييم، وحساب تكلفة البناء.',
          style: StylesManager.font13Grey.copyWith(fontSize: 16.sp),
          textAlign: TextAlign.center,
        ),
        verticalSpace(10)
      ],
    );
  }
}

class MissionSection extends StatelessWidget {
  const MissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        const SectionHeader(title: 'من نحن'),
        verticalSpace(10),
        Text(
          '''تأسست دار آفاق العقارية لتطوير مشاريع سكنية وتجارية عالية الجودة  مع التركيز على التفاصيل الدقيقة والالتزام بالمواعيد وخدمة العملاء المتميزة.
''',
          style: StylesManager.font13Grey
              .copyWith(fontSize: 16.sp, color: Colors.black, height: 1.5),
          textAlign: TextAlign.justify,
        ),
        Divider(height: 30.h, thickness: 1),
        const SectionHeader(title: 'قيمنا'),
        const LabeledInfo(
          icon: Icons.check_circle_outline,
          text: 'أن نصبح الشريك الأول في المقاولات الذكية',
        ),
        const LabeledInfo(
          icon: Icons.people_outline,
          text: 'تسعى شركة دار افاق الذكية إلى تقديم مشاريع متكاملة',
        ),
        const LabeledInfo(
          icon: Icons.rocket_launch_outlined,
          text: 'نؤمن بالالتزام، الجودة، الابتكار',
        ),
      ],
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        const SectionHeader(title: 'تواصل معنا'),
        verticalSpace(10),
        ListTile(
          leading: Icon(Icons.email, color: ColorManager.primary),
          title: const Text('info@darafaq.com'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.language, color: ColorManager.primary),
          title: const Text('www.darafaq.com'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.call, color: ColorManager.primary),
          title: const Text('+965 1234 5678'),
          onTap: () {},
        ),
      ],
    );
  }
}

class LegalInfoSection extends StatelessWidget {
  const LegalInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Version 1.0.0 (Build 20251128)',
          style: StylesManager.font13Grey,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Privacy Policy | Terms of Service',
            style:
                StylesManager.font13Grey.copyWith(color: ColorManager.primary),
          ),
        ),
        verticalSpace(5),
        Text(
          '© 2025 Dar Afaq. All rights reserved.',
          style: StylesManager.font13Grey,
        ),
      ],
    );
  }
}

// --- Helper Widgets ---

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
    );
  }
}

class LabeledInfo extends StatelessWidget {
  final IconData icon;
  final String text;
  const LabeledInfo({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.0.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(icon, size: 19.sp, color: ColorManager.primary),
            horizontalSpace(10),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
