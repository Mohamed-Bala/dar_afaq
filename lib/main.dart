import 'package:afaq_real_estate/core/helper/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/di.dart';
import 'core/helper/constants.dart';
import 'core/helper/shared_pref.dart';
import 'core/network/dio_factory.dart';
import 'core/resources/color_manager.dart';
import 'core/resources/langauge_manager.dart';
import 'core/routing/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  init();
  await checkIfLoggedInUser();
  runApp(
    EasyLocalization(
      supportedLocales: const [arabicLocale, englishLocale],
      path: assetsLangPath,
      child: Phoenix(
        child: MyApp(
          appRoute: AppRoute(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRoute appRoute;
  const MyApp({super.key, required this.appRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          title: 'Afaq Real Estate',
          debugShowCheckedModeBanner: false,
          locale: context.locale,

          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.primary),
            useMaterial3: true,
          ),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,

          initialRoute: Routes.dashboardRoute,
          //  isLoggedInUser ? Routes.dashboardRoute : Routes.loginRoute,
          onGenerateRoute: AppRoute.onGeneratorRoute,
        );
      },
    );
  }
}

Future<void> checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

  String userPhone = await SharedPrefHelper.getString(SharedPrefKeys.userPhone);

  await SharedPrefHelper.getSecuredString(SharedPrefKeys.userId);
  debugPrint("Token: $userToken");
  debugPrint("Phone: $userPhone");
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
    DioFactory.setTokenIntoHeaderAfterLogin(userToken!);

    int? userId = await SharedPrefHelper.getInt(SharedPrefKeys.userId);
    debugPrint("User is logged in with ID: $userId");
  } else {
    isLoggedInUser = false;
  }
}
