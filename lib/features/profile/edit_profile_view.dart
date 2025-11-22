import 'package:dar_afaq/core/helper/extensions.dart';
import 'package:flutter/material.dart';

import '../../core/resources/color_manager.dart';
import '../../core/resources/styles_manager.dart';
import '../../core/routing/routes.dart';
import '../../core/widgets/app_text_button.dart';
import '../../core/widgets/app_text_form_field.dart';

const Color inputFieldColor = Color(0xFFF0F0F0);

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: ColorManager.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blueAccent[100],
                backgroundImage: const NetworkImage(
                  'https://images.pexels.com/photos/1516680/pexels-photo-1516680.jpeg',
                ),
              ),
            ),
            const SizedBox(height: 20),
            // --- Input Fields ---
            AppTextFormField(
              hintText: 'Name',
              validator: (value) {},
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 15),
            AppTextFormField(
              hintText: 'Phone Number',
              validator: (value) {},
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 15),
            AppTextFormField(
              hintText: 'Email',
              validator: (value) {},
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),
            AppTextFormField(
              hintText: 'Address',
              suffixIcon: const Icon(Icons.edit),
              onTap: () {
                context.pushNamed(Routes.editAddressRoute);
              },
              validator: (value) {},
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 40),
            AppTextButton(
              buttonText: "Save",
              textStyle: StylesManager.font16White,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// --- Custom Widgets for Input and Dropdown ---

class ProfileInputField extends StatelessWidget {
  final String label;
  final String initialValue;
  final TextInputType keyboardType;

  const ProfileInputField({
    super.key,
    required this.label,
    required this.initialValue,
    required this.keyboardType,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54)),
          const SizedBox(height: 5),
          TextFormField(
            initialValue: initialValue,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              filled: true,
              fillColor: inputFieldColor,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              hintStyle: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
