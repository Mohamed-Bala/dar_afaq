import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/response/response.dart';
import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';
import '../../widgets/home_list_view.dart';

class HomeBlocBuilder extends StatelessWidget {
  const HomeBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is VipAdsSuccess ||
          current is VipAdsError ||
          current is VipAdsLoading,
      builder: (context, state) {
        return state.maybeWhen(
          vipAdsSuccess: (homeList) {
            return setupSuccess(homeList);
          },
          vipAdsLoading: () {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
          vipAdsError: (apiErrorModel) => setupError(),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupSuccess(HomeResponse homeList) {
    return HomeListView(
      vipAdsDataResponseList: homeList.vipAds ?? [],
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
