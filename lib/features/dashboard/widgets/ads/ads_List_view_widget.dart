import 'package:flutter/material.dart';

import 'ads.dart';

class AdsListViewWidget extends StatelessWidget {
  AdsListViewWidget({
    super.key,
  });

// Mock data for the two listings in the new image
  final List<Listing> _mockListings = [
    Listing(
      title: 'للبيع - ارض فضاء',
      description: 'للبيع اراضي في الزهراء مواقع زوايه و...',
      location: 'الزهراء',
      areaSqMeters: 400,
      priceInK: 380,
      isFeatured: true,
      listingType: 'للبيع',
      propertyType: 'ارض فضاء',
      agencyName: 'شرق الوطنية العقارية',
      agencyDetails: 'شرق الوطنية العقارية',
      imageAsset:
          'https://images.pexels.com/photos/9938940/pexels-photo-9938940.jpeg', // Placeholder image asset
    ),
    Listing(
      title: 'للبيع - بيت',
      description: 'للبيع قسيمه بالزهراء ق 4 شارع واحد مقابل شارع مفتوح ...',
      location: 'الزهراء',
      areaSqMeters: 375,
      priceInK: 480,
      isFeatured: true,
      listingType: 'للبيع',
      propertyType: 'بيت',
      agencyName: 'حساب وسيط',
      agencyDetails: 'شركه الاعتماد الدوليه العقاريه',
      imageAsset:
          'https://images.pexels.com/photos/26556320/pexels-photo-26556320.jpeg', // Placeholder image asset
    ),
    Listing(
      title: 'للبيع - عمارة استثمارية',
      description: 'للبيع قسيمه بالزهراء ق 4 شارع واحد مقابل شارع مفتوح ...',
      location: 'الزهراء',
      areaSqMeters: 375,
      priceInK: 480,
      isFeatured: true,
      listingType: 'للبيع',
      propertyType: 'استثمارية',
      agencyName: 'حساب وسيط',
      agencyDetails: 'شركه الشراع الدوليه العقاريه',
      imageAsset:
          'https://www.pexels.com/photo/apartment-interior-with-open-kitchen-near-table-with-chairs-6899345/', // Placeholder image asset
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // let ListView size itself to its children
      physics: const NeverScrollableScrollPhysics(), // disable internal scroll
      padding: EdgeInsets.zero, // Remove default listview padding
      itemCount: _mockListings.length,
      itemBuilder: (context, index) {
        return AdCard(listing: _mockListings[index]);
      },
    );
  }
}
