import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helper/spacing.dart';
import '../../widgets/articles_news.dart';
import '../../widgets/category/category_list_view.dart';
import '../../widgets/sections/section_services.dart';
import 'home_bloc_builder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            verticalSpace(20),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "الأقسام",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 100.h,
                      child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 10),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: sectionServicesList.length,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          itemBuilder: (context, index) {
                            return buildSectionItem(
                              sectionServicesList[index],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            verticalSpace(10),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'خدماتنا',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
              ),
            ),
            const CategoryListView(),
            verticalSpace(10),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'اعلانات مميزة',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
              ),
            ),
            const HomeBlocBuilder(),
            verticalSpace(10),
            const NewsArticleList(),
          ],
        ),
      ),
    );
  }
}
