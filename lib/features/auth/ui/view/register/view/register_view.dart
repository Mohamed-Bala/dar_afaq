import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helper/spacing.dart';
import '../../../../../../core/resources/strings_manager.dart';
import '../../../../../../core/resources/styles_manager.dart';
import '../../../../../../core/widgets/app_text_button.dart';
import '../../../../logic/cubit_cubit.dart';
import '../widgets/already_have_account_text.dart';
import '../widgets/form_register.dart';
import '../widgets/register_bloc_listener.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isObscureText = true;
  void validateThenDoRegister(BuildContext context) {
    if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
      context.read<RegisterCubit>().emitRegister();
    }
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
                  AppStrings.createAccount.tr(),
                  style: StylesManager.font25PrimaryBold,
                ),
                verticalSpace(8),
                Text(
                  AppStrings.registerWelcomeMessage.tr(),
                  style: StylesManager.font13Grey,
                ),
                verticalSpace(20),
                Column(
                  children: [
                    verticalSpace(18),
                    const FormRegister(),
                    verticalSpace(20),
                    AppTextButton(
                      buttonText: AppStrings.registerButton.tr(),
                      textStyle: StylesManager.font16White,
                      onPressed: () {
                        validateThenDoRegister(context);
                      },
                    ),
                    verticalSpace(30),
                    const AlreadyHaveAccountText(),
                    RegisterpBlocListener(
                      // phone: context
                      //     .read<RegisterCubit>()
                      //     .phoneController
                      //     .text
                      //     .trim(),
                      // email: context
                      //     .read<RegisterCubit>()
                      //     .emailController
                      //     .text
                      //     .trim(),
                    ),
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
