import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../logic/cubit_cubit.dart';
import 'widgets/reset_password_BlocListener.dart';

class ResetPasswordView extends StatefulWidget {
  final String email;
  const ResetPasswordView({super.key, required this.email});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  void validateThenDoaResetPassword(BuildContext context) {
    if (context.read<ResetPasswordCubit>().formKey.currentState!.validate()) {
      print("Sending request for email: ${widget.email}");
      context.read<ResetPasswordCubit>().emitResetPassword(
            email: widget.email,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
          child: Form(
            key: context.read<ResetPasswordCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create New Password",
                  style: StylesManager.font25PrimaryBold,
                ),
                const SizedBox(height: 10),
                Text(
                  "Your new password must be different from previous used passwords.",
                  style: StylesManager.font13Grey,
                ),
                const SizedBox(height: 40),
                AppTextFormField(
                  controller:
                      context.read<ResetPasswordCubit>().passwordController,
                  hintText: 'New Password',
                  isObscureText:
                      context.read<ResetPasswordCubit>().isPasswordObscure,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        context.read<ResetPasswordCubit>().isPasswordObscure =
                            !context
                                .read<ResetPasswordCubit>()
                                .isPasswordObscure;
                      });
                    },
                    child: Icon(
                      context.read<ResetPasswordCubit>().isPasswordObscure
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid password ';
                    }
                    return null;
                  },
                ),
                verticalSpace(24),

                AppTextFormField(
                  controller: context
                      .read<ResetPasswordCubit>()
                      .passwordConfirmationController,
                  hintText: 'Confirm New Password',
                  isObscureText: context
                      .read<ResetPasswordCubit>()
                      .isConfirmPasswordObscure,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        context
                                .read<ResetPasswordCubit>()
                                .isConfirmPasswordObscure =
                            !context
                                .read<ResetPasswordCubit>()
                                .isConfirmPasswordObscure;
                      });
                    },
                    child: Icon(
                      context
                              .read<ResetPasswordCubit>()
                              .isConfirmPasswordObscure
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  validator: (value) {
                    if (value !=
                        context
                            .read<ResetPasswordCubit>()
                            .passwordController
                            .text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                verticalSpace(24),

                // زر الحفظ
                AppTextButton(
                  buttonText: "Reset Password",
                  textStyle: StylesManager.font16White,
                  onPressed: () {
                    validateThenDoaResetPassword(context);
                  },
                ),
                verticalSpace(24),
                const ResetPasswordBloclistener(),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
