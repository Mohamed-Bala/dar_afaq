import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../logic/home_cubit.dart';
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          verticalSpace(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                AppStrings.sections.tr(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8),
              child: BlocProvider(
                create: (context) => di<FilterSctionCubit>(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 100.h,
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 10.w),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: sectionServicesList.length,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        itemBuilder: (context, index) {
                          final sectionItem = sectionServicesList[index];
                          return buildSectionItem(
                            context,
                            sectionServicesList[index],
                            sectionItem.subCategories,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          verticalSpace(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                AppStrings.ourServices.tr(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
            ),
          ),
          const CategoryListView(),
          verticalSpace(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                AppStrings.featuredAds.tr(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
            ),
          ),
          const HomeBlocBuilder(),
          verticalSpace(10),
          const NewsArticleList(),
        ],
      ),
    );
  }
}
