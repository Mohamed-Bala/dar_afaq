import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../logic/cubit_cubit.dart';
import 'widget/otp_BlocListener.dart';

class OtpView extends StatefulWidget {
  final String email;

  const OtpView({super.key, required this.email});

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
                  AppStrings.verificationCodeTitle.tr(),
                  style: StylesManager.font25PrimaryBold,
                ),
                verticalSpace(8),
                Text(
                  "${AppStrings.verificationCodeSentTo.tr()} ${widget.email}",
                  style: StylesManager.font13Grey,
                ),
                verticalSpace(36),
                Builder(builder: (newContext) {
                  return OtpTextField(
                    numberOfFields: 4,
                    fieldWidth: 50.0,
                    borderRadius: BorderRadius.circular(12.r),
                    borderColor: ColorManager.primary,
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {},
                    onSubmit: (String verificationCode) {
                      newContext.read<VerifyCodeCubit>().emitVerifyCode(
                            code: int.parse(verificationCode),
                          );
                    },
                  );
                }),
                verticalSpace(30),
                OtpBloclistener(email: widget.email),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
