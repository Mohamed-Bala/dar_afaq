import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/helper/extensions.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/styles_manager.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../logic/cubit_cubit.dart';
import '../../../../logic/cubit_state.dart';

class RegisterpBlocListener extends StatelessWidget {
  const RegisterpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is RegisterLoading ||
          current is RegisterSuccess ||
          current is RegisterError,
      listener: (context, state) {
        state.whenOrNull(
          registerLoading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primary,
                ),
              ),
            );
          },
          registerSuccess: (registerResponse) {
            final cubit = context.read<RegisterCubit>();
            final String currentPhone = cubit.phoneController.text.trim();
            final String currentEmail = cubit.emailController.text.trim();
            context.pop();
            context.pushNamed(
              Routes.otpRegisterRoute,
              arguments: {
                'phone': currentPhone,
                'email': currentEmail,
              },
            );
          },
          registerError: (apiErrorModel) {
            context.pop();
            setupErrorState(context, apiErrorModel.message ?? "");
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    // تخصيص الرسالة إذا كانت تحتوي على خطأ قاعدة البيانات المشهور
    String userFriendlyMessage = error;

    if (error.contains("users_phone_unique") ||
        error.contains("Duplicate entry")) {
      userFriendlyMessage = "رقم الهاتف هذا مسجل مسبقاً، يرجى استخدام رقم آخر.";
    } else if (error.contains("users_email_unique")) {
      userFriendlyMessage = "البريد الإلكتروني مستخدم بالفعل.";
    }

    // إظهار الرسالة أسفل الشاشة
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          userFriendlyMessage,
          style: StylesManager.font13Grey.copyWith(color: ColorManager.white),
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
      ),
    );
  }
}
