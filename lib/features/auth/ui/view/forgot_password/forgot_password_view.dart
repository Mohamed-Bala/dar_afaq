import 'package:dar_afaq/features/auth/logic/cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import 'widgets/forgot_password_BlocListener.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({
    super.key,
  });

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  void validateThenDoaSendCode(BuildContext context) {
    if (context.read<ForgotPasswordCubit>().formKey.currentState!.validate()) {
      context.read<ForgotPasswordCubit>().emitForgotPassword();
    }
  }

  @override
  Widget build(BuildContext context) {
    // final String? phoneNumber =
    //     ModalRoute.of(context)?.settings.arguments as String?;
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
                  'A Verification code will be sent you,please check your email.',
                  style: StylesManager.font13Grey,
                ),
                verticalSpace(36),
                Form(
                  key: context.read<ForgotPasswordCubit>().formKey,
                  child: Column(
                    children: [
                      verticalSpace(18),
                      AppTextFormField(
                        hintText: 'Email Address',
                        validator: (value) {},
                        controller:
                            context.read<ForgotPasswordCubit>().emailController,
                      ),
                      verticalSpace(24),
                      AppTextButton(
                        buttonText: "Send",
                        textStyle: StylesManager.font16White,
                        onPressed: () {
                          // context.read().setPhoneNumber(phoneNumber);
                          validateThenDoaSendCode(context);
                        },
                      ),
                      verticalSpace(24),
                      const ForgotPasswordBloclistener(),
                      //
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
