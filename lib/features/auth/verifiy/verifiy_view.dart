import 'package:dar_afaq/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/routing/routes.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/app_text_form_field.dart';

class VerifiyView extends StatefulWidget {
  const VerifiyView({super.key});

  @override
  State<VerifiyView> createState() => _VerifiyViewState();
}

class _VerifiyViewState extends State<VerifiyView> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(70),
                Text(
                  'Verification',
                  style: StylesManager.font25PrimaryBold,
                ),
                verticalSpace(8),
                Text(
                  'A Verification code will be sent you,please check your email,',
                  style: StylesManager.font13Grey,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    verticalSpace(18),
                    AppTextFormField(
                      hintText: 'Email Address',
                      validator: (value) {},
                      controller: emailController,
                    ),
                    verticalSpace(24),

                    AppTextButton(
                      buttonText: "Send",
                      textStyle: StylesManager.font16White,
                      onPressed: () {
                        context.pushNamed(Routes.otpRoute);
                      },
                    ),
                    verticalSpace(24),
                    //
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
