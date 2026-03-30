import 'dart:convert';
import 'dart:io';
import 'package:afaq_real_estate/core/resources/color_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../dashboard/data/response/response.dart';
import '../../../dashboard/logic/home_cubit.dart';
import '../../../dashboard/logic/home_state.dart';
import '../../../dashboard/ui/view/advertisements/widgets/add_ads/custom_decoration.dart';

class EditAdvertisementView extends StatefulWidget {
  final ShowUserAdvertisementData adData;
  const EditAdvertisementView({super.key, required this.adData});

  @override
  State<EditAdvertisementView> createState() => _EditAdvertisementViewState();
}

class _EditAdvertisementViewState extends State<EditAdvertisementView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late UpdateAdCubit updateCubit;
  File? selectedImageFile;
  String? base64Image;
  Uint8List? imageRawBytes;
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );

      if (pickedFile != null) {
        // قراءة البيانات قبل الـ setState لضمان عدم حدوث تأخير في الرسم
        final Uint8List bytes = await pickedFile.readAsBytes();

        if (mounted) {
          setState(() {
            imageRawBytes = bytes;
            selectedImageFile = File(pickedFile.path);
            // تحويل الصورة لـ Base64 لكي ترسل فعلياً للسيرفر عند الحفظ
            base64Image = "data:image/jpeg;base64,${base64Encode(bytes)}";
          });
        }
        //   debugPrint("SUCCESS: Image updated in memory, length: ${bytes.length}");
      }
    } catch (e) {
      //  debugPrint("ERROR PICKING IMAGE: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    updateCubit = BlocProvider.of<UpdateAdCubit>(context);
    // initialize controllers with existing ad data
    updateCubit.typeController =
        TextEditingController(text: widget.adData.type.toString());
    updateCubit.descriptionController =
        TextEditingController(text: widget.adData.description);
    updateCubit.priceController =
        TextEditingController(text: widget.adData.price.toString());
    updateCubit.regionController =
        TextEditingController(text: widget.adData.region);

    // also set initial selection for the AddAdvertisementCubit dropdowns
    final addCubit = context.read<AddAdvertisementCubit>();
    // if property types and regions may not have loaded yet, we'll still store
    // the value and update when they arrive -- update functions emit state
    addCubit.updatePropertyType(widget.adData.type.toString());
    addCubit.updateRegion(widget.adData.region ?? "");
  }

  @override
  void dispose() {
    context.read<UpdateAdCubit>().titleController.dispose();
    context.read<UpdateAdCubit>().descriptionController.dispose();
    context.read<UpdateAdCubit>().priceController.dispose();
    context.read<UpdateAdCubit>().regionController.dispose();
    context.read<UpdateAdCubit>().typeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateAdCubit, UpdateAdState>(
      listener: (context, state) {
        state.whenOrNull(
          updateAdSuccess: (response) async {
            if (!mounted) return;

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppStrings.updateSuccess.tr()),
                backgroundColor: Colors.green,
              ),
            );
            context.read<ShowUserAdCubit>().emitGetUserAds();
            Navigator.pop(context);
          },
          updateAdError: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  error.message ?? AppStrings.errorOccurred.tr(),
                ),
              ),
            );
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(
              AppStrings.editAdTitle.tr(),
              style: StylesManager.font18BlackBold,
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Form(
                key: updateCubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel(AppStrings.adImage.tr()),
                    _buildImageSection(),
                    verticalSpace(20),
                    _buildLabel(AppStrings.propertyType.tr()),
                    SizedBox(
                      height: 53.h,
                      child: BlocBuilder<AddAdvertisementCubit,
                          AddAdvertisementState>(
                        buildWhen: (previous, current) =>
                            current is PropertyTypesLoading ||
                            current is PropertyTypesSuccess ||
                            current is PropertyTypesError ||
                            current is PropertyTypeChanged,
                        builder: (context, state) {
                          var cubit = context.read<AddAdvertisementCubit>();
                          if (state is PropertyTypesLoading) {
                            return DropdownButtonFormField<String>(
                              icon: const Icon(Icons.arrow_drop_down,
                                  color: Colors.grey),
                              decoration:
                                  customDecoration(AppStrings.loading.tr()),
                              value: null,
                              items: [],
                              onChanged: null,
                            );
                          } else if (state is PropertyTypesError) {
                            return DropdownButtonFormField<String>(
                              icon: const Icon(Icons.error, color: Colors.red),
                              decoration: customDecoration(
                                  AppStrings.errorOccurred.tr()),
                              value: null,
                              items: [],
                              onChanged: null,
                            );
                          } else {
                            // PropertyTypesSuccess or initial state
                            return DropdownButtonFormField<String>(
                              icon: const Icon(Icons.arrow_drop_down,
                                  color: Colors.grey),
                              decoration: customDecoration(
                                  AppStrings.choosePropertyType.tr()),
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
                                        // mirror selection in update controller
                                        updateCubit.typeController.text = value;
                                      }
                                    }
                                  : null,
                            );
                          }
                        },
                      ),
                    ),
                    // AppTextFormField(
                    //   controller: updateCubit.typeController,
                    //   hintText: AppStrings.property.tr(),
                    //   keyboardType: TextInputType.text,
                    //   validator: (v) =>
                    //       v!.isEmpty ? AppStrings.enterPropertyType.tr() : null,
                    // ),
                    verticalSpace(20),
                    // الحقول (TextFormFields)
                    _buildLabel(AppStrings.region.tr()),
                    SizedBox(
                      height: 50.h,
                      child: BlocBuilder<AddAdvertisementCubit,
                          AddAdvertisementState>(
                        buildWhen: (previous, current) =>
                            current is RegionsLoading ||
                            current is RegionsSuccess ||
                            current is RegionsError ||
                            current is RegionChanged,
                        builder: (context, state) {
                          var cubit = context.read<AddAdvertisementCubit>();
                          if (state is RegionsLoading) {
                            return DropdownButtonFormField<String>(
                              icon: const Icon(Icons.arrow_drop_down,
                                  color: Colors.grey),
                              decoration:
                                  customDecoration(AppStrings.loading.tr()),
                              value: null,
                              items: [],
                              onChanged: null,
                            );
                          } else if (state is RegionsError) {
                            return DropdownButtonFormField<String>(
                              icon: const Icon(Icons.error, color: Colors.red),
                              decoration: customDecoration(
                                  AppStrings.errorOccurred.tr()),
                              value: null,
                              items: [],
                              onChanged: null,
                            );
                          } else {
                            return DropdownButtonFormField<String>(
                              icon: const Icon(Icons.arrow_drop_down,
                                  color: Colors.grey),
                              decoration: customDecoration(
                                  AppStrings.chooseRegion.tr()),
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
                                        // mirror selection in update controller
                                        updateCubit.regionController.text = value;
                                      }
                                    }
                                  : null,
                            );
                          }
                        },
                      ),
                    ),
                    verticalSpace(16),
                    _buildLabel(AppStrings.price.tr()),
                    AppTextFormField(
                      controller: updateCubit.priceController,
                      hintText: AppStrings.priceCurrencyHint.tr(),
                      keyboardType: TextInputType.number,
                      validator: (v) => v!.isEmpty
                          ? AppStrings.priceValidationError.tr()
                          : null,
                    ),

                    _buildLabel(AppStrings.adDescription.tr()),
                    TextFormField(
                      controller: updateCubit.descriptionController,
                      maxLines: 5,
                      maxLength: 250,
                      decoration:
                          customDecoration(AppStrings.adDescriptionHint.tr()),
                      // InputDecoration(
                      //   contentPadding: EdgeInsets.symmetric(
                      //       vertical: 16.h, horizontal: 16.w),
                      //   border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(12.r),
                      //     borderSide: BorderSide(color: Colors.grey.shade400),
                      //   ),
                      //   hintText: AppStrings.adDescriptionHint.tr(),
                      // ),
                      textAlign: TextAlign.right,
                    ),

                    // AppTextFormField(
                    //   controller: updateCubit.descriptionController,
                    //   hintText: AppStrings.adDescriptionHint.tr(),
                    //  maxLines: 4,
                    //   validator: (v) =>
                    //       v!.isEmpty ? AppStrings.enterDescription.tr() : null,
                    // ),

                    verticalSpace(30),

                    // الزر المحدث
                    AppTextButton(
                      buttonText: state is UpdateAdLoading
                          ? AppStrings.saving.tr()
                          : AppStrings.saveChanges.tr(),
                      textStyle: StylesManager.font16White,
                      onPressed: state is UpdateAdLoading
                          ? () {}
                          : () {
                              if (updateCubit.formKey.currentState!
                                  .validate()) {
                                updateCubit.emitUpdateAd(
                                  adId: widget.adData.id ?? 0,
                                  selectedPlanName:
                                      widget.adData.planName ?? "",
                                  transactionType:
                                      widget.adData.transactionType ?? "",
                                  imageBase64: base64Image,
                                );
                              }
                            },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageSection() {
    return Container(
      height: 180.h,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.grey[300],
      ),
      child: InkWell(
        onTap: _pickImage,
        child: Stack(
          children: [
            if (imageRawBytes != null)
              Image.memory(
                imageRawBytes!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              )
            else if (widget.adData.images != null &&
                widget.adData.images!.isNotEmpty)
              CachedNetworkImage(
                imageUrl: widget.adData.images!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                errorWidget: (context, url, error) =>
                    const Icon(Icons.broken_image),
              )
            else
              const Center(child: Icon(Icons.add_a_photo, size: 40)),
            Positioned(
              bottom: 8,
              right: 8,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: ColorManager.primary,
                child: Icon(Icons.edit, size: 15, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        text,
        style:  TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
      ),
    );
  }
}
