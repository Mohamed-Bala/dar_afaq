import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/helper/extensions.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
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
    final bool isAr = Localizations.localeOf(context).languageCode == 'ar';
    final String currency = isAr ? ' د.ك' : 'KWD';
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HomeDetailsView(vipAdsDataResponse: vipAdsDataResponse),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 14.0.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        elevation: 2,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(12.0.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                            borderRadius: BorderRadius.circular(12.0.r),
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            _buildTag(vipAdsDataResponse?.type ?? '',
                                color: Colors.blue),
                            const SizedBox(width: 8),
                            _buildTag(
                              vipAdsDataResponse?.transactionType ?? "",
                              color: Colors.brown,
                            ),
                          ],
                        ),
                        verticalSpace(10),
                        Text(
                          vipAdsDataResponse?.type ?? "",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        verticalSpace(4),
                        Row(
                          children: [
                            Icon(
                              Icons.star_half,
                              color: Colors.amber,
                              size: 16.sp,
                            ),
                            horizontalSpace(4),
                            Flexible(
                              child: Text(
                                vipAdsDataResponse?.description ?? "",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: ColorManager.primary,
                                  size: 16.sp,
                                ),
                                horizontalSpace(4),
                                Text(
                                  vipAdsDataResponse?.region ?? "",
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                                horizontalSpace(4),
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
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: Text(
                '${vipAdsDataResponse?.price ?? '0'} $currency',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.primary,
                ),
              ),
            ),
            Divider(height: 1.h, thickness: 1),
            Padding(
              padding: EdgeInsets.all(12.0.h),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.appName.tr(),
                          style: StylesManager.font12GrayRegular.copyWith(
                            color: ColorManager.black,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  horizontalSpace(10),
                  GestureDetector(
                    onTap: () {
                      AuthGuard.runAction(context, onAuthenticated: () {
                        makePhoneCall(vipAdsDataResponse?.phone ?? "");
                      });
                    },
                    child: buildActionButton(Icons.phone, ColorManager.primary),
                  ),
                  horizontalSpace(10),
                  GestureDetector(
                    onTap: () {
                      AuthGuard.runAction(context, onAuthenticated: () {
                        launchWhatsApp(vipAdsDataResponse?.phone ?? "");
                      });
                    },
                    child: buildActionButton(
                      FontAwesomeIcons.whatsapp,
                      ColorManager.primary,
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
