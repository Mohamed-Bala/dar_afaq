import 'package:flutter/material.dart';

import '../../../../../data/response/response.dart';
import 'ads.dart';

class AdsListViewWidget extends StatelessWidget {
  final List<AdModel?> adsDataResponseList;
  const AdsListViewWidget({
    super.key,
    required this.adsDataResponseList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // let ListView size itself to its children
      physics: const NeverScrollableScrollPhysics(), // disable internal scroll
      padding: EdgeInsets.zero, // Remove default listview padding
      itemCount: adsDataResponseList.length,
      itemBuilder: (context, index) {
        return AdCard(adsData: adsDataResponseList[index]);
      },
    );
  }
}
