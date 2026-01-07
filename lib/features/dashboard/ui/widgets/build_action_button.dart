// Helper method to build action buttons (call/chat/share)
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/resources/color_manager.dart';

Widget buildActionButton(IconData icon, Color color) {
  // Only the call and chat buttons have the blue circular border in the image
  bool isPrimaryAction =
      (icon == Icons.phone || icon == Icons.chat_bubble_outline);

  return Container(
    padding: EdgeInsets.all(8.h),
    decoration: isPrimaryAction
        ? BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: ColorManager.primary),
          )
        : null, // No specific decoration for the share icon
    child: Icon(
      icon,
      color: isPrimaryAction ? ColorManager.primary : color,
      size: 20.sp,
    ),
  );
}

Future<void> launchWhatsApp(String number) async {
  final String url = "https://wa.me/+249$number";

  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  } else {
    throw 'تعذر فتح الرابط $url';
  }
}

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}
