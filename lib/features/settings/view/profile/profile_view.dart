import 'package:afaq_real_estate/core/helper/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../auth/data/models/response/response.dart';
import '../../../auth/logic/cubit_cubit.dart';
import '../../../auth/logic/cubit_state.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    if (isLoggedInUser) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final int userId =
            await SharedPrefHelper.getInt(SharedPrefKeys.userId) ?? 0;
        if (userId != 0 && context.mounted) {
          context.read<UserInfoCubit>().emitGetUserInfo(userId);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoggedInUser) {
      return CheckUserGuest(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.profileTitle.tr()),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder<UserInfoCubit, UserInfoState>(
        builder: (context, state) {
          return state.maybeWhen(
            userInfoLoading: () =>
                const Center(child: CircularProgressIndicator()),
            userInfoSuccess: (userResponse) {
              final UserResponse? user = userResponse.user;
              if (user == null) {
                return const Center(
                  child: Text('لا توجد بيانات'),
                );
              }

              return Center(
                child: ListView(
                  padding: EdgeInsets.all(16.h),
                  children: [
                    ListTile(
                      leading: Icon(Icons.person, color: ColorManager.primary),
                      title: Text(
                        user.name ?? AppStrings.noName.tr(),
                        style: StylesManager.font13Grey.copyWith(
                          color: ColorManager.black,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    verticalSpace(8),
                    ListTile(
                      leading: Icon(Icons.phone, color: ColorManager.primary),
                      title: Text(
                        user.phone ?? '',
                        style: StylesManager.font13Grey.copyWith(
                          color: ColorManager.black,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    verticalSpace(8),
                    ListTile(
                      leading: Icon(Icons.email, color: ColorManager.primary),
                      title: Text(
                        user.email ?? '',
                        style: StylesManager.font13Grey.copyWith(
                          color: ColorManager.black,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    verticalSpace(20),
                    AppTextButton(
                      buttonText: AppStrings.editProfileTitle.tr(),
                      onPressed: () {
                        context.read<UserInfoCubit>().state.maybeWhen(
                          userInfoSuccess: (userData) {
                            Navigator.pushNamed(
                              context,
                              Routes.editProfileRoute,
                              arguments: EditProfileArgs(userData: userData),
                            ).then((didUpdate) {
                              if (didUpdate == true) {
                                context
                                    .read<UserInfoCubit>()
                                    .emitGetUserInfo(user.id ?? 0);
                              }
                            });
                          },
                          orElse: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(AppStrings.loading.tr()),
                              ),
                            );
                          },
                        );
                      },
                      textStyle: StylesManager.font16White,
                    )
                  ],
                ),
              );
            },
            userInfoError: (error) => Center(
              child: Text(
                error.message ?? AppStrings.errorOccurred.tr(),
              ),
            ),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Scaffold CheckUserGuest(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.profileTitle.tr(),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_outline, size: 80.sp, color: Colors.grey),
            verticalSpace(16),
            Text(
              AppStrings.browsingAsGuest.tr(),
              style: StylesManager.font14Grey,
            ),
            verticalSpace(8),
            Text(
              AppStrings.pleaseLoginToViewData.tr(),
              style: StylesManager.font13Grey,
            ),
            verticalSpace(24),
            AppTextButton(
              buttonText: AppStrings.loginNow.tr(),
              buttonWidth: 200.w,
              onPressed: () => context.pushNamed(Routes.loginRoute),
              textStyle: StylesManager.font14Grey.copyWith(
                color: ColorManager.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
