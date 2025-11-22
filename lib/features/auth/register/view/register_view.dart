import 'package:dar_afaq/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../widgets/already_have_account_text.dart';
import '../widgets/form_register.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isObscureText = true;
  void validateThenDoRegister(BuildContext context) {
    context.pushNamed(Routes.dashboardRoute);
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
              children: [
                verticalSpace(30),
                Text(
                  'Create Account',
                  style: StylesManager.font25PrimaryBold,
                ),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: StylesManager.font13Grey,
                ),
                verticalSpace(20),
                Column(
                  children: [
                    verticalSpace(18),
                    const FormRegister(),
                    verticalSpace(20),
                    AppTextButton(
                      buttonText: "Register",
                      textStyle: StylesManager.font16White,
                      onPressed: () {
                        validateThenDoRegister(context);
                      },
                    ),
                    // verticalSpace(18),
                    // const TermsAndConditionsText(),
                    verticalSpace(30),
                    const AlreadyHaveAccountText(),
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
