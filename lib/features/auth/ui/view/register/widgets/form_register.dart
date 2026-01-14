import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/helper/app_regex.dart';
import '../../../../../../core/helper/spacing.dart';
import '../../../../../../core/resources/strings_manager.dart';
import '../../../../../../core/widgets/app_text_form_field.dart';
import '../../../../logic/cubit_cubit.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({super.key});

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: AppStrings.firstName.tr(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.validNameError.tr();
              }
            },
            controller: context.read<RegisterCubit>().firstNameController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: AppStrings.lastName.tr(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.validNameError.tr();
              }
            },
            controller: context.read<RegisterCubit>().lastNameController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: AppStrings.email.tr(),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return AppStrings.validEmailError.tr();
              }
            },
            controller: context.read<RegisterCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: AppStrings.phoneNumber.tr(),
            keyboardType: TextInputType.phone,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.validPhoneError.tr();
              }
              if (!AppRegex.isPhoneNumberValid(value)) {
                return AppStrings.validPhoneError.tr();
              }

              return null;
            },
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ],
            controller: context.read<RegisterCubit>().phoneController,
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<RegisterCubit>().passwordController,
            hintText: AppStrings.password.tr(),
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.validPasswordError.tr();
              }
            },
          ),
          verticalSpace(18),
          AppTextFormField(
            controller:
                context.read<RegisterCubit>().passwordConfirmationController,
            hintText: AppStrings.passwordConfirmation.tr(),
            isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.validPasswordError.tr();
              }
            },
          ),
          verticalSpace(24),
        ],
      ),
    );
  }
}
