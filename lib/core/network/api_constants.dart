class ApiConstants {
  static const String apiBaseUrl = "https://api.darafaqkw.com/api/";
// Auth
  static const String login = "login";
  static const String register = "register";
  static const String sendCode = 'send-code';
  static const String forgotPassword = 'forgotPassword';
  static const String verifyCode = 'verify-code-forgot';
  static const String resetPassword = 'resetPassword';

  // user Ads
  static const String showUserAdvertisement = 'show_all';

  //advertisement
  static const String deleteAdvertisement = 'advertisementdestroy';
  static const String updateAdvertisement = 'advertisementupdate';
  static const String addAdvertisement = 'advertisementstore';
  static const String allAds = 'advertisements';

  // home

  static const String adsAuction = 'adsauction';
  static const String adsVip = 'adsvip';
  static const String searchAds = 'adSsearch';
  static const String filterSection = 'advertisements/filter';
  // User Info
  static const String userInfo = 'userinfo';
  static const String userUpdateInfo = 'profile/update';

  static const String notifications = 'Notifications';
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
