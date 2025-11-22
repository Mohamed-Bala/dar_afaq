import 'package:flutter/material.dart';

import '../../core/resources/color_manager.dart';
import '../../core/resources/styles_manager.dart';
import '../../core/widgets/app_text_button.dart';
import '../../core/widgets/app_text_form_field.dart';

class EditAddressView extends StatefulWidget {
  const EditAddressView({super.key});

  @override
  State<EditAddressView> createState() => _EditAddressViewState();
}

class _EditAddressViewState extends State<EditAddressView> {
  // Define controllers for text fields (important for managing input)
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _buildingController = TextEditingController();
  final TextEditingController _floorController = TextEditingController();
  final TextEditingController _apartmentController = TextEditingController();

  // final String _selectedAddressType = 'Home';

  // final bool _isDefaultAddress = true;

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _streetController.dispose();
    _buildingController.dispose();
    _floorController.dispose();
    _apartmentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {},
          ),
          title: const Text(
            'Edit Address',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              AppTextFormField(
                controller: _nameController,
                hintText: 'Sabah Al Nasser',
                validator: (value) {},
              ),

              const SizedBox(height: 20),
              AppTextFormField(
                controller: _numberController,
                hintText: '7',
                keyboardType: TextInputType.number,
                validator: (value) {},
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: AppTextFormField(
                      controller: _streetController,
                      hintText: 'Al-Jadha',
                      validator: (value) {},
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: AppTextFormField(
                      controller: _buildingController,
                      hintText: '14',
                      keyboardType: TextInputType.number,
                      validator: (value) {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: AppTextFormField(
                      controller: _floorController,
                      hintText: 'Floor',
                      keyboardType: TextInputType.number,
                      validator: (value) {},
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: AppTextFormField(
                      controller: _apartmentController,
                      hintText: 'Apartment No',
                      keyboardType: TextInputType.number,
                      validator: (value) {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     _buildAddressTypeButton(
              //         'بيت', 'Home', goldColor, lightGreyBackground), // Home
              //     _buildAddressTypeButton('مكتب', 'Office', goldColor,
              //         lightGreyBackground), // Office
              //     _buildAddressTypeButton('عمارة', 'Building', goldColor,
              //         lightGreyBackground), // Building
              //   ],
              // ),
              // const SizedBox(height: 30),
              // Set as Default Address Switch
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     const Text(
              //       'تعيين كعنوان افتراضي', // Set as default address
              //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //     ),
              //     Switch(
              //       value: _isDefaultAddress,
              //       onChanged: (bool value) {
              //         setState(() {
              //           _isDefaultAddress = value;
              //         });
              //       },
              //       activeColor: ColorManager.primary,
              //       activeTrackColor: goldColor,
              //       inactiveThumbColor: Colors.grey,
              //       inactiveTrackColor: Colors.grey[300],
              //     ),
              //   ],
              // ),
              const SizedBox(height: 40),
              AppTextButton(
                buttonText: "Edit",
                textStyle: StylesManager.font16White,
                onPressed: () {},
              ),
              // Save Button
              // CustomBottom(
              //   text: 'Save',
              //   onPressed: () {
              //     // print('Saving Address:');
              //     // print('Name: ${_nameController.text}');
              //     // print('Number: ${_numberController.text}');
              //     // print('Street: ${_streetController.text}');
              //     // print('Building Num: ${_buildingController.text}');
              //     // print('Floor: ${_floorController.text}');
              //     // print('Apartment: ${_apartmentController.text}');
              //     // print('Address Type: $_selectedAddressType');
              //     // print('Is Default: $_isDefaultAddress');
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildTextField({
  //   required TextEditingController controller,
  //   required String hintText,
  //   TextInputType keyboardType = TextInputType.text,
  // }) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(15),
  //     ),
  //     child: TextField(
  //       controller: controller,
  //       keyboardType: keyboardType,
  //       textAlign: TextAlign.right,
  //       decoration: InputDecoration(
  //         hintText: hintText,
  //         hintStyle: const TextStyle(color: Colors.grey),
  //         border: InputBorder.none,
  //         contentPadding:
  //             const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildAddressTypeButton(
  //     String label, String type, Color activeColor, Color inactiveColor) {
  //   bool isSelected = _selectedAddressType == type;
  //   return Expanded(
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 5.0),
  //       child: OutlinedButton(
  //         onPressed: () {
  //           setState(() {
  //             _selectedAddressType = type;
  //           });
  //         },
  //         style: OutlinedButton.styleFrom(
  //           backgroundColor: isSelected ? activeColor : inactiveColor,
  //           side: BorderSide(
  //             color: isSelected ? activeColor : Colors.transparent,
  //             width: 2,
  //           ),
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(15),
  //           ),
  //           padding: const EdgeInsets.symmetric(vertical: 15),
  //         ),
  //         child: Text(
  //           label,
  //           style: TextStyle(
  //             color: isSelected ? Colors.white : Colors.black,
  //             fontWeight: FontWeight.bold,
  //             fontSize: 16,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
