import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/helper/app_regex.dart';
import '../../../../../../core/helper/spacing.dart';
import '../../../../../../core/resources/strings_manager.dart';
import '../../../../../../core/widgets/app_text_form_field.dart';
import '../../../../logic/cubit_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: AppStrings.phoneNumber.tr(),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                return AppStrings.phoneValidationEmpty.tr();
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
            controller: context.read<LoginCubit>().phoneController,
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            hintText: AppStrings.password.tr(),
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.passwordValidationEmpty.tr();
              }
            },
          ),
        ],
      ),
    );
  }
}
