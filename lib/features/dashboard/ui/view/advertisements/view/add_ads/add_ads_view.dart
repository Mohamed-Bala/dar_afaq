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
    final cubit = context.read<AddAdvertisementCubit>();
    cubit.getPropertyTypes();
    cubit.getRegions();
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
                style: TextStyle(
                  fontSize: 16.sp,
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
            height: 53.h,
            child: BlocBuilder<AddAdvertisementCubit, AddAdvertisementState>(
              buildWhen: (previous, current) =>
                  current is PropertyTypesLoading ||
                  current is PropertyTypesSuccess ||
                  current is PropertyTypesError,
              builder: (context, state) {
                var cubit = context.read<AddAdvertisementCubit>();
                if (state is PropertyTypesLoading) {
                  return DropdownButtonFormField<String>(
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                    decoration: customDecoration(AppStrings.loading.tr()),
                    value: null,
                    items: [],
                    onChanged: null,
                  );
                } else if (state is PropertyTypesError) {
                  return DropdownButtonFormField<String>(
                    icon: const Icon(Icons.error, color: Colors.red),
                    decoration: customDecoration(AppStrings.errorOccurred.tr()),
                    value: null,
                    items: [],
                    onChanged: null,
                  );
                } else {
                  // PropertyTypesSuccess or initial state
                  return DropdownButtonFormField<String>(
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                    decoration:
                        customDecoration(AppStrings.choosePropertyType.tr()),
                    value: cubit.selectedPropertyType,
                    items: cubit.propertyTypes.isNotEmpty
                        ? cubit.propertyTypes.map((type) {
                            return DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            );
                          }).toList()
                        : [],
                    onChanged: cubit.propertyTypes.isNotEmpty
                        ? (value) {
                            if (value != null) {
                              cubit.updatePropertyType(value);
                            }
                          }
                        : null,
                  );
                }
              },
            ),
          ),
          verticalSpace(10),
          Text(
            AppStrings.region.tr(),
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          verticalSpace(10),
          SizedBox(
            height: 50.h,
            child: BlocBuilder<AddAdvertisementCubit, AddAdvertisementState>(
              buildWhen: (previous, current) =>
                  current is RegionsLoading ||
                  current is RegionsSuccess ||
                  current is RegionsError,
              builder: (context, state) {
                var cubit = context.read<AddAdvertisementCubit>();
                if (state is RegionsLoading) {
                  return DropdownButtonFormField<String>(
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                    decoration: customDecoration(AppStrings.loading.tr()),
                    value: null,
                    items: [],
                    onChanged: null,
                  );
                } else if (state is RegionsError) {
                  return DropdownButtonFormField<String>(
                    icon: const Icon(Icons.error, color: Colors.red),
                    decoration: customDecoration(AppStrings.errorOccurred.tr()),
                    value: null,
                    items: [],
                    onChanged: null,
                  );
                } else {
                  return DropdownButtonFormField<String>(
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                    decoration: customDecoration(AppStrings.chooseRegion.tr()),
                    value: cubit.selectedRegion,
                    items: cubit.regions.isNotEmpty
                        ? cubit.regions.map((region) {
                            return DropdownMenuItem(
                              value: region,
                              child: Text(region),
                            );
                          }).toList()
                        : [],
                    onChanged: cubit.regions.isNotEmpty
                        ? (value) {
                            if (value != null) {
                              cubit.updateRegion(value);
                            }
                          }
                        : null,
                  );
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
                onTap: () => cubit.showImageSource(context),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: cubit.selectedImage != null
                      ? Stack(
                          alignment: Alignment.topRight,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.file(
                                cubit.selectedImage!,
                                height: 160.h,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: GestureDetector(
                                onTap: () => cubit.showImageSource(context),
                                child: Container(
                                  padding: EdgeInsets.all(6.h),
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 18.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.cloud_upload_outlined,
                                size: 30.sp,
                                color: Colors.grey[600],
                              ),
                            ),
                            verticalSpace(10),
                            Text(
                              AppStrings.clickToUpload.tr(),
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 14.sp,
                              ),
                            ),

                            //  verticalSpace(10),
                            // /// 🔹 تلميح
                            // Text(
                            //   "PNG, JPG",
                            //   style: TextStyle(
                            //     color: Colors.grey[400],
                            //     fontSize: 12,
                            //   ),
                            // ),
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
