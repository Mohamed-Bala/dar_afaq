import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../dashboard/data/response/response.dart';
import '../../../dashboard/logic/home_cubit.dart';
import '../../../dashboard/logic/home_state.dart';

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
        debugPrint("SUCCESS: Image updated in memory, length: ${bytes.length}");
      }
    } catch (e) {
      debugPrint("ERROR PICKING IMAGE: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    updateCubit = BlocProvider.of<UpdateAdCubit>(context);
    updateCubit.typeController =
        TextEditingController(text: widget.adData.type.toString());
    updateCubit.descriptionController =
        TextEditingController(text: widget.adData.description);
    updateCubit.priceController =
        TextEditingController(text: widget.adData.price.toString());
    updateCubit.regionController =
        TextEditingController(text: widget.adData.region);
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
              const SnackBar(
                content: Text("تم التعديل بنجاح"),
                backgroundColor: Colors.green,
              ),
            );
            context.read<ShowUserAdCubit>().emitGetUserAds();
            Navigator.pop(context);
          },
          updateAdError: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error.message ?? "حدث خطأ")),
            );
          },
        );
      },
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title:
                  Text("تعديل الإعلان", style: StylesManager.font18BlackBold),
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
                      _buildLabel("صورة الإعلان"),
                      _buildImageSection(),
                      verticalSpace(20),
                      _buildLabel("نوغ العقار"),
                      AppTextFormField(
                        controller: updateCubit.typeController,
                        hintText: "العقار",
                        keyboardType: TextInputType.text,
                        validator: (v) =>
                            v!.isEmpty ? "يرجى إدخال العقار" : null,
                      ),

                      // الحقول (TextFormFields)
                      _buildLabel("العنوان"),
                      AppTextFormField(
                        controller: updateCubit.regionController,
                        hintText: "عنوان الإعلان",
                        validator: (v) =>
                            v!.isEmpty ? "يرجى إدخال العنوان" : null,
                      ),

                      verticalSpace(16),
                      _buildLabel("السعر"),
                      AppTextFormField(
                        controller: updateCubit.priceController,
                        hintText: "السعر",
                        keyboardType: TextInputType.number,
                        validator: (v) =>
                            v!.isEmpty ? "يرجى إدخال السعر" : null,
                      ),

                      _buildLabel("وصف الإعلان"),
                      AppTextFormField(
                        controller: updateCubit.descriptionController,
                        hintText: "اكتب تفاصيل الإعلان هنا...",
                        // maxLines: 4,
                        validator: (v) =>
                            v!.isEmpty ? "يرجى إدخال الوصف" : null,
                      ),

                      verticalSpace(30),

                      // الزر المحدث
                      AppTextButton(
                        buttonText: state is UpdateAdLoading
                            ? "جاري الحفظ..."
                            : "حفظ التعديلات",
                        textStyle: StylesManager.font16White,
                        onPressed: state is UpdateAdLoading
                            ? () {}
                            : () {
                                if (updateCubit.formKey.currentState!
                                    .validate()) {
                                  // إرسال القيم من الـ Controllers إلى الـ Cubit
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
            // الحالة 1: إذا تم اختيار صورة جديدة (نعرضها من الذاكرة)
            if (imageRawBytes != null)
              Image.memory(
                imageRawBytes!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              )
            // الحالة 2: إذا لم يتم اختيار صورة، نعرض الصورة القديمة
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
            // الحالة 3: لا توجد صورة أصلاً
            else
              const Center(child: Icon(Icons.add_a_photo, size: 40)),

            // أيقونة التعديل
            Positioned(
              bottom: 8,
              right: 8,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.blue,
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
      child: Text(text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
    );
  }
}
