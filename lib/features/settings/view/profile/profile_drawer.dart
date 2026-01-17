import 'package:afaq_real_estate/core/helper/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/di/di.dart';
import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/langauge_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../auth/logic/cubit_cubit.dart';
import '../../../auth/logic/cubit_state.dart';
import '../../../dashboard/logic/home_cubit.dart';
import '../my_advertisements/my_advertisements_view.dart';
import 'profile_view.dart';

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
    return Scaffold(
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
                    !isLoggedInUser
                        ? Text(
                            AppStrings.guest.tr(),
                            style: StylesManager.font18BlackBold,
                          )
                        : BlocBuilder<UserInfoCubit, UserInfoState>(
                            builder: (context, state) {
                              String name = AppStrings.loading.tr();
                              String email = "";
                              if (state is UserInfoInitial) {
                                name = AppStrings.loading.tr();
                                email = "";
                              } else if (state is UserInfoSuccess) {
                                name =
                                    state.data.user?.name ?? AppStrings.noName;
                                email = state.data.user?.email ?? "";
                              } else if (state is UserInfoError) {
                                name = "خطأ في التحميل";
                              }

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  verticalSpace(10),
                                  Text(
                                    name,
                                    style: StylesManager.font12GrayRegular
                                        .copyWith(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  Text(
                                    email,
                                    style: StylesManager.font12GrayRegular
                                        .copyWith(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
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
          verticalSpace(10),
          const Expanded(
            child: _MenuListView(),
          ),
        ],
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

  changeLanguage(bool isArabic) async {
    //await changeAppLanguage();
    if (isArabic) {
      await context.setLocale(
          const Locale('ar', '')); // تأكد من الرموز المستخدمة في main
      await SharedPrefHelper.setData(SharedPrefKeys.langKey, 'ar');
    } else {
      await context.setLocale(const Locale('en', ''));
      await SharedPrefHelper.setData(SharedPrefKeys.langKey, 'en');
    }
    // restart app
    Phoenix.rebirth(context);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _MenuItem(
          title: AppStrings.account.tr(),
          isTitle: true,
          onTap: () {},
        ),
        _MenuItem(
          title: AppStrings.profileTitle.tr(),
          icon: Icons.settings,
          onTap: () async {
            final int userId =
                await SharedPrefHelper.getInt(SharedPrefKeys.userId) ?? 0;

            final userInfoCubit = context.read<UserInfoCubit>();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: userInfoCubit,
                  child: const ProfileView(),
                ),
              ),
            ).then((didUpdate) {
              if (didUpdate == true && context.mounted) {
                userInfoCubit.emitGetUserInfo(userId);
              }
            });
          },
        ),
        const Divider(),
        _MenuItem(
          title: AppStrings.general.tr(),
          isTitle: true,
          onTap: () {},
        ),
        _MenuItem(
          title: AppStrings.appLanguage.tr(),
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
              horizontalSpace(8),
              Switch(
                value: _isArabicSelected,
                onChanged: (bool value) async {
                  setState(() {
                    _isArabicSelected = value;
                  });

                  Locale newLocale =
                      value ? const Locale('ar', '') : const Locale('en', '');
                  await context.setLocale(newLocale);

                  await SharedPrefHelper.setData(
                      SharedPrefKeys.langKey, value ? "ar" : "en");

                  Phoenix.rebirth(context);
                },
                activeColor: ColorManager.primary,
                inactiveTrackColor: Colors.white,
                activeTrackColor: Colors.black.withOpacity(0.5),
              )
            ],
          ),
          onTap: () {},
        ),
        _MenuItem(
          title: AppStrings.myAdvertisements.tr(),
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
          },
        ),
        _MenuItem(
          title: AppStrings.aboutUs.tr(),
          icon: Icons.info_outline,
          onTap: () {
            context.pushNamed(Routes.aboutUsRoute);
          },
        ),
        _MenuItem(
          title: 'privacy'.tr(),
          icon: Icons.privacy_tip,
          onTap: () {
            context.pushNamed(Routes.privacyRoute);
          },
        ),
        _MenuItem(
          title: AppStrings.logout.tr(),
          icon: Icons.lock_outline,
          onTap: () async {
            showDialogWidget(context);
          },
        ),
        verticalSpace(100),
        if (!isLoggedInUser)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: AppTextButton(
              buttonText: AppStrings.loginNow.tr(),
              textStyle: StylesManager.font16White,
              onPressed: () {
                context.pushNamedAndRemoveUntil(
                  Routes.loginRoute,
                  predicate: (route) => false,
                );
              },
            ),
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
            AppStrings.logoutConfirmationTitle.tr(),
            textAlign: TextAlign.right,
            style: StylesManager.font12GrayRegular.copyWith(
              fontSize: 16.sp,
              color: Colors.black,
            ),
          ),
          content: Text(
            AppStrings.logoutConfirmationMessage.tr(),
            textAlign: TextAlign.right,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(AppStrings.cancel.tr()),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade400,
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                Navigator.of(dialogContext).pop();
                performLogout(context);
              },
              child: Text(AppStrings.confirm.tr()),
            ),
          ],
        );
      },
    );
  }
}

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
      return Padding(
        padding: EdgeInsets.only(
          right: 20.0.w,
          left: 20.0.w,
          top: 10.h,
          bottom: 5.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: StylesManager.font12GrayRegular.copyWith(
                fontSize: 16.sp,
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
          SizedBox(width: 8.w),
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
