import 'package:afaq_real_estate/core/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
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
        title: Text(AppStrings.addAd.tr()),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0.h),
        children: [
          verticalSpace(24),
          BlocBuilder<AddAdvertisementCubit, AddAdvertisementState>(
            builder: (context, state) {
              var cubit = context.read<AddAdvertisementCubit>();

              return Text(
                '${AppStrings.selectedSection.tr()} : ${cubit.selectedTransactionType}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              );
            },
          ),
          verticalSpace(24),
          Text(
            AppStrings.adDescription.tr(),
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          verticalSpace(10),
          TextFormField(
            controller:
                context.read<AddAdvertisementCubit>().descriptionController,
            maxLines: 5,
            maxLength: 250,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              hintText: AppStrings.adDetails.tr(),
            ),
            textAlign: TextAlign.right,
          ),
          verticalSpace(10),
          Text(
            AppStrings.propertyType.tr(),
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          verticalSpace(10),
          SizedBox(
            height: 50.h,
            child: DropdownButtonFormField<String>(
              icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
              decoration: customDecoration(AppStrings.choosePropertyType.tr()),
              value: context.read<AddAdvertisementCubit>().selectedPropertyType,
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
          Text(
            AppStrings.region.tr(),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          verticalSpace(10),
          SizedBox(
            height: 50.h,
            child: DropdownButtonFormField<String>(
              icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
              decoration: customDecoration(AppStrings.chooseRegion.tr()),
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
          Text(
            AppStrings.price.tr(),
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          AppTextFormField(
            hintText: AppStrings.priceHint.tr(),
            keyboardType: TextInputType.number,
            controller: context.read<AddAdvertisementCubit>().priceController,
            validator: (value) {
              if (value == null || value.isEmpty)
                return AppStrings.enterPriceError.tr();
              return null;
            },
          ),
          verticalSpace(10),
          Text(
            AppStrings.uploadPhotos.tr(),
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
                              child: Text(AppStrings.changePhoto.tr()),
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
                            Text(
                              AppStrings.clickToUpload.tr(),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                ),
              );
            },
          ),
          SizedBox(height: 40.h),
          AppTextButton(
            buttonText: AppStrings.addAd.tr(),
            textStyle: StylesManager.font16White,
            onPressed: () {
              if (context.read<AddAdvertisementCubit>().selectedPropertyType !=
                      null &&
                  context.read<AddAdvertisementCubit>().selectedRegion !=
                      null) {
                context.read<AddAdvertisementCubit>().getAddAdvertisement();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(AppStrings.fillAllFieldsError.tr()),
                  ),
                );
              }
            },
          ),
          const AddAdsBloclistener(),
        ],
      ),
    );
  }
}
