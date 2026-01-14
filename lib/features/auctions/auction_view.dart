import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../dashboard/logic/home_cubit.dart';
import 'widget/auction_blocBuilder.dart';

class AuctionView extends StatefulWidget {
  const AuctionView({super.key});

  @override
  State<AuctionView> createState() => _AuctionViewState();
}

class _AuctionViewState extends State<AuctionView> {
  void initState() {
    super.initState();
    context.read<HomeCubit>().getAllAuction();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 900.h,
      child: const AuctionBlocbuilder(),
    );
  }
}
