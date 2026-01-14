import 'package:flutter/material.dart';
import '../dashboard/ui/widgets/build_gridItem.dart';
import '../dashboard/ui/widgets/sections/section_services.dart';

class DealsView extends StatefulWidget {
  const DealsView({super.key});

  @override
  State<DealsView> createState() => _DealsViewState();
}

class _DealsViewState extends State<DealsView> {
  int? _selectedAdTypeIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: sectionServicesList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              final item = sectionServicesList[index];
              return GestureDetector(
                onTap: () {},
                child: buildGridItem(
                  item,
                  _selectedAdTypeIndex == index,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
