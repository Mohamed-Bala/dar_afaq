import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/app_regex.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import 'toggle_button.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({super.key});

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;
  final TextEditingController _dateController = TextEditingController();
  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  late TextEditingController passwordController;

  // @override
  // void initState() {
  //   super.initState();
  //   passwordController = context.read<RegisterCubit>().passwordController;
  //   setupPasswordControllerListener();
  // }

  // void setupPasswordControllerListener() {
  //   passwordController.addListener(() {
  //     setState(() {
  //       hasLowercase = AppRegex.hasLowerCase(passwordController.text);
  //       hasUppercase = AppRegex.hasUpperCase(passwordController.text);
  //       hasSpecialCharacters =
  //           AppRegex.hasSpecialCharacter(passwordController.text);
  //       hasNumber = AppRegex.hasNumber(passwordController.text);
  //       hasMinLength = AppRegex.hasMinLength(passwordController.text);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: context.read<RegisterCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'FirstName',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            //  controller: context.read<RegisterCubit>().nameController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: 'Last Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            //  controller: context.read<RegisterCubit>().nameController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: 'Email Address',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            // controller: context.read<RegisterCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: 'Phone number',
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
            },
            //  controller: context.read<RegisterCubit>().phoneController,
          ),
          verticalSpace(18),
          const Divider(),
          verticalSpace(18),
          const AddressData(),
          verticalSpace(18),
          const Divider(),
          verticalSpace(18),
          const ToggleButtonWidget(),
          verticalSpace(18),
          AppTextFormField(
            readOnly: true,
            hintText: 'Birth Of Date',
            keyboardType: TextInputType.text,
            onTap: () {
              selectDate();
            },
            validator: (value) {
              // if (value == null || value.isEmpty) {
              //   return 'Please select your birth date';
              // }
              // return null;
            },
            controller: _dateController,
          ),
          verticalSpace(18),
          AppTextFormField(
            //  controller: context.read<RegisterCubit>().passwordController,
            hintText: 'Password',
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
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(18),
          AppTextFormField(
            // controller:
            //   context.read<RegisterCubit>().passwordConfirmationController,
            hintText: 'Password Confirmation',
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
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(24),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}

class AddressData extends StatefulWidget {
  const AddressData({
    super.key,
  });

  @override
  State<AddressData> createState() => _AddressDataState();
}

class _AddressDataState extends State<AddressData> {
  String? _selectedValue; // State variable to hold the selected value
  final List<String> _options = [
    'القادسية',
    'قرطبة',
    'الروضة',
    'الشامية',
    'الشويخ',
    'الصليبخات',
    'القيروان'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        areaWidget(),
        verticalSpace(18),
        AppTextFormField(
          hintText: 'Buliding Number',
          keyboardType: TextInputType.number,
          validator: (value) {},
        ),
        verticalSpace(18),
        AppTextFormField(
          hintText: 'Floor',
          keyboardType: TextInputType.number,
          validator: (value) {},
        ),
        verticalSpace(18),
        AppTextFormField(
          hintText: 'Avenue',
          keyboardType: TextInputType.number,
          validator: (value) {},
        ),
      ],
    );
  }

  DropdownButtonFormField<String> areaWidget() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.white,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        fillColor: ColorManager.lighterGray,
        filled: true,
      ),
      value: _selectedValue,
      hint: const Text('Area Name'),
      items: _options.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedValue = newValue;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select an option';
        }
        return null;
      },
    );
  }
}
