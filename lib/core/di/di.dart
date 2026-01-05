import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repository/repository.dart';
import '../../features/auth/logic/cubit_cubit.dart';
import '../../features/dashboard/data/network/home_api.dart';
import '../../features/dashboard/data/repository/home_repository.dart';
import '../../features/dashboard/logic/home_cubit.dart';
import '../network/app_api.dart';
import '../network/dio_factory.dart';

final di = GetIt.instance;

Future<void> init() async {
  di.allowReassignment = true;
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  di.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  di.registerLazySingleton<LoginRepository>(() => LoginRepository(di()));
  di.registerFactory<LoginCubit>(() => LoginCubit(di()));

  // signup
  di.registerLazySingleton<RegisterRepository>(() => RegisterRepository(di()));
  di.registerFactory<RegisterCubit>(() => RegisterCubit(di()));

  // ForgotPassword
  di.registerLazySingleton<ForgotPasswordRepository>(
      () => ForgotPasswordRepository(di()));
  di.registerFactory<ForgotPasswordCubit>(() => ForgotPasswordCubit(di()));

  // VerifyCode
  di.registerLazySingleton<VerifyCodeRepository>(
      () => VerifyCodeRepository(di()));
  di.registerFactory<VerifyCodeCubit>(() => VerifyCodeCubit(di()));

  // ResetPassword
  di.registerLazySingleton<ResetPasswordRepository>(
      () => ResetPasswordRepository(di()));
  di.registerFactory<ResetPasswordCubit>(() => ResetPasswordCubit(di()));

  // Add Advertisement
  di.registerLazySingleton<AddAdvertisementRepository>(
      () => AddAdvertisementRepository(di()));
  di.registerFactory<AddAdvertisementCubit>(() => AddAdvertisementCubit(di()));

  di.registerLazySingleton<ShowUserAdRepository>(
      () => ShowUserAdRepository(di()));
  di.registerFactory<ShowUserAdCubit>(() => ShowUserAdCubit(di()));

  di.registerLazySingleton<NotificationsRepository>(
      () => NotificationsRepository(di()));
  di.registerFactory<NotificationsCubit>(() => NotificationsCubit(di()));
  // Delete
  di.registerLazySingleton<DeleteAdRepository>(() => DeleteAdRepository(di()));
  di.registerFactory<DeleteAdCubit>(() => DeleteAdCubit(di()));
  // Update
  di.registerLazySingleton<UpdateAdRepository>(() => UpdateAdRepository(di()));
  di.registerFactory<UpdateAdCubit>(() => UpdateAdCubit(di()));
  // home
  di.registerLazySingleton<HomeRepository>(() => HomeRepository(di()));
  di.registerLazySingleton<HomeApi>(() => HomeApi(dio));

  // User Info
  di.registerLazySingleton<UserInfoRepository>(() => UserInfoRepository(di()));
  di.registerFactory<UserInfoCubit>(() => UserInfoCubit(di()));

  // Update User Info
  di.registerLazySingleton<UpdateUserInfoRepository>(
      () => UpdateUserInfoRepository(di()));
  di.registerFactory<UpdateUserInfoCubit>(() => UpdateUserInfoCubit(di()));
}
