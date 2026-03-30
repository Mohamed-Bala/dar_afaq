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
  Future<AdsResponse> getAllAds();

  @GET(ApiConstants.adsAuction)
  Future<AuctionResponse> getAuctionResponse();

  @GET(ApiConstants.adsVip)
  Future<HomeResponse> getAdsVipResponse();

  @GET(ApiConstants.searchAds)
  Future<SearchAdsResponse> getSearchAds(
    @Body() AdsSearchRequest adsSearchRequest,
  );

  @GET(ApiConstants.getUserMonthlyPoints)
  Future<UserMonthlyPointsResponse> getUserMonthlyPoints(
    @Body() UserMonthlyPointsRequest userMonthlyPointsRequest,
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

  @GET(ApiConstants.getPropertyTypes)
  Future<PropertyTypesResponse> getPropertyTypes();

  @GET(ApiConstants.getAreas)
  Future<AreasResponse> getAreas();

  @GET(ApiConstants.news)
  Future<NewsResponse> getNews();

  @GET(ApiConstants.searchFilter)
  Future<SearchFilterResponse> getSearchFilter(
    @Query("transaction_type") String? transactionType,
    @Query("type") List<String>? type,
    @Query("region") List<String>? region,
    @Query("price_range") String? priceRange,
  );

  @GET(ApiConstants.calculateMarketValue)
  Future<CalculateMarketValueRsponse> getCalculateMarketValue(
    @Queries() Map<String, dynamic> query,
  );

  @GET(ApiConstants.calculateConstructionCost)
  Future<CalculateConstructionCostRsponse> getCalculateConstructionCost(
    @Queries() Map<String, dynamic> query,
  );
}
