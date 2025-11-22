import 'package:dar_afaq/core/helper/extensions.dart';
import 'package:dar_afaq/core/helper/spacing.dart';
import 'package:dar_afaq/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routing/routes.dart';

class Listing {
  final String title;
  final String description;
  final String location;
  final int areaSqMeters;
  final double priceInK;
  final bool isFeatured;
  final String listingType;
  final String propertyType;
  final String agencyName;
  final String agencyDetails;
  final String? imageAsset; // To handle the different images

  Listing({
    required this.title,
    required this.description,
    required this.location,
    required this.areaSqMeters,
    required this.priceInK,
    this.isFeatured = false,
    required this.listingType,
    required this.propertyType,
    required this.agencyName,
    required this.agencyDetails,
    this.imageAsset,
  });
}

class AdCard extends StatelessWidget {
  // final String title;
  // final String location;
  // final String description;
  // final String price;
  // final String type; // e.g., 'سكني', 'بيت', 'للبيع'
  // final String imageUrl;
  // final bool isFeatured;
  final Listing listing;

  const AdCard({
    required this.listing,
    super.key,

    // required this.title,
    // required this.location,
    // required this.description,
    // required this.price,
    // required this.type,
    // required this.imageUrl,
    // this.isFeatured = false,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () {
          context.pushNamed(Routes.propertyDetailsRoute);
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
                    _buildImageSection(context),
                    horizontalSpace(12),
                    // Details Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Tags Row
                          Row(
                            children: [
                              _buildTag(listing.listingType,
                                  color: Colors.blue),

                              const SizedBox(width: 8),
                              _buildTag(listing.propertyType,
                                  color: Colors.brown),

                              const SizedBox(width: 8),
                              _buildTag('سكني', color: Colors.green),
                              // Added Skany tag
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Title
                          Text(
                            listing.title,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          // Description (with star icon)
                          Row(
                            children: [
                              if (listing.location == 'الزهراء')
                                const Icon(Icons.star_half,
                                    color: Colors.amber, size: 16),
                              const SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                  listing.description,
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
                                  Icon(Icons.location_on,
                                      color: ColorManager.primary2, size: 16),
                                  const SizedBox(width: 4),
                                  Text(listing.location,
                                      style: const TextStyle(fontSize: 14)),
                                  const SizedBox(width: 12),
                                  Icon(Icons.square_foot,
                                      color: ColorManager.primary2, size: 16),
                                  const SizedBox(width: 4),
                                  Text('${listing.areaSqMeters} م²',
                                      style: const TextStyle(fontSize: 14)),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 20),
                  // Price
                  Text(
                    '${listing.priceInK.toStringAsFixed(0)} ألف د.ك',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.primary2,
                    ),
                  ),
                  _buildActionButton(
                      Icons.share_outlined, ColorManager.primary),
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
                            listing.agencyName,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            listing.agencyDetails,
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    // Action Buttons (Call, Chat)
                    const SizedBox(width: 10),
                    _buildActionButton(Icons.phone, Colors.blue),
                    const SizedBox(width: 10),
                    _buildActionButton(Icons.chat_bubble_outline, Colors.blue),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    // Placeholder function for the image and featured tag combination
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8.r),
            image: DecorationImage(
              // Use Image.asset for specific images
              image: NetworkImage(
                listing.imageAsset ??
                    'https://images.pexels.com/photos/9938940/pexels-photo-9938940.jpeg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Featured Tag Overlay
        if (listing.isFeatured)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
            decoration: BoxDecoration(
              color: Colors.amber.shade700,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Colors.white, size: 12.sp),
                horizontalSpace(4),
                Text(
                  'إعلان مميز',
                  style: TextStyle(color: Colors.white, fontSize: 10.sp),
                ),
              ],
            ),
          ),
      ],
    );
  }

// Helper method to build action buttons (call/chat/share)
  Widget _buildActionButton(IconData icon, Color color) {
    // Only the call and chat buttons have the blue circular border in the image
    bool isPrimaryAction =
        (icon == Icons.phone || icon == Icons.chat_bubble_outline);

    return Container(
      padding: EdgeInsets.all(8.h),
      decoration: isPrimaryAction
          ? BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ColorManager.primary2),
            )
          : null, // No specific decoration for the share icon
      child: Icon(
        icon,
        color: isPrimaryAction ? ColorManager.primary2 : color,
        size: 20.sp,
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
