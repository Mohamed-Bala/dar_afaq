import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/spacing.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../dashboard/logic/home_cubit.dart';
import '../../../dashboard/logic/home_state.dart';
import '../../widgets/my_advertisments.dart';

class MyAdvertismentBlocBuilder extends StatelessWidget {
  const MyAdvertismentBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowUserAdCubit, ShowUserAdsState>(
      builder: (context, state) {
        return state.maybeWhen(
          showUserAdsLoading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          showUserAdsSuccess: (showUserAdResponse) {
            final ads = showUserAdResponse.showUserAdvertisementData ?? [];

            return RefreshIndicator(
              onRefresh: () async {
                context.read<ShowUserAdCubit>().emitGetUserAds();
              },
              child: ads.isEmpty
                  ? _buildEmptyState()
                  : ListView.separated(
                      separatorBuilder: (context, index) => verticalSpace(10),
                      padding: EdgeInsets.zero,
                      itemCount: ads.length,
                      itemBuilder: (context, index) {
                        return ShowUserAdCard(
                          showUserAdvertisementData: ads[index],
                        );
                      },
                    ),
            );
          },
          showUserAdsError: (error) => Center(
            child: Text(error.message ?? AppStrings.errorOccurred.tr()),
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Text(AppStrings.noAdsAvailable.tr()),
    );
  }
}
