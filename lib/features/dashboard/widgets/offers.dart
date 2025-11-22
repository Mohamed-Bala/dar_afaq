// New: compact grid of offers that can be embedded inside outer SingleChildScrollView
import 'package:dar_afaq/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/styles_manager.dart';
import '../../../core/routing/routes.dart';

class OffersGrid extends StatelessWidget {
  const OffersGrid({super.key});

  // sample data (replace with real data source)
  List<Map<String, String>> get _offers => [
        {
          'title': 'فيلا العاصمة',
          'subtitle': 'مقدم ١٥ ٪ – تقسيط حتى ٥ سنوات',
          'price': '3,200,000 د.ك',
          'image':
              'https://images.pexels.com/photos/5998120/pexels-photo-5998120.jpeg',
        },
        {
          'title': 'شقة راقية',
          'subtitle': 'مفروشة بالكامل',
          'price': '450 د.ك/شهر',
          'image':
              'https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg',
        },
        {
          'title': 'محل تجاري',
          'subtitle': 'موقع مميز',
          'price': '800 د.ك/شهر',
          'image':
              'https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg',
        },
        {
          'title': 'أرض للبيع',
          'subtitle': 'مساحة واسعة',
          'price': '1,200,000 د.ك',
          'image':
              'https://images.pexels.com/photos/259588/pexels-photo-259588.jpeg',
        },
      ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        physics:
            const NeverScrollableScrollPhysics(), // outer scroll controls scrolling
        shrinkWrap: true, // let grid size itself to children
        itemCount: _offers.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // two columns
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.72, // adjust for card height
        ),
        itemBuilder: (context, index) {
          final item = _offers[index];
          return OfferTile(
            title: item['title'] ?? '',
            subtitle: item['subtitle'] ?? '',
            price: item['price'] ?? '',
            imageUrl: item['image'] ?? '',
          );
        },
      ),
    );
  }
}

class OfferTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String imageUrl;

  const OfferTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imageUrl,
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 6,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        Container(color: Colors.grey.shade300),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        subtitle,
                        style: StylesManager.font12GrayRegular
                            .copyWith(fontSize: 10.sp),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                      ),
                      const Spacer(),
                      Text(
                        price,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// ...existing code...