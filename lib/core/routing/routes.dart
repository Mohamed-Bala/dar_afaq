import 'package:dar_afaq/features/auth/login/view/login_view.dart';
import 'package:dar_afaq/features/auth/register/view/register_view.dart';
import 'package:dar_afaq/features/dashboard/view/add_view.dart';
import 'package:dar_afaq/features/dashboard/view/dashboard_view.dart';
import 'package:flutter/material.dart';

import '../../features/auth/otp/otp_view.dart';
import '../../features/auth/verifiy/verifiy_view.dart';
import '../../features/dashboard/view/propertydetails_view.dart';
import '../../features/profile/edit_address_view.dart';
import '../../features/profile/edit_profile_view.dart';
import '../resources/strings_manager.dart';

class Routes {
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String verifiyRoute = "/verifiy";
  static const String otpRoute = "/otp";
  static const String addRoute = '/AddView';
    static const String propertyDetailsRoute = '/property-details';
      static const String editAddressRoute = "/edit-address";
  static const String editProfileRoute = "/edit-profile";


  static const String dashboardRoute = "/dashboard";
}

class AppRoute {
  static Route<dynamic> onGeneratorRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.verifiyRoute:
        return MaterialPageRoute(builder: (_) => const VerifiyView());
      case Routes.otpRoute:
        return MaterialPageRoute(builder: (_) => const OtpView());
      case Routes.addRoute:
        return MaterialPageRoute(builder: (_) => const AddView());
              case Routes.propertyDetailsRoute:
        return MaterialPageRoute(builder: (_) =>  PropertyDetailsScreen());
            case Routes.editProfileRoute:
        return MaterialPageRoute(builder: (_) => const EditProfileView());
      case Routes.editAddressRoute:
        return MaterialPageRoute(builder: (_) => const EditAddressView());
      case Routes.dashboardRoute:
        return MaterialPageRoute(builder: (_) => const DashboardView());
      // case Routes.onBoardingRoute:
      //   return MaterialPageRoute(builder: (_) => const OnboardingView());

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
