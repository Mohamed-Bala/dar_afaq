import 'dart:async';

import 'package:afaq_real_estate/core/helper/extensions.dart';
import 'package:app_links/app_links.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/di.dart';
import 'core/helper/constants.dart';
import 'core/helper/shared_pref.dart';
import 'core/network/dio_factory.dart';
import 'core/resources/color_manager.dart';
import 'core/resources/langauge_manager.dart';
import 'core/routing/routes.dart';
import 'features/dashboard/logic/home_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  await FirebaseAnalytics.instance.logEvent(
    name: 'test_event',
    parameters: {
      'app_started': 'app_started',
    },
  );

  await EasyLocalization.ensureInitialized();
  await init(); // ensure all services registered before proceeding
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

class MyApp extends StatefulWidget {
  final AppRoute appRoute;
  const MyApp({super.key, required this.appRoute});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  late AppLinks _appLinks;
  StreamSubscription<Uri>? _sub;
  @override
  void initState() {
    super.initState();
    _initDeepLinks();
  }

  void _initDeepLinks() async {
    _appLinks = AppLinks();

    /// 🔹 عند فتح التطبيق (cold start)
    final uri = await _appLinks.getInitialAppLink();
    if (uri != null) {
      _handleDeepLink(uri);
    }

    /// 🔹 أثناء تشغيل التطبيق
    _sub = _appLinks.uriLinkStream.listen((uri) {
      _handleDeepLink(uri);
    });
  }

  void _handleDeepLink(Uri uri) {
    debugPrint("Deep Link: $uri");

    final contextNav = navigatorKey.currentContext;
    if (contextNav == null) return;

    final segments = uri.pathSegments;
    if (segments.contains("/share.php")) {
      final index = segments.indexOf("/share.php");
      final id = (segments.length > index + 1) ? segments[index + 1] : null;

      if (id != null) {
        Future.delayed(const Duration(milliseconds: 300), () {
          Navigator.pushNamed(
            contextNav,
            Routes.adDetailsRoute,
            arguments: id,
          );
        });
      }
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<NavigationCubit>(
              create: (_) => NavigationCubit(),
            ),
            BlocProvider(
              create: (context) =>
                  di<NotificationsCubit>()..emitGetNotifications(),
            ),
          ],
          child: MaterialApp(
            title: 'Afaq Real Estate',
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            // onUnknownRoute: (settings) => unDefinedRoute(),
            locale: context.locale,
            theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: ColorManager.primary),
              useMaterial3: true,
            ),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,

            initialRoute: Routes.dashboardRoute,
            //  isLoggedInUser ? Routes.dashboardRoute : Routes.loginRoute,
            onGenerateRoute: AppRoute.onGeneratorRoute,
          ),
        );
      },
    );
  }
}

Future<void> checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

  //String userPhone = await SharedPrefHelper.getString(SharedPrefKeys.userPhone);

  await SharedPrefHelper.getSecuredString(SharedPrefKeys.userId);

  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
    DioFactory.setTokenIntoHeaderAfterLogin(userToken!);

    // int? userId = await SharedPrefHelper.getInt(SharedPrefKeys.userId);
    // debugPrint("User is logged in with ID: $userId");
  } else {
    isLoggedInUser = false;
  }
}
