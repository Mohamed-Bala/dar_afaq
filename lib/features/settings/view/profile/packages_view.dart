import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackagesView extends StatelessWidget {
  const PackagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemCount: packages.length,
        itemBuilder: (context, index) {
          return ExpandableCard(
            package: packages[index],
          );
        },
      ),
    );
  }
}

class ExpandableCard extends StatefulWidget {
  final PackageModel package;

  const ExpandableCard({super.key, required this.package});

  @override
  State<ExpandableCard> createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 8.h),
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            /// HEADER
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.package.title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0,
                  duration: Duration(milliseconds: 300),
                  child: Icon(Icons.keyboard_arrow_down),
                ),
              ],
            ),

            /// CONTENT
            AnimatedCrossFade(
              firstChild: SizedBox(),
              secondChild: Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _item("💰 التكلفة:", widget.package.price),
                    _item("🔄 عدد الرفع:", widget.package.lifts),
                    _item("📌 التثبيت:", widget.package.pin),
                    _item("🚀 النتيجة:", widget.package.result),
                  ],
                ),
              ),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 400),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.w),
      child: Text(
        "$title $value",
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}

class PackageModel {
  final String title;
  final String price;
  final String lifts;
  final String pin;
  final String result;

  PackageModel({
    required this.title,
    required this.price,
    required this.lifts,
    required this.pin,
    required this.result,
  });
}

final packages = [
  PackageModel(
    title: "الباقة الأساسية (Basic)",
    price: "25 نقطة",
    lifts: "بدون رفع (يدوي)",
    pin: "ظهور اعتيادي بترتيب القسم",
    result: "إعلان نشط لمدة شهر كامل 🗓️",
  ),
  PackageModel(
    title: "الباقة البرونزية 🥉",
    price: "35 نقطة",
    lifts: "5 مرات تلقائية",
    pin: "تثبيت في أعلى القسم",
    result: "ضعف المشاهدات المعتادة 📈",
  ),
  PackageModel(
    title: "الباقة الفضية 🥈",
    price: "45 نقطة",
    lifts: "9 مرات تلقائية",
    pin: "تثبيت في صدارة القسم",
    result: "10 أضعاف الوصول 🔥",
  ),
  PackageModel(
    title: "الباقة الذهبية 🥇",
    price: "55 نقطة",
    lifts: "15 مرة تلقائية",
    pin: "تثبيت ممتاز في أعلى النتائج",
    result: "وصول سريع جداً 🚀",
  ),
  PackageModel(
    title: "VIP النخبوية 💎",
    price: "65 نقطة",
    lifts: "20 مرة تلقائية",
    pin: "أولوية ظهور مطلقة",
    result: "20 ضعف ظهور 💎",
  ),
];
