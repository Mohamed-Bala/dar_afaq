import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../core/resources/color_manager.dart';
import '../../../../../data/response/response.dart';
import '../../../../../logic/home_cubit.dart';
import '../../../../../logic/home_state.dart';
import '../../../../widgets/build_action_button.dart';

class AdsResultSectionView extends StatelessWidget {
  const AdsResultSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        title: const Text("نتائج البحث"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BlocBuilder<FilterSctionCubit, FilterSectionState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text("اختر قسماً لبدء العرض")),
            filterSectionLoading: () =>
                const Center(child: CircularProgressIndicator()),
            filterSectionError: (error) =>
                Center(child: Text("حدث خطأ: $error")),
            filterSectionSuccess: (adsList) {
              if (adsList.data == null || adsList.data!.isEmpty) {
                return const Center(child: Text("لا توجد بيانات حالياً"));
              }

              return GridView.builder(
                padding: EdgeInsets.all(12.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 0.55,
                ),
                itemCount: adsList.data!.length,
                itemBuilder: (context, index) {
                  return GridHomeCard(
                    vipAdsDataResponse: adsList.data![index],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class GridHomeCard extends StatelessWidget {
  final FilterSectionModel? vipAdsDataResponse;
  const GridHomeCard({super.key, this.vipAdsDataResponse});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) =>
          //         HomeDetailsView(vipAdsDataResponse: vipAdsDataResponse),
          //   ),
          // );
        },
        child: Card(
          color: Colors.white,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. الصورة في الأعلى
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                child: CachedNetworkImage(
                  imageUrl: vipAdsDataResponse?.images ?? "",
                  height: 130.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.white,
                    child: Container(color: Colors.white),
                  ),
                ),
              ),

              // 2. تفاصيل الإعلان
              Padding(
                padding: EdgeInsets.all(8.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${vipAdsDataResponse?.price} د.ك',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.primary,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      vipAdsDataResponse?.type ?? "إعلان",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 12.sp,
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: Text(
                            vipAdsDataResponse?.region ?? "",
                            style:
                                TextStyle(fontSize: 11.sp, color: Colors.grey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // 3. أزرار التواصل في الأسفل
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSmallAction(Icons.phone, ColorManager.primary, () {
                      makePhoneCall(vipAdsDataResponse?.phone ?? "");
                    }),
                    _buildSmallAction(Icons.chat, ColorManager.primary, () {
                      launchWhatsApp(vipAdsDataResponse?.phone ?? "");
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSmallAction(IconData icon, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(6.r),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 16.sp),
      ),
    );
  }
}
