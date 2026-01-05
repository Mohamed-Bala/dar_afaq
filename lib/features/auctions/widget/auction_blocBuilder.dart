import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dashboard/data/response/response.dart';
import '../../dashboard/logic/home_cubit.dart';
import '../../dashboard/logic/home_state.dart';
import '../auction_view.dart';
import 'auction_List_view_widget.dart';

class AuctionBlocbuilder extends StatelessWidget {
  const AuctionBlocbuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is AuctionSuccess ||
          current is AuctionError ||
          current is AuctionLoading,
      builder: (context, state) {
        return state.maybeWhen(
          auctionSuccess: (auctionList) {
            return setupSuccess(auctionList);
          },
          auctionLoading: () {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
          auctionError: (apiErrorModel) => setupError(),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupSuccess(AuctionResponse auctionList) {
    return AutionWidget(
      auctionDataList: auctionList.upcomingAuctions ?? [],
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
