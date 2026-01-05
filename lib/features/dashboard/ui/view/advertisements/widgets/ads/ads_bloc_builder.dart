import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/response/response.dart';
import '../../../../../logic/home_cubit.dart';
import '../../../../../logic/home_state.dart';
import 'ads_List_view_widget.dart';

class AdsBlocBuilder extends StatelessWidget {
  const AdsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is AllAdsSuccess ||
          current is AllAdsError ||
          current is AllAdsLoading,
      builder: (context, state) {
        return state.maybeWhen(
        allAdsSuccess: (adsList) {
            return setupSuccess(adsList);
          },
          allAdsLoading: () {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
          allAdsError: (apiErrorModel) => setupError(),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupSuccess(AdsResponse adsList) {
    return AdsListViewWidget(
      adsDataResponseList: adsList.allAds ?? [],
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
