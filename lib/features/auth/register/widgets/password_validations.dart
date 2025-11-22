import 'package:flutter/material.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        verticalSpace(2),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        verticalSpace(2),
        buildValidationRow(
            'At least 1 special character', hasSpecialCharacters),
        verticalSpace(2),
        buildValidationRow('At least 1 number', hasNumber),
        verticalSpace(2),
        buildValidationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorManager.grey,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: StylesManager.font13Grey.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.grey,
            decorationThickness: 2,
            color: hasValidated ? ColorManager.primary : ColorManager.grey,
          ),
        )
      ],
    );
  }
}
