import 'package:dar_afaq/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helper/spacing.dart';
import '../../dashboard/data/response/response.dart';
import '../../dashboard/ui/widgets/build_action_button.dart';

class AuctionDetails extends StatelessWidget {
  final AuctionDataResponse? auctionData;
  const AuctionDetails({
    super.key,
    required this.auctionData,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // Ensure RTL layout
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true, // Image goes behind app bar
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          // actions: [
          //   IconButton(
          //     icon: const Icon(Icons.favorite, color: Colors.white),
          //     onPressed: () {},
          //   ),
          //   // IconButton(
          //   //   icon: const Icon(Icons.share, color: Colors.white),
          //   //   onPressed: () {},
          //   // ),
          // ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageHeader(context),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(8),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: ColorManager.primary,
                          size: 18.sp,
                        ),
                        horizontalSpace(4),
                        Text(
                          auctionData?.region ?? "",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          auctionData?.auctionDate ?? "",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(10),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [],
                    ),
                    Divider(height: 25.h),
                    Text(
                      'عن المزاد',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    verticalSpace(8),
                    Text(
                      auctionData?.description ?? "",
                      style: TextStyle(fontSize: 15.sp, height: 1.5),
                    ),
                    verticalSpace(10),
                  ],
                ),
              ),
              _buildAgencyFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageHeader(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: auctionData?.images ?? "",
          height: 250.h,
          width: double.infinity,
          fit: BoxFit.cover,
          // يظهر أثناء التحميل
          placeholder: (context, url) => Container(
            color: Colors.grey[200],
            child: const Center(child: CircularProgressIndicator()),
          ),

          errorWidget: (context, url, error) => Container(
            color: Colors.grey[300],
            child: const Icon(Icons.error),
          ),
        )
      ],
    );
  }

  Widget _buildAgencyFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              launchWhatsApp(auctionData?.phone ?? '');
            },
            child: buildActionButton(
              Icons.chat_bubble_outline,
              Colors.blue,
            ),
          ),
          horizontalSpace(15),
          GestureDetector(
              onTap: () {
                makePhoneCall(auctionData?.phone ?? '');
              },
              child: buildActionButton(
                Icons.phone,
                Colors.blue,
              )),
        ],
      ),
    );
  }
}
