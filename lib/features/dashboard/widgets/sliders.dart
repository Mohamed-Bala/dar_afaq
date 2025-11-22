import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalImageList extends StatelessWidget {
  HorizontalImageList({super.key});

  final List<Map<String, dynamic>> _slides = [
    {
      'imageUrl':
          'https://images.pexels.com/photos/26556320/pexels-photo-26556320.jpeg',
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/5998120/pexels-photo-5998120.jpeg',
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/5998023/pexels-photo-5998023.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero, // Remove default listview padding
        itemCount: _slides.length,
        itemBuilder: (context, index) {
          final slides = _slides[index];
          return _buildImageItem(
            imagePath: slides['imageUrl'],
          );
        },
      ),
    );
  }

  Widget _buildImageItem({required String imagePath}) {
    return Container(
      width: MediaQueryData.fromView(WidgetsBinding.instance.window).size.width,
      margin: EdgeInsets.only(left: 20.w, right: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0.r),
        child: Image.network(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
