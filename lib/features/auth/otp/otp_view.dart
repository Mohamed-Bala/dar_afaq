import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/styles_manager.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                verticalSpace(70),
                Text(
                  'Verfication Code',
                  style: StylesManager.font25PrimaryBold,
                ),
                verticalSpace(8),
                Text(
                  "${'verfication Code sent to'} mobala@ggmail.com",
                  style: StylesManager.font13Grey,
                ),
                verticalSpace(36),
                OtpTextField(
                  numberOfFields: 6,
                  fieldWidth: 50.0,
                  borderRadius: BorderRadius.circular(12.r),
                  borderColor: ColorManager.primary,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                    // context.pushNamed(Routes.otpRoute);
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    // showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return AlertDialog(
                    //         title: const Text("Verification Code"),
                    //         content: Text('Code entered is $verificationCode'),
                    //       );
                    //     });
                  }, // end onSubmit
                ),
                verticalSpace(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
