import 'package:dar_afaq/core/helper/spacing.dart';
import 'package:dar_afaq/core/resources/color_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/styles_manager.dart';

// --- Main About Us Screen Widget ---
class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(AppStrings.aboutDarAfaq.tr()),
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

          // const LegalInfoSection(),
        ],
      ),
    );
  }
}

class AppIdentitySection extends StatelessWidget {
  const AppIdentitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          'assets/images/splash_image.png',
          width: 70.w,
          height: 70.h,
        ),
        verticalSpace(5),
        Align(
          alignment: Alignment.centerRight,
          child: SectionHeader(title: AppStrings.appName.tr()),
        ),
        verticalSpace(8),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            AppStrings.appIdentityDesc.tr(),
            style: StylesManager.font13Grey
                .copyWith(fontSize: 16.sp, color: Colors.black, height: 1.3),
            textAlign: TextAlign.center,
          ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SectionHeader(title: AppStrings.whoWeAre.tr()),
        verticalSpace(10),
        Text(
          AppStrings.whoWeAreDesc.tr(),
          style: StylesManager.font13Grey
              .copyWith(fontSize: 16.sp, color: Colors.black, height: 1.3),
          textAlign: TextAlign.start,
        ),
        Divider(height: 30.h, thickness: 1),
        SectionHeader(title: AppStrings.ourValues.tr()),
        verticalSpace(10),
        LabeledInfo(
          icon: Icons.check_circle_outline,
          text: AppStrings.valuePartner.tr(),
        ),
        LabeledInfo(
          icon: Icons.people_outline,
          text: AppStrings.valueProjects.tr(),
        ),
        LabeledInfo(
          icon: Icons.rocket_launch_outlined,
          text: AppStrings.valueInnovation.tr(),
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
        SectionHeader(title: AppStrings.contactUs.tr()),
        verticalSpace(10),
        ListTile(
          leading: Icon(Icons.email, color: ColorManager.primary),
          title: const Text('AFAQ@gmail.com'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.language, color: ColorManager.primary),
          title: const Text('https://darafaqkw.com/'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.call, color: ColorManager.primary),
          title: const Text('+965 5552 5030'),
          onTap: () {},
        ),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
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
    return Padding(
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
    );
  }
}
