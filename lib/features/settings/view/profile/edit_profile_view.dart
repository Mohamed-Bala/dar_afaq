import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تعديل الملف الشخصي'),
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
                      const SnackBar(content: Text('تم تحديث البيانات بنجاح')),
                    );
                    Navigator.pop(context, true);
                  },
                  updateInfoError: (apiErrorModel) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(apiErrorModel.message ?? 'حدث خطأ ما'),
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
                      hintText: 'الاسم الكامل',
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty)
                          return 'الاسم مطلوب';
                        return null;
                      },
                      controller: _nameCtrl,
                    ),
                    verticalSpace(12),
                    AppTextFormField(
                      hintText: 'رقم الهاتف',
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty)
                          return 'الهاتف مطلوب';
                        return null;
                      },
                      controller: _phoneCtrl,
                    ),
                    verticalSpace(12),
                    AppTextFormField(
                      hintText: 'البريد الإلكتروني',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty)
                          return 'البريد مطلوب';
                        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                        if (!emailRegex.hasMatch(value.trim()))
                          return 'بريد إلكتروني غير صالح';
                        return null;
                      },
                      controller: _emailCtrl,
                    ),
                    verticalSpace(24),
                    state.maybeWhen(
                      updateLoading: () =>
                          const Center(child: CircularProgressIndicator()),
                      orElse: () => AppTextButton(
                        buttonText: "حفظ التغييرات",
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
      ),
    );
  }

  void _validateAndSave(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // نرسل النص من الـ Controller مباشرة دون تقسيم
      context.read<UpdateUserInfoCubit>().emitUpdateUserInfo(
            fullName: _nameCtrl.text.trim(),
            email: _emailCtrl.text.trim(),
          );
    }
  }
}
