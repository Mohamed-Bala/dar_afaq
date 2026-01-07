import 'package:cached_network_image/cached_network_image.dart';
import 'package:dar_afaq/core/helper/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/di/di.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/routing/routes.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../dashboard/data/response/response.dart';
import '../../dashboard/logic/home_cubit.dart';
import '../../dashboard/logic/home_state.dart';

class ShowUserAdCard extends StatelessWidget {
  final ShowUserAdvertisementData? showUserAdvertisementData;
  const ShowUserAdCard({super.key, this.showUserAdvertisementData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.h),
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF1FAF5),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: (showUserAdvertisementData?.images?.isNotEmpty ?? false)
                ? CachedNetworkImage(
                    key: UniqueKey(),
                    imageUrl:
                        "${showUserAdvertisementData?.images}?t=${DateTime.now().millisecondsSinceEpoch}",
                    // imageUrl: showUserAdvertisementData?.images ?? "",
                    width: double.infinity,
                    height: 100.h,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: double.infinity,
                        height: 100.h,
                        color: Colors.white,
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      width: double.infinity,
                      height: 100.h,
                      color: Colors.grey[200],
                      child: Icon(
                        Icons.broken_image,
                        size: 40.sp,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : Container(
                    width: double.infinity,
                    height: 100.h,
                    color: Colors.grey[200],
                    child: Center(
                      child: Icon(
                        Icons.image,
                        size: 40.sp,
                        color: ColorManager.grey,
                      ),
                    ),
                  ),
          ),
          verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                showUserAdvertisementData?.type ?? "",
                style: StylesManager.font18BlackBold,
              ),
              Text(
                showUserAdvertisementData?.auctionDate != null
                    ? "${AppStrings.expiryDate.tr()}: ${showUserAdvertisementData!.auctionDate}"
                    : "",
                style: StylesManager.font12GrayRegular,
              ),
            ],
          ),
          verticalSpace(8),
          Text(
            showUserAdvertisementData?.description ?? "",
            style:
                StylesManager.font13Grey.copyWith(fontSize: 14.sp, height: 1.5),
          ),
          verticalSpace(8),
          Row(
            children: [
              Icon(Icons.location_on, size: 20.sp, color: ColorManager.primary),
              Text(
                showUserAdvertisementData?.region ?? "",
                style: StylesManager.font13Grey.copyWith(fontSize: 14.sp),
              ),
            ],
          ),
          verticalSpace(12),
          Text(
            'السعر: ${showUserAdvertisementData?.price ?? ""}',
            style: StylesManager.font13Grey.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: ColorManager.primary,
            ),
          ),
          verticalSpace(15),
          Row(
            children: [
              Expanded(
                child: AppTextButton(
                  buttonText:AppStrings.edit.tr(),
                  textStyle: StylesManager.font16White,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.editAdRoute,
                      arguments: {
                        'adData': showUserAdvertisementData,
                        'showUserAdCubit': context.read<ShowUserAdCubit>(),
                      },
                    );
                  },
                ),
              ),
              horizontalSpace(10),
              Expanded(
                child: BlocProvider(
                  create: (context) => di<DeleteAdCubit>(),
                  child: BlocConsumer<DeleteAdCubit, DeleteState>(
                    listener: (context, state) {
                      if (state is DeleteSuccess) {
                        Navigator.of(context, rootNavigator: true).pop();
                        context
                            .pushReplacementNamed(Routes.myAdvertisementsRoute);
                      }
                    },
                    builder: (context, state) {
                      return Builder(builder: (newcontext) {
                        return AppTextButton(
                          buttonText:AppStrings.delete.tr(),
                          backgroundColor: Colors.red.shade400,
                          textStyle: StylesManager.font16White,
                          onPressed: () {
                            final deleteCubit =
                                newcontext.read<DeleteAdCubit>();
                            showDialogWidget(newcontext, deleteCubit);
                          },
                        );
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> showDialogWidget(BuildContext context, DeleteAdCubit type) {
    return showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
         AppStrings.confirmDeleteTitle.tr(),
            textAlign: TextAlign.right,
            style: StylesManager.font12GrayRegular.copyWith(
              fontSize: 16.sp,
              color: Colors.black,
            ),
          ),
          content:  Text(
            AppStrings.confirmDeleteMessage.tr(),
            textAlign: TextAlign.right,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child:  Text(AppStrings.cancel.tr()),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade400,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                type.emitDeleteAds(showUserAdvertisementData?.id ?? 0);
              },
              child: Text(AppStrings.confirm.tr()),
            ),
          ],
        );
      },
    );
  }
}

class MyAdShimmerLoading extends StatelessWidget {
  const MyAdShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        height: 150, // نفس ارتفاع البطاقة الأصلية تقريباً
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
