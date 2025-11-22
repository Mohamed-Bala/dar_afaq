import 'package:flutter/material.dart';

import '../../../../core/resources/styles_manager.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our',
            style: StylesManager.font13Grey,
          ),
          TextSpan(
            text: ' Terms & Conditions',
            style: StylesManager.font14Grey,
          ),
          TextSpan(
            text: ' and',
            style: StylesManager.font13Grey.copyWith(height: 1.5),
          ),
          TextSpan(
            text: ' Privacy Policy',
            style: StylesManager.font14Grey,
          ),
        ],
      ),
    );
  }
}
