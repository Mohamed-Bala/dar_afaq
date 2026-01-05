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
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
      itemCount: auctionDataList.length,
      itemBuilder: (context, index) {
        return AuctionListItem(auctionData: auctionDataList[index]);
      },
    );
  }
}

//==============================================================================
class AuctionListItem extends StatelessWidget {
  final AuctionDataResponse? auctionData;

  const AuctionListItem({
    super.key,
    this.auctionData,
  });

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
        margin: EdgeInsets.symmetric(vertical: 8.0.w, horizontal: 8.0.h),
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(15.0.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              horizontalSpace(12),

              // Middle Section (Details)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.bookmark_border,
                              color: ColorManager.primary,
                            ),
                            horizontalSpace(4),
                            Text(
                              auctionData?.planName ?? "",
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.home,
                              size: 16.sp,
                              color: ColorManager.primary,
                            ),
                            horizontalSpace(4),
                            Text(
                              auctionData?.type ?? "",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 16.sp,
                              color: ColorManager.primary,
                            ),
                            horizontalSpace(4),
                            Text(
                              auctionData?.auctionDate ?? "",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16.sp,
                          color: ColorManager.primary,
                        ),
                        horizontalSpace(4),
                        Expanded(
                          child: Text(
                            auctionData?.region ?? "",
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
}
