import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/widgets/search_widget.dart';
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
          SearchWidget(
            context,
            onTap: () {
              context.read<NavigationCubit>().changeIndex(1);
            },
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
          // verticalSpace(10),
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
          BlocProvider(
            create: (context) => di<FilterSctionCubit>(),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sectionServicesList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (BuildContext context, int index) {
                final sectionItem = sectionServicesList[index];
                return Center(
                  child: buildSectionItem(
                    context,
                    sectionServicesList[index],
                    sectionItem.subCategories,
                  ),
                );
              },
            ),
          ),
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                AppStrings.afaqRealEstateNews.tr(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
            ),
          ),
          const NewsArticleList(),
        ],
      ),
    );
  }
}
