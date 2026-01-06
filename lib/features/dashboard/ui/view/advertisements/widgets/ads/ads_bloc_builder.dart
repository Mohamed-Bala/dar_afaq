import 'package:dar_afaq/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../data/response/response.dart';
import '../../../../../logic/home_cubit.dart';
import '../../../../../logic/home_state.dart';
import 'ads_List_view_widget.dart';

class AdsBlocBuilder extends StatelessWidget {
  const AdsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      buildWhen: (previous, current) =>
          current is FilterSuccess ||
          current is FilterError ||
          current is FilterLoading,
      builder: (context, state) {
        return state.maybeWhen(
          filterSuccess: (adsList) {
            return setupSuccess(adsList);
          },
          filterLoading: () {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
          filterError: (apiErrorModel) => setupError(),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupSuccess(SearchAdsResponse adsList) {
    if (adsList.data!.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 60.sp, color: ColorManager.primary),
            SizedBox(height: 10.h),
            Text(
              "لا توجد نتائج تطابق بحثك حالياً",
              style: TextStyle(fontSize: 16.sp, color: Colors.black54),
            ),
          ],
        ),
      );
    }
    return AdsListViewWidget(
      adsDataResponseList: adsList.data ?? [],
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
