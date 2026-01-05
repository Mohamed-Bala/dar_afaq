import 'package:dar_afaq/core/helper/extensions.dart';
import 'package:dar_afaq/core/resources/color_manager.dart';
import 'package:dar_afaq/features/auth/logic/cubit_cubit.dart';
import 'package:dar_afaq/features/auth/logic/cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/network/api_error_model.dart';
import '../../../../../../core/resources/styles_manager.dart';
import '../../../../../../core/routing/routes.dart';

class ResetPasswordBloclistener extends StatelessWidget {
  const ResetPasswordBloclistener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listenWhen: (previous, current) =>
          current is ResetPasswordLoading ||
          current is ResetPasswordSuccess ||
          current is ResetPasswordError,
      listener: (context, state) {
        state.whenOrNull(
          resetPasswordLoading: () {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primary,
                ),
              ),
            );
          },
          resetPasswordSuccess: (resetPassworfResponse) {
            context.pop();
            context.pushNamed(
              Routes.loginRoute,
            );
          },
          resetPasswordError: (apiErrorModel) {
            setupErrorState(context, apiErrorModel);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, ApiErrorModel apiErrorModel) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          apiErrorModel.message ?? 'Unknown error',
          style: StylesManager.font24Black700Weight,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: StylesManager.font14Grey,
            ),
          ),
        ],
      ),
    );
  }
}
