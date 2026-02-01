import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/resources/color_manager.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // خلفية فاتحة ومريحة
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120.0,
            floating: false,
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'privacy_title'.tr(),
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),

          // محتوى الاتفاقية
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0.h),
              child: Column(
                children: [
                  _buildPrivacyCard(
                    titleAr: "1. البيانات التي نجمعها",
                    titleEn: "Data We Collect",
                    contentAr:
                        "نلتزم في تطبيق \"آفاق\" بجمع البيانات الضرورية فقط لتقديم خدماتنا، وتشمل معلومات المستخدم الأساسية، بيانات الجهاز، ونشاط المستخدم داخل التطبيق.",
                    contentEn:
                        "We collect essential information to provide our services, including basic user info, device data, and in-app activity.",
                    icon: Icons.analytics_outlined,
                  ),
                  _buildPrivacyCard(
                    titleAr: "2. كيف نستخدم بياناتك",
                    titleEn: "How We Use Your Data",
                    contentAr:
                        "يتم استخدام بياناتكم للأغراض التشغيلية، تقديم الخدمات المطلوبة مثل التقييم العقاري، توليد تقديرات دقيقة للأسعار، وتحسين أداء التطبيق.",
                    contentEn:
                        "Your data is processed for providing requested services, generating precise estimates, and improving app performance.",
                    icon: Icons.settings_suggest_outlined,
                  ),
                  _buildPrivacyCard(
                    titleAr: "3. مشاركة البيانات",
                    titleEn: "Data Sharing",
                    contentAr:
                        "لا نقوم ببيع أو تأجير بياناتكم الشخصية لأي طرف ثالث نهائياً. قد يتم مشاركة بعض المعلومات فقط مع مزودي خدمات موثوقين ضمن قيود صارمة.",
                    contentEn:
                        "We do not sell or rent your personal data. Information may be shared with trusted providers under strict privacy constraints.",
                    icon: Icons.share_outlined,
                  ),
                  _buildPrivacyCard(
                    titleAr: "4. أمن وحماية البيانات",
                    titleEn: "Data Security",
                    contentAr:
                        "نستخدم أحدث بروتوكولات التشفير (SSL/TLS) لحماية بياناتكم. يقر المستخدم بأن التطبيق لا يضمن الحماية المطلقة من كافة التهديدات الإلكترونية.",
                    contentEn:
                        "We use SSL/TLS encryption to protect your data. Absolute protection against all cyber threats cannot be guaranteed.",
                    icon: Icons.security_outlined,
                  ),
                  _buildPrivacyCard(
                    titleAr: "5. حقوق المستخدم وحذف الحساب",
                    titleEn: "User Rights & Account Deletion",
                    contentAr:
                        "نوفر للمستخدمين الحق الكامل في حذف حساباتهم وبياناتهم نهائياً وبشكل فوري من خلال إعدادات التطبيق. عند الحذف، سيتم إزالة كافة بياناتك بشكل نهائي.",
                    contentEn:
                        "You can permanently delete your account via app settings. This will immediately and irreversibly remove all your data from our servers.",
                    icon: Icons.person_remove_outlined,
                    isWarning: true,
                  ),
                  _buildPrivacyCard(
                    titleAr: "6. المسؤولية والقانون",
                    titleEn: "Liability & Law",
                    contentAr:
                        "تطبيق \"آفاق\" هو منصة تقنية وسيطة، والتقييمات هي تقديرات استرشادية. تخضع هذه الاتفاقية لقوانين دولة الكويت.",
                    contentEn:
                        "Afaq App is a technical intermediary platform. Estimates are for guidance only. Governed by the laws of the State of Kuwait.",
                    icon: Icons.gavel_outlined,
                  ),
                  verticalSpace(40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- UI Helpers ---

  Widget _buildPrivacyCard({
    required String titleAr,
    required String titleEn,
    required String contentAr,
    required String contentEn,
    required IconData icon,
    bool isWarning = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: isWarning ? Colors.red : ColorManager.primary,
                width: 5,
              ),
            ),
          ),
          child: ExpansionTile(
            leading: Icon(icon,
                color: isWarning ? Colors.red : ColorManager.primary),
            title: Text(
              titleAr,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
            subtitle: Text(titleEn,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13.sp)),
            children: [
              Padding(
                padding: EdgeInsets.all(16.0.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contentAr,
                      style: TextStyle(
                          height: 1.4, fontSize: 14.sp, color: Colors.black87),
                      textAlign: TextAlign.justify,
                    ),
                    verticalSpace(10),
                    const Divider(),
                    verticalSpace(10),
                    Text(
                      contentEn,
                      style: TextStyle(
                          height: 1.4,
                          fontSize: 14.sp,
                          color: Colors.grey.shade700),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
