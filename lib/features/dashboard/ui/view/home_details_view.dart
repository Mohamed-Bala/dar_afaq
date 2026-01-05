import 'package:dar_afaq/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/resources/constants_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../data/response/response.dart';

class HomeDetailsView extends StatelessWidget {
  final VipAdsDataResponse? vipAdsDataResponse;
  const HomeDetailsView({super.key, this.vipAdsDataResponse});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        // Image goes behind app bar
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.share, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                height: 250.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      vipAdsDataResponse?.images ?? "",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              verticalSpace(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vipAdsDataResponse?.type ?? "",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          vipAdsDataResponse?.price ?? "",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.primary,
                          ),
                        ),
                        horizontalSpace(5),
                        Text(
                          'د.ك',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.primary,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: ColorManager.primary,
                              size: 16,
                            ),
                            horizontalSpace(4),
                            Text(
                              vipAdsDataResponse?.region ?? " ",
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        const Row(
                          children: [],
                        ),
                        Text(
                          vipAdsDataResponse?.auctionDate ?? "",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    verticalSpace(10),
                  ],
                ),
              ),
              verticalSpace(15),
              const Divider(thickness: 1, height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(8),
                    Text(
                      (vipAdsDataResponse?.description ?? 'لا يوجد وصف')
                          .replaceAll('\n', ' ')
                          .replaceAll('\r', ' ')
                          .trim(),
                      textAlign: TextAlign.right,
                      maxLines: 5,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    )
                  ],
                ),
              ),
              verticalSpace(80),
            ],
          ),
        ),
        bottomSheet: bottomSheetWidget(),
      ),
    );
  }

  Container bottomSheetWidget() {
    return Container(
      color: ColorManager.white,
      padding: EdgeInsets.symmetric(vertical: 40.0.h, horizontal: 16.0.w),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    horizontalSpace(10),
                    Text(
                      AppConstants.companyName,
                      style: StylesManager.font12GrayRegular.copyWith(
                        color: ColorManager.black,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          horizontalSpace(10),
          _buildContactButton(Icons.call),
          horizontalSpace(10),
          _buildContactButton(Icons.chat_bubble_outline),
          horizontalSpace(10),
        ],
      ),
    );
  }

  // Helper Widget for Contact Buttons
  Widget _buildContactButton(
    IconData icon,
  ) {
    return Container(
      padding: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.primary),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Icon(icon, color: ColorManager.primary, size: 20.sp),
    );
  }
}
