import 'package:dar_afaq/features/dashboard/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'my_advertisment_bloc_builder.dart';

class MyAdvertisementsView extends StatefulWidget {
  const MyAdvertisementsView({super.key});

  @override
  State<MyAdvertisementsView> createState() => _MyAdvertisementsViewState();
}

class _MyAdvertisementsViewState extends State<MyAdvertisementsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.watch<ShowUserAdCubit>().emitGetUserAds();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('إعلاناتي'),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: MyAdvertismentBlocBuilder(),
      ),
    );
  }
}
