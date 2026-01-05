import 'package:dar_afaq/core/helper/extensions.dart';
import 'package:dar_afaq/core/resources/color_manager.dart';
import 'package:dar_afaq/features/dashboard/logic/home_cubit.dart';
import 'package:dar_afaq/features/settings/view/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/di/di.dart';
import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref.dart';
import '../../../../core/resources/langauge_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/routing/routes.dart';
import '../../../auth/logic/cubit_cubit.dart';
import '../../../auth/logic/cubit_state.dart';
import '../my_advertisements/my_advertisements_view.dart';

// --- Main Widget ---
class Profile extends StatefulWidget {
  const Profile({
    super.key,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // Crucial for Arabic/RTL: forces the layout to start from the right
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      BlocBuilder<UserInfoCubit, UserInfoState>(
                        builder: (context, state) {
                          String name = "جاري التحميل...";
                          String email = "";
                          if (state is UserInfoSuccess) {
                            name = state.data.user?.name ?? "بدون اسم";
                            email = state.data.user?.email ?? "";
                          }

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(height: 10),
                              Text(
                                name,
                                style: StylesManager.font12GrayRegular.copyWith(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                ),
                              ),
                              Text(
                                email,
                                style: StylesManager.font12GrayRegular.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      // App Logo (Rounded blue icon)
                      IconButton(
                          icon: const Icon(Icons.close, color: Colors.black),
                          onPressed: () {
                            context.pop();
                          }),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Expanded(
              child: _MenuListView(),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: AppTextButton(
            //     buttonText: "تسجيل دخول",
            //     textStyle: StylesManager.font16White,
            //     onPressed: () {},
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

// --- Menu Items List ---
class _MenuListView extends StatefulWidget {
  const _MenuListView();

  @override
  State<_MenuListView> createState() => _MenuListViewState();
}

class _MenuListViewState extends State<_MenuListView> {
  bool _isArabicSelected = false;
  @override
  void initState() {
    super.initState();
    _loadLanguageSelection();
  }

  Future<void> _loadLanguageSelection() async {
    try {
      String current = await getAppLanguage();
      setState(() {
        _isArabicSelected = current == LanguageType.ARABIC.getLanguageValue();
      });
    } catch (_) {
      // keep default false on error
    }
  }

  changeLanguage() async {
    await changeAppLanguage();
    // restart app
    // ignore: use_build_context_synchronously
    Phoenix.rebirth(context);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _MenuItem(
          title: 'ادارة الحساب',
          isTitle: true,
          onTap: () {},
        ),
        _MenuItem(
          title: 'اعدادات الحساب',
          icon: Icons.settings,
          onTap: () async {
            final int userId =
                await SharedPrefHelper.getInt(SharedPrefKeys.userId) ?? 0;

            // 1. استلام القيمة العائدة من الصفحة عند إغلاقها
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (ctx) {
                    final cubit = di<UserInfoCubit>();
                    cubit.emitGetUserInfo(userId);
                    return cubit;
                  },
                  child: const ProfileView(),
                ),
              ),
            ).then((didUpdate) {
              // 2. التحقق مما إذا كان التحديث قد تم بنجاح (راجع Navigator.pop في صفحة التعديل)
              if (didUpdate == true && context.mounted) {
                // 3. إعادة استدعاء بيانات المستخدم لتحديث الواجهة الحالية
                context.read<UserInfoCubit>().emitGetUserInfo(userId);
              }
            });
            ;
          },
        ),
        const Divider(),
        _MenuItem(
          title: 'عام',
          isTitle: true,
          onTap: () {},
        ),
        _MenuItem(
          title: ' لغة التطبيق',
          icon: Icons.language_outlined,
          trailingWidget: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _isArabicSelected ? "Arabic" : "English",
                style: StylesManager.font12GrayRegular.copyWith(
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 8),
              Switch(
                value: _isArabicSelected,
                onChanged: (bool value) {
                  setState(() {
                    _isArabicSelected = value;
                  });
                  // apply language change and restart
                  changeLanguage();
                },
                activeColor: ColorManager.primary,
                // inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.white,

                activeTrackColor: Colors.black.withOpacity(0.5),
              )
            ],
          ),
          onTap: () {},
        ),
        _MenuItem(
          title: 'اعلاناتي',
          icon: Icons.campaign,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (ctx) {
                    final cubit = di<ShowUserAdCubit>();
                    cubit.emitGetUserAds();
                    return cubit;
                  },
                  child: const MyAdvertisementsView(),
                ),
              ),
            );
            //  context.pushNamed(Routes.myAdvertisementsRoute);
          },
        ),
        _MenuItem(
          title: 'عن دار أفاق',
          icon: Icons.info_outline,
          onTap: () {
            context.pushNamed(Routes.aboutUsRoute);
          },
        ),
        _MenuItem(
          title: 'تسجيل الخروج',
          icon: Icons.lock_outline,
          onTap: () async {
            showDialogWidget(context);
          },
        ),
      ],
    );
  }

  //  App Language
  Future<String> getAppLanguage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? language = sharedPreferences.getString(SharedPrefKeys.langKey);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default lang
      return LanguageType.ENGLISH.getLanguageValue();
    }
  }

  Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.ARABIC.getLanguageValue()) {
      // set ENGLISH
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString(
          SharedPrefKeys.langKey, LanguageType.ENGLISH.getLanguageValue());
    } else {
      // set ARABIC
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString(
          SharedPrefKeys.langKey, LanguageType.ARABIC.getLanguageValue());
    }
  }

  Future<Locale> getLocal() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.ARABIC.getLanguageValue()) {
      return arabicLocale;
    } else {
      return englishLocale;
    }
  }

  Future<dynamic> showDialogWidget(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            "تسجيل الخروج",
            textAlign: TextAlign.right,
            style: StylesManager.font12GrayRegular.copyWith(
              fontSize: 16.sp,
              color: Colors.black,
            ),
          ),
          content: const Text(
            "هل أنت متأكد من رغبتك في تسجيل الخروج",
            textAlign: TextAlign.right,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text("إلغاء"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade400,
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                await SharedPrefHelper.removeData(SharedPrefKeys.userToken);
                // ignore: use_build_context_synchronously
                context.pushNamed(Routes.loginRoute);
              },
              child: const Text("تأكيد الخروج"),
            ),
          ],
        );
      },
    );
  }
}

// --- Reusable Menu Item Widget ---
// ignore: must_be_immutable
class _MenuItem extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Widget? trailingWidget;
  final bool isTitle;
  void Function()? onTap;

  _MenuItem({
    required this.title,
    this.icon,
    this.trailingWidget,
    this.isTitle = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (isTitle) {
      // Custom Row layout for the 'General' title and Language Selector
      return Padding(
        padding:
            const EdgeInsets.only(right: 20.0, left: 20.0, top: 10, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: StylesManager.font12GrayRegular.copyWith(
                fontSize: 20.sp,
                color: Colors.black,
              ),
            ),
            if (trailingWidget != null) trailingWidget!,
          ],
        ),
      );
    }

    // Standard ListTile for other menu items
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
      leading: icon != null
          ? Icon(
              icon,
              color: ColorManager.primary,
            )
          : null,
      title: Text(
        title,
        style: StylesManager.font12GrayRegular.copyWith(
          fontSize: 16.sp,
          color: ColorManager.black,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (trailingWidget != null) trailingWidget!,
          const SizedBox(width: 8),
          // The directional arrow icon
          const Icon(
            Icons.keyboard_arrow_left_outlined,
            color: Colors.white38,
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
