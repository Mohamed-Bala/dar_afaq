import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/network/api_constants.dart';
import '../requests/requests.dart';
import '../response/response.dart';
part 'home_api.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApi {
  factory HomeApi(Dio dio) = _HomeApi;

  @GET(ApiConstants.allAds)
  Future<AdsResponse> getSpecialization();

  @GET(ApiConstants.adsAuction)
  Future<AuctionResponse> getAuctionResponse();

  @GET(ApiConstants.adsVip)
  Future<HomeResponse> getAdsVipResponse();

  @GET(ApiConstants.searchAds)
  Future<SearchAdsResponse> getSearchAds(
    @Body() AdsSearchRequest adsSearchRequest,
  );

  @POST(ApiConstants.addAdvertisement)
  Future<AddAdvertisementResponse> addAdvertisement(
    @Body() AddAdvertisementRequest addAdvertisementRequest,
  );

  @GET(ApiConstants.showUserAdvertisement)
  Future<ShowUserAdResponse> getUserAd(
    @Body() ShowUserAdRequest showUserAdRequest,
  );
  @DELETE(ApiConstants.deleteAdvertisement)
  Future<DeleteAdResponse> deleteAd(
    @Body() DeleteAdRequest deleteAdRequest,
  );
  @POST(ApiConstants.updateAdvertisement)
  Future<UpdateAdResponse> UpdateAd(
    @Body() UpdateAdvertisementRequest UpdateAdvertisementRequest,
  );

  @POST(ApiConstants.notifications)
  Future<NotificationsResponse> getNotifications();

  @GET(ApiConstants.filterSection)
  Future<FilterSectionResponse> getfilterSection(
    @Body() FilterSectionRequest filterSectionRequest,
  );
}
