import 'package:dar_afaq/features/auth/login/view/login_view.dart';
import 'package:dar_afaq/features/auth/register/view/register_view.dart';
import 'package:dar_afaq/features/dashboard/view/add_view.dart';
import 'package:dar_afaq/features/dashboard/view/dashboard_view.dart';
import 'package:flutter/material.dart';

import '../../features/about_us/about_us_view.dart';
import '../../features/auctions/widget/auction_details.dart';
import '../../features/auth/otp/otp_view.dart';
import '../../features/auth/verifiy/verifiy_view.dart';
import '../../features/dashboard/view/propertydetails_view.dart';
import '../../features/dashboard/widgets/ads/ads_details.dart';
import '../../features/dashboard/widgets/articles_news.dart';
import '../../features/dashboard/widgets/services_grid.dart';
import '../../features/onboarding/onboarding_view.dart';
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
  static const String adsDetailsRoute = '/ads-details';
  static const String servicesGridRoute = '/services_grid';
  static const String editAddressRoute = "/edit-address";
  static const String editProfileRoute = "/edit-profile";
  static const String aboutUsRoute = "/about-us";
  static const String dashboardRoute = "/dashboard";
  static const String articlesNewsRoute = "/articles-news";
  static const String auctionDetailsRoute = "/auction-details";
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
        return MaterialPageRoute(builder: (_) => const PropertyDetailsScreen());
      case Routes.adsDetailsRoute:
        return MaterialPageRoute(builder: (_) => AdsDetailsScreen());
      case Routes.editProfileRoute:
        return MaterialPageRoute(builder: (_) => const EditProfileView());
      case Routes.editAddressRoute:
        return MaterialPageRoute(builder: (_) => const EditAddressView());
      case Routes.aboutUsRoute:
        return MaterialPageRoute(builder: (_) => const AboutUsView());
      case Routes.dashboardRoute:
        return MaterialPageRoute(builder: (_) => const DashboardView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.servicesGridRoute:
        return MaterialPageRoute(builder: (_) => const ServicesGrid());
      case Routes.articlesNewsRoute:
        return MaterialPageRoute(builder: (_) => const ArticlesNews());
      case Routes.auctionDetailsRoute:
        return MaterialPageRoute(builder: (_) => AuctionDetails());

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
