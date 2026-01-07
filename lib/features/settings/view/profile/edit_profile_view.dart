import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../auth/data/models/response/response.dart';
import '../../../auth/logic/cubit_cubit.dart';
import '../../../auth/logic/cubit_state.dart';

class EditProfileView extends StatefulWidget {
  final UserInfoResponse? userData;

  const EditProfileView({super.key, this.userData});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameCtrl;
  late final TextEditingController _phoneCtrl;
  late final TextEditingController _emailCtrl;

  @override
  void initState() {
    super.initState();
    final user = widget.userData?.user;
    _nameCtrl = TextEditingController(text: user?.name ?? '');
    _phoneCtrl = TextEditingController(text: user?.phone ?? '');
    _emailCtrl = TextEditingController(text: user?.email ?? '');
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.editProfileTitle.tr()),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.h),
        child: Form(
          key: _formKey,
          child: BlocConsumer<UpdateUserInfoCubit, UpdateUserInfoState>(
            listener: (context, state) {
              state.maybeWhen(
                updateSuccess: (response) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(AppStrings.profileUpdatedSuccess.tr()),
                    ),
                  );
                  Navigator.pop(context, true);
                },
                updateInfoError: (apiErrorModel) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        apiErrorModel.message ?? AppStrings.errorOccurred.tr(),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
                orElse: () {},
              );
            },
            builder: (context, state) {
              return ListView(
                children: [
                  verticalSpace(18),
                  AppTextFormField(
                    hintText: AppStrings.fullName.tr(),
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty)
                        return AppStrings.nameRequired.tr();
                      return null;
                    },
                    controller: _nameCtrl,
                  ),
                  verticalSpace(12),
                  AppTextFormField(
                    hintText: AppStrings.phoneNumber.tr(),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty)
                        return AppStrings.phoneRequired.tr();
                      return null;
                    },
                    controller: _phoneCtrl,
                  ),
                  verticalSpace(12),
                  AppTextFormField(
                    hintText: AppStrings.email.tr(),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty)
                        return 'البريد مطلوب';
                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                      if (!emailRegex.hasMatch(value.trim()))
                        return AppStrings.emailRequired.tr();
                      return null;
                    },
                    controller: _emailCtrl,
                  ),
                  verticalSpace(24),
                  state.maybeWhen(
                    updateLoading: () =>
                        const Center(child: CircularProgressIndicator()),
                    orElse: () => AppTextButton(
                      buttonText: AppStrings.saveChanges.tr(),
                      textStyle: StylesManager.font16White,
                      onPressed: () => _validateAndSave(context),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _validateAndSave(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<UpdateUserInfoCubit>().emitUpdateUserInfo(
            fullName: _nameCtrl.text.trim(),
            email: _emailCtrl.text.trim(),
          );
    }
  }
}
