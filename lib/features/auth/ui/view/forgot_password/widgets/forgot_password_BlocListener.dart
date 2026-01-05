import 'package:dar_afaq/core/helper/extensions.dart';
import 'package:dar_afaq/core/resources/color_manager.dart';
import 'package:dar_afaq/features/auth/logic/cubit_cubit.dart';
import 'package:dar_afaq/features/auth/logic/cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/network/api_error_model.dart';
import '../../../../../../core/resources/styles_manager.dart';
import '../../../../../../core/routing/routes.dart';
import '../../otp/otp_view.dart';

class ForgotPasswordBloclistener extends StatelessWidget {
  const ForgotPasswordBloclistener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listenWhen: (previous, current) =>
          current is ForgotPasswordLoading ||
          current is ForgotPasswordSuccess ||
          current is ForgotPasswordError,
      listener: (context, state) {
        state.whenOrNull(
          forgotPasswordLoading: () {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primary,
                ),
              ),
            );
          },
          forgotPasswordSuccess: (forgotPassworfResponse) {
            context.pop();
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => BlocProvider(
            //       create: (context) => di<ForgotPasswordCubit>(),
            //       child: OtpView(
            //         email: context
            //             .read<ForgotPasswordCubit>()
            //             .emailController
            //             .text,
            //       ),
            //     ),
            //   ),
            // );
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => BlocProvider.value(
            //       value: context.read<ForgotPasswordCubit>(),
            //       child: OtpView(
            //         email: context
            //             .read<ForgotPasswordCubit>()
            //             .emailController
            //             .text,
            //       ),
            //     ),

            //   ),
            // );
            context.pushNamed(
              Routes.otpRoute,
              arguments:
                  context.read<ForgotPasswordCubit>().emailController.text,
            );
          },
          forgotPasswordError: (apiErrorModel) {
            setupErrorState(context, apiErrorModel);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  // void showSuccessDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Register Successful'),
  //         content: const SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               Text('Congratulations, you have Register successfully!'),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             style: TextButton.styleFrom(
  //               foregroundColor: Colors.white,
  //               backgroundColor: ColorManager.primary,
  //               disabledForegroundColor: Colors.grey.withOpacity(0.38),
  //             ),
  //             onPressed: () {
  //               context.pushNamed(Routes.loginRoute);
  //             },
  //             child: const Text('Continue'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

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
