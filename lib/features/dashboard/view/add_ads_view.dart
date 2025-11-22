import 'package:dar_afaq/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/routing/routes.dart';
import '../../../core/widgets/app_text_button.dart';

// Helper class for data structure

class AdType {
  final String title;
  final String description;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final Color borderColor; // For the selected state
  final bool isFeatured;

  AdType({
    required this.title,
    required this.description,
    required this.icon,
    required this.backgroundColor,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
    this.borderColor = Colors.transparent, // Default to transparent
    this.isFeatured = false,
  });
}

class AdTypeCard extends StatelessWidget {
  final AdType adType;
  final bool isSelected;
  final VoidCallback onTap;

  const AdTypeCard({
    super.key,
    required this.adType,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // For Arabic text
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width *
              0.4, // Approximately half width
          height: 200, // Fixed height for visual consistency
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: adType.backgroundColor,
            borderRadius: BorderRadius.circular(15),
            border: isSelected
                ? Border.all(
                    color: adType.borderColor, width: 3.0) // Highlight selected
                : null,
            boxShadow: [
              if (isSelected)
                BoxShadow(
                  color: adType.borderColor.withOpacity(0.5),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end, // Aligned to right
              children: <Widget>[
                // Top row: selection circle and icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width:
                              isSelected ? 6 : 2, // Thicker border if selected
                        ),
                        color: isSelected ? Colors.white : Colors.transparent,
                      ),
                      child: isSelected
                          ? Center(
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue
                                      .shade800, // Inner circle for selection
                                ),
                              ),
                            )
                          : null,
                    ),
                    Icon(
                      adType.icon,
                      color: adType.iconColor,
                      size: 40,
                    ),
                  ],
                ),
                // Bottom content: title and description
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      adType.title,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: adType.textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      adType.description,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: adType.textColor.withOpacity(0.8),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}

class PackageSelectionScreen extends StatefulWidget {
  const PackageSelectionScreen({super.key});

  @override
  State<PackageSelectionScreen> createState() => _PackageSelectionScreenState();
}

class _PackageSelectionScreenState extends State<PackageSelectionScreen> {
  int? _selectedAdTypeIndex; // Null means no selection

  final List<AdType> _adTypes = [
    AdType(
      title: 'إعلان مميز',
      description: 'يظهر أعلى قائمة الإعلانات',
      icon: Icons.campaign_outlined, // Speaker icon
      backgroundColor: Colors.amber.shade700,
      iconColor: Colors.white,
      borderColor: Colors.blue.shade800, // Border for selected state
      isFeatured: true,
    ),
    AdType(
      title: 'إعلان عادي',
      description: 'يظهر ضمن قائمة الإعلانات',
      icon: Icons
          .ad_units_outlined, // 'AD' icon (using ad_units for a similar look)
      backgroundColor: Colors.blue.shade700,
      iconColor: Colors.white,
      borderColor: Colors.blue.shade800, // Border for selected state
      isFeatured: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // We wrap the entire UI in a SingleChildScrollView to make it scrollable
    // if the content exceeds the screen height, as is typical for bottom sheets.
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'اختر نوع الإعلان',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_adTypes.length, (index) {
                final adType = _adTypes[index];
                return AdTypeCard(
                  adType: adType,
                  isSelected: _selectedAdTypeIndex == index,
                  onTap: () {
                    setState(() {
                      _selectedAdTypeIndex = index;
                    });
                  },
                );
              }),
            ),
            // You can add other elements here, like a 'Continue' button
            // if needed for the flow.
            const SizedBox(height: 40),
            if (_selectedAdTypeIndex != null)
              Center(
                child: AppTextButton(
                  buttonText: "متابعة",
                  textStyle: StylesManager.font16White,
                  onPressed: () {
                     context.pushNamed(Routes.addRoute);
                  },
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     context.pushNamed(Routes.addRoute);
                //     // Handle the selection, e.g., navigate to next screen
                //     final selectedAd = _adTypes[_selectedAdTypeIndex!];
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(content: Text('تم اختيار: ${selectedAd.title}')),
                //     );
                //     print('Selected Ad Type: ${selectedAd.title}');
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.blue.shade800, // Button color
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 40, vertical: 15),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                //   child: const Text(
                //     'متابعة', // Continue
                //     style: TextStyle(fontSize: 18, color: Colors.white),
                //   ),
                // ),
              ),
          ],
        ),
      ),
    );
  }
}
