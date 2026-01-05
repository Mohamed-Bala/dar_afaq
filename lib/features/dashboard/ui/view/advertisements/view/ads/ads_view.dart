import 'package:dar_afaq/features/dashboard/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/di/di.dart';
import '../../../../../../../core/helper/spacing.dart';
import '../../widgets/ads/ads_bloc_builder.dart';
import '../../../../widgets/build_filter_widget.dart';

class AdsView extends StatelessWidget {
  const AdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpace(10),
          BlocProvider(
            create: (_) => di<AddAdvertisementCubit>(),
            child: const FilterWidget(),
          ),
          verticalSpace(10),
          const AdsBlocBuilder(),
        ],
      ),
    );
  }
}
