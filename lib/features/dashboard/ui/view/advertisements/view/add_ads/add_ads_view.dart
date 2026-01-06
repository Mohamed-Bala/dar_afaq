import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/helper/spacing.dart';
import '../../../../../../../core/resources/styles_manager.dart';
import '../../../../../../../core/widgets/app_text_button.dart';
import '../../../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../logic/home_cubit.dart';
import '../../../../../logic/home_state.dart';
import '../../widgets/add_ads/add_ads_BlocListener.dart';
import '../../widgets/add_ads/build_package_banner.dart';
import '../../widgets/add_ads/custom_decoration.dart';

class AddAdsView extends StatefulWidget {
  final String? transactionType;
  const AddAdsView({super.key, this.transactionType});

  @override
  State<AddAdsView> createState() => _AddAdsViewState();
}

class _AddAdsViewState extends State<AddAdsView> {
  @override
  void initState() {
    super.initState();

    if (widget.transactionType != null) {
      context
          .read<AddAdvertisementCubit>()
          .updateTransactionType(widget.transactionType!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("اضافة اعلان"),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // buildPackageBanner(
            //   // price:
            //   //     '${context.watch<AddAdvertisementCubit>().selectedPlanPrice} د.ك',
            //   packageName:
            //       'الباقة المختارة : ${context.read<AddAdvertisementCubit>().selectedPlanName}',
            // ),
            verticalSpace(24),
            BlocBuilder<AddAdvertisementCubit, AddAdvertisementState>(
              builder: (context, state) {
                var cubit = context.read<AddAdvertisementCubit>();

                return Text(
                  'القسم المختار : ${cubit.selectedTransactionType}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                );
              },
            ),
            verticalSpace(24),
            const Text(
              'وصف الاعلان',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            verticalSpace(10),
            TextFormField(
              controller:
                  context.read<AddAdvertisementCubit>().descriptionController,
              maxLines: 5,
              maxLength: 250,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                hintText: 'تفاصيل إعلان',
                hintTextDirection: TextDirection.rtl,
              ),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
            verticalSpace(10),
            const Text(
              'نوع العقار',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            verticalSpace(10),
            SizedBox(
              height: 50.h,
              child: DropdownButtonFormField<String>(
                icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                decoration: customDecoration('اختر نوع العقار'),
                value:
                    context.read<AddAdvertisementCubit>().selectedPropertyType,
                items: context
                    .read<AddAdvertisementCubit>()
                    .propertyTypes
                    .map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    context
                        .read<AddAdvertisementCubit>()
                        .updatePropertyType(value);
                  }
                },
              ),
            ),
            verticalSpace(10),
            const Text(
              'المنطقة',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            verticalSpace(10),
            SizedBox(
              height: 50.h,
              child: DropdownButtonFormField<String>(
                icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                decoration: customDecoration('اختر المنطقة'),
                value: context.read<AddAdvertisementCubit>().selectedRegion,
                items:
                    context.read<AddAdvertisementCubit>().regions.map((region) {
                  return DropdownMenuItem(
                    value: region,
                    child: Text(region),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    context.read<AddAdvertisementCubit>().updateRegion(value);
                  }
                },
              ),
            ),
            verticalSpace(10),
            const Text(
              'السعر',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              textDirection: TextDirection.rtl,
            ),
            AppTextFormField(
              hintText: 'السعر (د.ك)',
              keyboardType: TextInputType.number,
              controller: context.read<AddAdvertisementCubit>().priceController,
              validator: (value) {
                if (value == null || value.isEmpty) return 'يرجى إدخال السعر';
                return null;
              },
            ),
            verticalSpace(10),
            // --- Image Upload Area ---
            const Text(
              "رفع صور العقار",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            verticalSpace(10),
            BlocBuilder<AddAdvertisementCubit, AddAdvertisementState>(
              builder: (context, state) {
                var cubit = context.read<AddAdvertisementCubit>();

                return GestureDetector(
                  onTap: () => cubit.pickImage(),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: cubit.selectedImage != null
                        ? Column(
                            children: [
                              Image.file(cubit.selectedImage!, height: 100),
                              TextButton(
                                onPressed: () => cubit.pickImage(),
                                child: const Text("تغيير الصورة"),
                              )
                            ],
                          )
                        : Column(
                            children: [
                              Icon(
                                Icons.cloud_upload_outlined,
                                size: 40,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "اضغط لرفع صورة العقار",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                  ),
                );
              },
            ),

            const SizedBox(height: 40),
            AppTextButton(
              buttonText: 'إضافة إعلان  ',
              textStyle: StylesManager.font16White,
              onPressed: () {
                if (context
                            .read<AddAdvertisementCubit>()
                            .selectedPropertyType !=
                        null &&
                    context.read<AddAdvertisementCubit>().selectedRegion !=
                        null) {
                  context.read<AddAdvertisementCubit>().getAddAdvertisement();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("يرجى ملء جميع الحقول واختيار صورة"),
                    ),
                  );
                }
              },
            ),

            const AddAdsBloclistener(),
          ],
        ),
      ),
    );
  }
}
