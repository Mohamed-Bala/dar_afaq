import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/data/models/response/response.dart';
import '../../features/auth/ui/view/forgot_password/forgot_password_view.dart';
import '../../features/auth/ui/view/login/view/login_view.dart';
import '../../features/auth/ui/view/register/view/register_otp_view.dart';
import '../../features/calculation_cost/calculation_cost_view.dart';
import '../../features/dashboard/data/response/response.dart';
import '../../features/dashboard/ui/view/advertisements/view/add_ads/add_ads_view.dart';
import '../../features/dashboard/ui/view/dashboard_view.dart';
import '../../features/dashboard/ui/view/home_details_view.dart';
import '../../features/dashboard/ui/widgets/sections/section_services.dart';
import '../../features/settings/view/about_us/about_us_view.dart';
import '../../features/auth/logic/cubit_cubit.dart';
import '../../features/auth/ui/view/otp/otp_view.dart';
import '../../features/auth/ui/view/register/view/register_view.dart';
import '../../features/auth/ui/view/reset_password/reset_password_view.dart';
import '../../features/dashboard/logic/home_cubit.dart';
import '../../features/dashboard/ui/view/advertisements/widgets/ads/ads_details.dart';
import '../../features/onboarding/onboarding_view.dart';
import '../../features/settings/view/my_advertisements/edit_advertisement_view.dart';
import '../../features/settings/view/profile/edit_profile_view.dart';
import '../../features/settings/view/profile/profile_view.dart';
import '../../features/settings/view/my_advertisements/my_advertisements_view.dart';
import '../di/di.dart';
import '../resources/strings_manager.dart';

class EditProfileArgs {
  final UserInfoResponse? userData;
  EditProfileArgs({this.userData});
}

class Routes {
  static const String onBoardingRoute = "/onBoarding";
  // Auth
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String verifiyRoute = "/verifiy";
  static const String forgotPasswordRoute = "/forgot-password";
  static const String resetPasswordRoute = "/reset-password";
  static const String otpRoute = "/otp";
  static const String otpRegisterRoute = "/otp-register";

  // User
  static const String myAdvertisementsRoute = '/my-advertisements';
  static const String addRoute = '/AddView';
  static const String editAdRoute = '/edit_Ad';

  // Home
  static const String homeDetailsRoute = '/home-details';
  static const String adsDetailsRoute = '/ads-details';
  static const String servicesGridRoute = '/services_grid';
  static const String profileRoute = "/profile";
  static const String editProfileRoute = "/edit-profile";
  static const String aboutUsRoute = "/about-us";
  static const String dashboardRoute = "/dashboard";
  static const String articlesNewsRoute = "/articles-news";
  static const String auctionDetailsRoute = "/auction-details";

  static const String calculationCostRoute = "/calculation-cost";
}

class AppRoute {
  static Route<dynamic> onGeneratorRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => di<LoginCubit>(),
            child: const LoginView(),
          ),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => di<RegisterCubit>(),
            child: const RegisterView(),
          ),
        );

      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => di<ForgotPasswordCubit>()),
              BlocProvider(
                create: (context) => di<VerifyCodeCubit>(),
              ),
            ],
            child: const ForgotPasswordView(),
          ),
        );
      case Routes.otpRoute:
        final email = settings.arguments as String? ?? "";
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => di<VerifyCodeCubit>(),
            child: OtpView(
              email: email,
            ),
          ),
        );
      case Routes.otpRegisterRoute:
        final arguments = settings.arguments as Map<String, dynamic>;
        final phone = arguments['phone'] as String;
        final email = arguments['email'] as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => di<VerifyCodeRegisterCubit>(),
            child: RegisterOtpView(
              phone: phone,
              email: email,
            ),
          ),
        );
      case Routes.resetPasswordRoute:
        final email = settings.arguments as String? ?? "No Email Found";
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => di<ResetPasswordCubit>(),
            child: ResetPasswordView(email: email),
          ),
        );
      case Routes.addRoute:
        final sectionItem = settings.arguments as SectionServices;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => di<AddAdvertisementCubit>(),
            child: AddAdsView(transactionType: sectionItem.dbValue),
          ),
        );
      case Routes.homeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const HomeDetailsView());
      case Routes.adsDetailsRoute:
        return MaterialPageRoute(builder: (_) => AdsDetailsScreen());
      case Routes.editProfileRoute:
        final args = settings.arguments as EditProfileArgs?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => di<UpdateUserInfoCubit>(),
            child: EditProfileView(userData: args?.userData),
          ),
        );
      case Routes.calculationCostRoute:
        return MaterialPageRoute(
          builder: (_) => const CalculationCostView(),
        );
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case Routes.aboutUsRoute:
        return MaterialPageRoute(builder: (_) => const AboutUsView());
      case Routes.dashboardRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(di())
              ..getAllAds()
              ..getAllAuction()
              ..getVipAds(),
            child: const DashboardView(),
          ),
        );
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.myAdvertisementsRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => di<ShowUserAdCubit>()..emitGetUserAds(),
            child: const MyAdvertisementsView(),
          ),
        );

      case Routes.editAdRoute:
        final args = settings.arguments as Map<String, dynamic>;
        final adData = args['adData'] as ShowUserAdvertisementData;
        final showUserAdCubit = args['showUserAdCubit'] as ShowUserAdCubit;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              // نستخدم .value لأن الكيوبيت موجود بالفعل ولا نريد إنشاء واحد جديد
              BlocProvider.value(value: showUserAdCubit),
              // إنشاء كيوبيت التعديل كالمعتاد
              BlocProvider(
                create: (context) => di<UpdateAdCubit>(),
              ),
            ],
            child: EditAdvertisementView(adData: adData),
          ),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
