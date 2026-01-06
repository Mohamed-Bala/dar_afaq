import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/di/di.dart';
import '../../../../../../../core/helper/spacing.dart';
import '../../../../../logic/home_cubit.dart';
import '../../widgets/ads/ads_bloc_builder.dart';
import '../../../../widgets/build_filter_widget.dart';

class AdsView extends StatelessWidget {
  const AdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di<FilterCubit>()..getAdsSearch(),
        ),
        BlocProvider(
          create: (context) =>
              di<AddAdvertisementCubit>()..getAddAdvertisement(),
        ),
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(10),
            const FilterWidget(),
            verticalSpace(10),
            const AdsBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
