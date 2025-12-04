import 'package:dar_afaq/core/helper/extensions.dart';
import 'package:dar_afaq/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/routing/routes.dart';
import '../../../core/widgets/app_text_button.dart';
import '../widgets/build_gridItem.dart';

// Helper class for data structure

class AdType {
  final String title;
  final String description;
  final String description2;

  final String description3;

  final String description4;

  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final Color borderColor; // For the selected state
  final bool isFeatured;

  AdType({
    required this.description,
    required this.description2,
    required this.description3,
    required this.description4,
    required this.title,
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
        child: Material(
          elevation: 4,
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: 200.h,
            margin: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 4.0.h),
            decoration: BoxDecoration(
              //color: adType.backgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: isSelected
                  ? Border.all(color: adType.borderColor, width: 3.0)
                  : null,
              boxShadow: [
                if (isSelected)
                  BoxShadow(
                    color: adType.borderColor.withOpacity(0.1),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 4.0.h),
              child: Column(
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Aligned to right
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 20.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: ColorManager.primary,
                            width: isSelected
                                ? 2
                                : 2, // Thicker border if selected
                          ),
                          color: isSelected
                              ? ColorManager.primary
                              : Colors.transparent,
                        ),
                        child: isSelected
                            ? Center(
                                child: Container(
                                  width: 10.w,
                                  height: 10.h,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : null,
                      ),
                      Text(
                        adType.title,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: ColorManager.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(10),
                      Text(
                        adType.description,
                        textAlign: TextAlign.right,
                        style: StylesManager.font12GrayRegular,
                      ),
                      Text(
                        adType.description2,
                        textAlign: TextAlign.right,
                        style: StylesManager.font12GrayRegular,
                      ),
                      Text(
                        adType.description3,
                        textAlign: TextAlign.right,
                        style: StylesManager.font12GrayRegular,
                      ),
                      Text(
                        adType.description4,
                        textAlign: TextAlign.right,
                        style: StylesManager.font12GrayRegular,
                      ),
                    ],
                  ),
                ],
              ),
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
      title: ' أساسية',
      description: '  صلاحية الإعلان ٣٠ يوم',
      description2: "",
      description3: "",
      description4: "",

      icon: Icons.campaign_outlined, // Speaker icon
      backgroundColor: ColorManager.grey,
      iconColor: Colors.white,
      borderColor: ColorManager.primary, // Border for selected state
      isFeatured: true,
    ),
    AdType(
      title: ' اكسترا',
      description: '  ضعف المشاهدات',
      description2: " رفع ٥ مرات",
      description3: " تثبيت عقار للبيع",
      description4: "صلاحية ٣٠ يوم",
      icon: Icons
          .ad_units_outlined, // 'AD' icon (using ad_units for a similar look)
      backgroundColor: ColorManager.grey,
      iconColor: Colors.white,
      borderColor: ColorManager.primary, // Border for selected state
      isFeatured: false,
    ),
    AdType(
      title: ' سوبر',
      description: ' خصم ٥٠٪  ',
      description2: "رفع ٩ مرات",
      description3: "علان مميز",
      description4: " ضعف المشاهدات ×١٠",
      icon: Icons.campaign_outlined, // Speaker icon
      backgroundColor: ColorManager.grey,
      iconColor: Colors.white,
      borderColor: ColorManager.primary, // Border for selected state
      isFeatured: true,
    ),
    AdType(
      title: ' بريميوم',
      description: 'وصول سريع + مضاعف للمشاهدات',
      description2: "صلاحية ٦٠ يوم",
      description3: "رفع ١٥ مرة",
      description4: "علان مميز + شعار خاص",
      icon: Icons
          .ad_units_outlined, // 'AD' icon (using ad_units for a similar look)
      backgroundColor: ColorManager.grey,
      iconColor: Colors.white,
      borderColor: ColorManager.primary, // Border for selected state
      isFeatured: false,
    ),
    AdType(
      title: ' VIP',
      description: ' مضاعفة المشاهدات ×٢٠ + أولوية',
      description2: "صلاحية ٩٠ يوم",
      description3: " دعم مباشر",
      description4: "تثبيت في كل الأقسام",
      icon: Icons
          .ad_units_outlined, // 'AD' icon (using ad_units for a similar look)
      backgroundColor: ColorManager.grey,
      iconColor: Colors.white,
      borderColor: ColorManager.primary, // Border for selected state
      isFeatured: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: realEstateServices.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              itemBuilder: (context, index) {
                final item = realEstateServices[index];
                return buildGridItem(item, ColorManager.iconColor,
                    ColorManager.itemBackgroundColor);
              },
            ),
            verticalSpace(20),
            const Text(
              'اختر نوع الإعلان',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            verticalSpace(10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _adTypes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              itemBuilder: (context, index) {
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
              },
            ),
            verticalSpace(40),
            if (_selectedAdTypeIndex != null)
              Center(
                child: AppTextButton(
                  buttonText: "متابعة",
                  buttonWidth: 250.w,
                  textStyle: StylesManager.font16White,
                  onPressed: () {
                    context.pushNamed(Routes.addRoute);
                  },
                ),
              ),
            verticalSpace(40),
          ],
        ),
      ),
    );
  }
}
