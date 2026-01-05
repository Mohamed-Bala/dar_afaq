import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/constants_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../data/response/response.dart';
import '../view/home_details_view.dart';
import 'build_action_button.dart';

class HomeListView extends StatelessWidget {
  final List<VipAdsDataResponse?> vipAdsDataResponseList;
  const HomeListView({super.key, required this.vipAdsDataResponseList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: vipAdsDataResponseList.length,
      itemBuilder: (context, index) {
        return HomeCard(vipAdsDataResponse: vipAdsDataResponseList[index]);
      },
    );
  }
}

class HomeCard extends StatelessWidget {
  final VipAdsDataResponse? vipAdsDataResponse;
  const HomeCard({
    super.key,
    this.vipAdsDataResponse,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  HomeDetailsView(vipAdsDataResponse: vipAdsDataResponse),
            ),
          );
          //  context.pushNamed(Routes.propertyDetailsRoute);
        },
        child: Card(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 14.0.w),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 2,
          child: Column(
            children: <Widget>[
              // --- TOP SECTION: Image, Featured Tag, and Details ---
              Padding(
                padding: EdgeInsets.all(12.0.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Image/Logo Column
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        CachedNetworkImage(
                          imageUrl: vipAdsDataResponse?.images ?? "",
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) {
                            return Shimmer.fromColors(
                              baseColor: ColorManager.lightGrey,
                              highlightColor: Colors.white,
                              child: Container(
                                width: 110.w,
                                height: 120.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                          imageBuilder: (context, imageProvider) => Container(
                            width: 110.w,
                            height: 120.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(12.0),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    horizontalSpace(12),
                    // Details Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Tags Row
                          Row(
                            children: [
                              _buildTag(vipAdsDataResponse?.type ?? '',
                                  color: Colors.blue),
                              const SizedBox(width: 8),
                              _buildTag(
                                  vipAdsDataResponse?.transactionType ?? "",
                                  color: Colors.brown),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            vipAdsDataResponse?.type ?? "",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          // Description (with star icon)
                          Row(
                            children: [
                              //   if (listing.location == 'الزهراء')
                              const Icon(Icons.star_half,
                                  color: Colors.amber, size: 16),
                              const SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                  vipAdsDataResponse?.description ?? "",
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Location, Area, and Price
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              // Location and Area
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: ColorManager.primary,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    vipAdsDataResponse?.region ?? "",
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(width: 12),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 20),
                  // Price
                  Text(
                    '${vipAdsDataResponse?.price} ألف د.ك',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.primary,
                    ),
                  ),
                  //  buildActionButton(Icons.share_outlined, ColorManager.primary),
                ],
              ),

              const Divider(height: 1, thickness: 1),

              // --- BOTTOM SECTION: Agency and Actions ---
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    // Agency Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppConstants.companyName,
                            style: StylesManager.font12GrayRegular.copyWith(
                              color: ColorManager.black,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Action Buttons (Call, Chat)
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        makePhoneCall(vipAdsDataResponse?.phone ?? "");
                      },
                      child: buildActionButton(Icons.phone, Colors.blue),
                    ),
                    const SizedBox(width: 10),

                    GestureDetector(
                      onTap: () {
                        launchWhatsApp(vipAdsDataResponse?.phone ?? "");
                      },
                      child: buildActionButton(
                          Icons.chat_bubble_outline, Colors.blue),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String text, {MaterialColor color = Colors.blueGrey}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      margin: EdgeInsets.only(left: 8.w),
      decoration: BoxDecoration(
        color: color.shade100,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 10.sp, color: color.shade800),
      ),
    );
  }
}
