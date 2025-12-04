import 'package:dar_afaq/core/helper/extensions.dart';
import 'package:dar_afaq/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resources/styles_manager.dart';
import '../../core/routing/routes.dart';
import '../../core/widgets/app_text_button.dart';

// --- Main Widget ---
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // Crucial for Arabic/RTL: forces the layout to start from the right
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white, // const Color(0xFF0D1B45),
        appBar: AppBar(
          backgroundColor: Colors.white, // const Color(0xFF0D1B45),
          toolbarHeight: 0,
        ), // Dark Blue background
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Close button and Header Title
            const _HeaderSection(),
            const SizedBox(height: 20),

            // Menu Items List
            const Expanded(
              child: _MenuListView(),
            ),

            // Login/Registration Button at the bottom
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: AppTextButton(
                buttonText: "تسجيل دخول",
                textStyle: StylesManager.font16White,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 50.h,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'دار أفاق',
                        style: StylesManager.font12GrayRegular.copyWith(
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'مرجعك العقاري ',
                    style: StylesManager.font12GrayRegular.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              // App Logo (Rounded blue icon)
              IconButton(
                  icon: const Icon(Icons.close, color: Colors.black),
                  onPressed: () {
                    context.pop();
                  }),
            ],
          ),
        ],
      ),
    );
  }
}

// --- Menu Items List ---
class _MenuListView extends StatefulWidget {
  const _MenuListView();

  @override
  State<_MenuListView> createState() => _MenuListViewState();
}

class _MenuListViewState extends State<_MenuListView> {
  bool _isArabicSelected = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // The 'General' section title
        _MenuItem(
          title: 'عام', // General
          isTitle: true,
          onTap: () {},
        ),
        _MenuItem(
          title: ' لغة التطبيق', // Contact Us
          icon: Icons.language_outlined,
          trailingWidget: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Arabic",
                style: StylesManager.font12GrayRegular.copyWith(
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 8),
              Switch(
                value: _isArabicSelected,
                onChanged: (bool value) {
                  setState(() {
                    _isArabicSelected = value;
                  });
                },
                activeColor: ColorManager.primary,
                inactiveTrackColor: Colors.grey[400],
                activeTrackColor: Colors.black.withOpacity(0.5),
              )
            ],
          ),
          onTap: () {},
        ),
        // The following items use ListTile-style layout
        _MenuItem(
          title: 'اتصل بنا', // Contact Us
          icon: Icons.call,
          onTap: () {},
        ),
        _MenuItem(
          title: 'عن دار أفاق', // About the Calculator
          icon: Icons.info_outline,
          onTap: () {
            context.pushNamed(Routes.aboutUsRoute);
          },
        ),
        _MenuItem(
          title: 'شروط الاستخدام', // Terms of Use
          icon: Icons.description,
          onTap: () {},
        ),
        _MenuItem(
          title: 'سياسة الخصوصية', // Privacy Policy
          icon: Icons.lock_outline,
          onTap: () {},
        ),
      ],
    );
  }
}

// --- Reusable Menu Item Widget ---
class _MenuItem extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Widget? trailingWidget;
  final bool isTitle;
  void Function()? onTap;

  _MenuItem({
    required this.title,
    this.icon,
    this.trailingWidget,
    this.isTitle = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (isTitle) {
      // Custom Row layout for the 'General' title and Language Selector
      return Padding(
        padding:
            const EdgeInsets.only(right: 20.0, left: 20.0, top: 10, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: StylesManager.font12GrayRegular.copyWith(
                fontSize: 20.sp,
                color: Colors.black,
              ),
            ),
            if (trailingWidget != null) trailingWidget!,
          ],
        ),
      );
    }

    // Standard ListTile for other menu items
    return ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
        leading: icon != null
            ? Icon(
                icon,
                color: Colors.black,
              )
            : null,
        title: Text(
          title,
          style: StylesManager.font12GrayRegular.copyWith(
            fontSize: 16.sp,
            color: Colors.black,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (trailingWidget != null) trailingWidget!,
            const SizedBox(width: 8),
            // The directional arrow icon
            const Icon(
              Icons.keyboard_arrow_left_outlined,
              color: Colors.white38,
            ),
          ],
        ),
        onTap: onTap);
  }
}
