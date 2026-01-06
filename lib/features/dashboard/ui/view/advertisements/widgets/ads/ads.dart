import 'package:cached_network_image/cached_network_image.dart';
import 'package:dar_afaq/core/helper/spacing.dart';
import 'package:dar_afaq/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../../core/resources/constants_manager.dart';
import '../../../../../../../core/resources/styles_manager.dart';
import '../../../../../data/response/response.dart';
import '../../../../widgets/build_action_button.dart';

class AdCard extends StatelessWidget {
  final AdModel? adsData;

  const AdCard({
    super.key,
    this.adsData,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 14.0.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(12.0.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  adsData?.images?.isNotEmpty ?? false
                      ? CachedNetworkImage(
                          imageUrl: adsData?.images ?? '',
                          width: 110.w,
                          height: 120.h,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 110.w,
                              height: 100.h,
                              color: Colors.white,
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            width: 110.w,
                            height: 120.h,
                            color: Colors.grey[200],
                            child: const Icon(
                              Icons.broken_image,
                              size: 40,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : Container(
                          width: 110.w,
                          height: 120.h,
                          color: Colors.grey[200],
                          child: Center(
                            child: Icon(
                              Icons.image,
                              size: 40.sp,
                              color: Colors.grey,
                            ),
                          ),
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
                            _buildTag(
                              adsData?.transactionType ?? "",
                              color: Colors.blue,
                            ),
                            horizontalSpace(8),
                            _buildTag(
                              adsData?.type ?? "",
                              color: Colors.brown,
                            ),
                          ],
                        ),

                        verticalSpace(10),
                        Text(
                          adsData?.type ?? "",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        verticalSpace(4),
                        Row(
                          children: [
                            if (adsData?.region == 'الزهراء')
                              Icon(
                                Icons.star_half,
                                color: Colors.amber,
                                size: 16.sp,
                              ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                adsData?.description ?? "description",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),

                        verticalSpace(10),
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
                                horizontalSpace(4),
                                Text(
                                  adsData?.region ?? "",
                                  style: const TextStyle(fontSize: 14),
                                ),
                                horizontalSpace(12),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.h),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  '${adsData?.price ?? '0'} ألف د.ك',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.primary,
                  ),
                ),
              ),
            ),
            verticalSpace(10),
            const Divider(height: 1, thickness: 1),
            Padding(
              padding: EdgeInsets.all(12.0.h),
              child: Row(
                children: [
                  // Agency Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "شركه دار أفاق العقاريه",
                          style: StylesManager.font12GrayRegular.copyWith(
                            color: ColorManager.black,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Action Buttons (Call, Chat)
                  horizontalSpace(10),
                  GestureDetector(
                    onTap: () {
                      makePhoneCall(AppConstants.afaqPhoneNumber);
                    },
                    child: buildActionButton(Icons.phone, Colors.blue),
                  ),
                  horizontalSpace(10),
                  GestureDetector(
                    onTap: () {
                      launchWhatsApp(AppConstants.afaqPhoneNumber);
                    },
                    child: buildActionButton(
                      Icons.chat_bubble_outline,
                      Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build the property tags
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
