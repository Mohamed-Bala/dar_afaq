import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/resources/color_manager.dart';
import '../../dashboard/data/response/response.dart';
import 'auction_details.dart';

class AutionWidget extends StatelessWidget {
  final List<AuctionDataResponse?> auctionDataList;
  const AutionWidget({super.key, required this.auctionDataList});

  @override
  Widget build(BuildContext context) {
    if (auctionDataList.isEmpty) {
      return const Center(child: Text("لا توجد مزادات حالياً"));
    }
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
      itemCount: auctionDataList.length,
      shrinkWrap: false,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return AuctionListItem(auctionData: auctionDataList[index]);
      },
    );
  }
}

class AuctionListItem extends StatelessWidget {
  final AuctionDataResponse? auctionData;

  const AuctionListItem({super.key, this.auctionData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AuctionDetails(auctionData: auctionData),
          ),
        );
      },
      child: Card(
        color: ColorManager.white,
        margin: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.0.w),
        elevation: 2,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: Padding(
          padding: EdgeInsets.all(12.0.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildInfoItem(
                          Icons.home,
                          auctionData?.type ?? "عقار",
                        ),
                        _buildInfoItem(
                          Icons.calendar_today,
                          auctionData?.auctionDate ?? "قريباً",
                        ),
                      ],
                    ),
                    verticalSpace(15.h),
                    Row(
                      children: [
                        Icon(Icons.location_on,
                            size: 16.sp, color: ColorManager.primary),
                        horizontalSpace(4.w),
                        Expanded(
                          child: Text(
                            auctionData?.region ?? "غير محدد",
                            style: TextStyle(
                              color: ColorManager.grey,
                              fontSize: 13.sp,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
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

  Widget _buildInfoItem(IconData icon, String label, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14.sp, color: ColorManager.primary),
          horizontalSpace(4.w),
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
