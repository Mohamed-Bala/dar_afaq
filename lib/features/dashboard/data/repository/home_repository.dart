import '../../../../core/network/api_result.dart';
import '../../../../core/network/error_handler.dart';
import '../network/home_api.dart';
import '../requests/requests.dart';
import '../response/response.dart';

class HomeRepository {
  final HomeApi _homeApi;

  HomeRepository(this._homeApi);

  Future<ApiResult<AdsResponse>> getSpecialization() async {
    try {
      final response = await _homeApi.getSpecialization();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AuctionResponse>> getAuctionResponse() async {
    try {
      final response = await _homeApi.getAuctionResponse();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<HomeResponse>> getHome() async {
    try {
      final response = await _homeApi.getAdsVipResponse();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

class AddAdvertisementRepository {
  final HomeApi _homeApi;

  AddAdvertisementRepository(this._homeApi);

  Future<ApiResult<AddAdvertisementResponse>> addAdvertisement(
      AddAdvertisementRequest addAdvertisementRequest) async {
    try {
      final response = await _homeApi.addAdvertisement(addAdvertisementRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

class ShowUserAdRepository {
  final HomeApi _homeApi;

  ShowUserAdRepository(this._homeApi);

  Future<ApiResult<ShowUserAdResponse>> getUserAd(
      ShowUserAdRequest showUserAdRequest) async {
    try {
      final response = await _homeApi.getUserAd(showUserAdRequest);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

class NotificationsRepository {
  final HomeApi _homeApi;

  NotificationsRepository(this._homeApi);

  Future<ApiResult<NotificationsResponse>> getNotifications() async {
    try {
      final response = await _homeApi.getNotifications();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

// ===== Delete Ad Repository =================================================
class DeleteAdRepository {
  final HomeApi _homeApi;

  DeleteAdRepository(this._homeApi);

  Future<ApiResult<DeleteAdResponse>> deleteAd(
      DeleteAdRequest deleteAdRequest) async {
    try {
      final response = await _homeApi.deleteAd(deleteAdRequest);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

class UpdateAdRepository {
  final HomeApi _homeApi;

  UpdateAdRepository(this._homeApi);

  Future<ApiResult<UpdateAdResponse>> updateAd(
      UpdateAdvertisementRequest updateAdvertisementRequest) async {
    try {
      final response = await _homeApi.UpdateAd(updateAdvertisementRequest);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

class AdsSearchRepository {
  final HomeApi _homeApi;

  AdsSearchRepository(this._homeApi);

  Future<ApiResult<SearchAdsResponse>> getAdsSearch(
      AdsSearchRequest adsSearchRequest) async {
    try {
      final response = await _homeApi.getSearchAds(adsSearchRequest);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

class FilterSectionRepository {
  final HomeApi _homeApi;

  FilterSectionRepository(this._homeApi);

  Future<ApiResult<FilterSectionResponse>> getfilterSection(
      FilterSectionRequest filterSectionRequest) async {
    try {
      final response = await _homeApi.getfilterSection(filterSectionRequest);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
