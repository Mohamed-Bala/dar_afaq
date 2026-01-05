import 'package:dar_afaq/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/di.dart';
import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../auth/data/models/response/response.dart';
import '../../../auth/logic/cubit_cubit.dart';
import '../../../auth/logic/cubit_state.dart';
import 'edit_profile_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final int userId =
          await SharedPrefHelper.getInt(SharedPrefKeys.userId) ?? 0;
      // ignore: use_build_context_synchronously
      context.read<UserInfoCubit>().emitGetUserInfo(userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('الملف الشخصي'),
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
                  return const Center(child: Text('لا توجد بيانات'));
                }

                return Center(
                  child: ListView(
                    padding: EdgeInsets.all(16.h),
                    children: [
                      ListTile(
                        leading:
                            Icon(Icons.person, color: ColorManager.primary),
                        title: Text(
                          user.name ?? "لا يوجد اسم",
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
                      // داخل زر التعديل في صفحة البروفايل
                      AppTextButton(
                        buttonText: "تعديل البيانات",
                        onPressed: () {
                          context.read<UserInfoCubit>().state.maybeWhen(
                            userInfoSuccess: (userData) {
                              // هنا userData هو الكائن الذي يحتوي على البيانات فعلياً
                              Navigator.pushNamed(
                                context,
                                Routes.editProfileRoute,
                                arguments: EditProfileArgs(userData: userData),
                              ).then((didUpdate) {
                                if (didUpdate == true) {
                                  // يمكنك طلب البيانات من السيرفر لضمان الدقة
                                  context
                                      .read<UserInfoCubit>()
                                      .emitGetUserInfo(user.id ?? 0);
                                }
                              });
                            },
                            orElse: () {
                              // اختياري: تنبيه المستخدم إذا كانت البيانات لا تزال تحمل
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'يرجى الانتظار حتى تحميل البيانات')),
                              );
                            },
                          );
                        },
                        textStyle: StylesManager.font16White,
                      )
                      // AppTextButton(
                      //   buttonText: "تعديل البيانات",
                      //   textStyle: StylesManager.font16White,
                      //   onPressed: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => BlocProvider(
                      //           create: (context) => di<UpdateUserInfoCubit>(),
                      //           child: EditProfileView(),
                      //         ),
                      //       ),
                      //     ).then((isUpdated) {
                      //       // إذا عادت الشاشة بقيمة true (نجاح التحديث)
                      //       if (isUpdated == true) {
                      //         // نطلب من الكيوبيت الأساسي إعادة جلب البيانات لتحديث الواجهة
                      //         context.read<UserInfoCubit>().emitGetUserInfo(
                      //               user.id ?? 0,
                      //             );
                      //       }
                      //     });
                      //   },
                      // ),
                    ],
                  ),
                );
              },
              userInfoError: (error) =>
                  Center(child: Text(error.message ?? 'حدث خطأ')),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
