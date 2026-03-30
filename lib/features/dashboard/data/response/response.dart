import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';

@JsonSerializable()
class AdsResponse {
  String? message;
  @JsonKey(name: 'advertisements')
  List<AdsDataResponse?>? allAds;

  AdsResponse({
    this.message,
    this.allAds,
  });

  factory AdsResponse.fromJson(Map<String, dynamic> json) =>
      _$AdsResponseFromJson(json);
}

@JsonSerializable()
class AdsDataResponse {
  int? id;
  @JsonKey(name: 'plan_price')
  String? planPrice;
  @JsonKey(name: 'plan_name')
  String? planName;
  @JsonKey(name: 'transaction_type')
  String? transactionType;
  String? phone;
  String? description;
  String? type;
  String? region;
  String? price;
  String? images;
  @JsonKey(name: 'user_id')
  String? userId;
  @JsonKey(name: 'share_code')
  String? shareCode;
  @JsonKey(name: 'share_url')
  String? shareUrl;

  AdsDataResponse({
    this.id,
    this.planPrice,
    this.planName,
    this.transactionType,
    this.phone,
    this.description,
    this.type,
    this.region,
    this.price,
    this.images,
    this.userId,
    this.shareCode,
    this.shareUrl,
  });

  factory AdsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AdsDataResponseFromJson(json);
}

// ============= Auction Response
@JsonSerializable()
class AuctionResponse {
  bool? status;
  int? count;
  @JsonKey(name: 'upcoming_auctions')
  List<AuctionDataResponse?>? upcomingAuctions;

  AuctionResponse({
    this.status,
    this.count,
    this.upcomingAuctions,
  });

  factory AuctionResponse.fromJson(Map<String, dynamic> json) =>
      _$AuctionResponseFromJson(json);
}

@JsonSerializable()
class AuctionDataResponse {
  int? id;
  @JsonKey(name: 'plan_price')
  String? planPrice;
  @JsonKey(name: 'plan_name')
  String? planName;
  @JsonKey(name: 'transaction_type')
  String? transactionType;
  @JsonKey(name: 'auction_date')
  String? auctionDate;
  String? phone;
  String? description;
  String? type;
  String? region;
  String? price;
  String? images;
  @JsonKey(name: 'user_id')
  String? userId;

  AuctionDataResponse({
    this.id,
    this.planPrice,
    this.planName,
    this.transactionType,
    this.phone,
    this.description,
    this.type,
    this.region,
    this.price,
    this.images,
    this.userId,
  });

  factory AuctionDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AuctionDataResponseFromJson(json);
}

// Home =====================================

@JsonSerializable()
class HomeResponse {
  bool? status;
  int? count;
  @JsonKey(name: 'vip_ads')
  List<VipAdsDataResponse?>? vipAds;

  HomeResponse({
    this.status,
    this.count,
    this.vipAds,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);
}

@JsonSerializable()
class VipAdsDataResponse {
  int? id;
  @JsonKey(name: 'plan_price')
  String? planPrice;
  @JsonKey(name: 'plan_name')
  String? planName;
  @JsonKey(name: 'transaction_type')
  String? transactionType;
  @JsonKey(name: 'auction_date')
  String? auctionDate;
  String? phone;
  String? description;
  String? type;
  String? region;
  String? price;
  String? images;
  @JsonKey(name: 'user_id')
  String? userId;
  @JsonKey(name: 'share_code')
  String? shareCode;
  @JsonKey(name: 'share_url')
  String? shareUrl;

  VipAdsDataResponse({
    this.id,
    this.planPrice,
    this.planName,
    this.transactionType,
    this.phone,
    this.description,
    this.type,
    this.region,
    this.price,
    this.images,
    this.userId,
    this.shareCode,
    this.shareUrl,
  });

  factory VipAdsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$VipAdsDataResponseFromJson(json);
}

// User Id Add advertisement ===================================================

@JsonSerializable()
class AddAdvertisementResponse {
  String? message;
  @JsonKey(name: 'advertisement')
  AddAdvertisementDataResponse? addAdvertisement;

  AddAdvertisementResponse({
    this.message,
    this.addAdvertisement,
  });

  factory AddAdvertisementResponse.fromJson(Map<String, dynamic> json) =>
      _$AddAdvertisementResponseFromJson(json);
}

@JsonSerializable()
class AddAdvertisementDataResponse {
  int? id;
  @JsonKey(name: 'plan_price')
  int? planPrice;
  @JsonKey(name: 'plan_name')
  String? planName;
  @JsonKey(name: 'transaction_type')
  String? transactionType;
  @JsonKey(name: 'auction_date')
  String? auctionDate;
  String? title;
  String? phone;
  String? description;
  String? type;
  String? region;
  String? price;
  dynamic images;
  @JsonKey(name: 'user_id')
  int? userId;

  AddAdvertisementDataResponse({
    this.id,
    this.planName,
    this.planPrice,
    this.transactionType,
    this.phone,
    this.description,
    this.type,
    this.region,
    this.price,
    this.images,
    this.userId,
  });

  factory AddAdvertisementDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AddAdvertisementDataResponseFromJson(json);
}

//==============================================================================

@JsonSerializable()
class ShowUserAdResponse {
  @JsonKey(name: "advertisements")
  final List<ShowUserAdvertisementData?>? showUserAdvertisementData;

  ShowUserAdResponse({this.showUserAdvertisementData});

  factory ShowUserAdResponse.fromJson(Map<String, dynamic> json) =>
      _$ShowUserAdResponseFromJson(json);
}

@JsonSerializable()
class ShowUserAdvertisementData {
  final int? id;
  @JsonKey(name: "plan_price")
  final String? planPrice;
  @JsonKey(name: "plan_name")
  final String? planName;
  @JsonKey(name: "transaction_type")
  final String? transactionType;
  final String? phone;
  final String? status;
  final String? description;
  @JsonKey(name: "auction_date")
  final String? auctionDate;
  final String? type;
  final String? region;
  final String? price;
  final String? images;
  @JsonKey(name: "user_id")
  final String? userId;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "share_code")
  final String? shareCode;
  @JsonKey(name: "share_url")
  final String? shareUrl;

  ShowUserAdvertisementData({
    this.id,
    this.planPrice,
    this.planName,
    this.transactionType,
    this.phone,
    this.status,
    this.description,
    this.auctionDate,
    this.type,
    this.region,
    this.price,
    this.images,
    this.userId,
    this.createdAt,
    this.shareCode,
    this.shareUrl,
  });

  factory ShowUserAdvertisementData.fromJson(Map<String, dynamic> json) =>
      _$ShowUserAdvertisementDataFromJson(json);
}
// =============================================================================

@JsonSerializable()
class NotificationsResponse {
  bool? success;
  String? message;
  @JsonKey(name: 'data')
  List<NotificationsDataResponse?>? notificationsDataResponse;

  NotificationsResponse({
    this.success,
    this.message,
    this.notificationsDataResponse,
  });

  factory NotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationsResponseFromJson(json);
}

@JsonSerializable()
class NotificationsDataResponse {
  int? id;
  String? email;
  @JsonKey(name: 'Message')
  String? message;
  @JsonKey(name: 'Subject')
  String? subject;

  NotificationsDataResponse({
    this.id,
    this.email,
    this.message,
    this.subject,
  });

  factory NotificationsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationsDataResponseFromJson(json);
}

// ================= SearchAdsResponse =================
@JsonSerializable()
class SearchAdsResponse {
  final String? message;
  final int? count;
  final List<AdModel>? data;
  SearchAdsResponse(this.count, this.data, this.message);

  factory SearchAdsResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchAdsResponseFromJson(json);
}

@JsonSerializable()
class AdModel {
  final int? id;
  @JsonKey(name: 'plan_price')
  final String? planPrice;
  @JsonKey(name: 'plan_name')
  final String? planName;
  @JsonKey(name: 'transaction_type')
  final String? transactionType;
  final String? phone;
  final String? status;
  final String? description;
  @JsonKey(name: 'auction_date')
  final String? auctionDate;
  final String? type;
  final String? region;
  final String? price;
  final String? images;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'share_code')
  final String? shareCode;
  @JsonKey(name: 'share_url')
  final String? shareUrl;

  AdModel({
    this.id,
    this.planPrice,
    this.planName,
    this.transactionType,
    this.phone,
    this.status,
    this.description,
    this.auctionDate,
    this.type,
    this.region,
    this.price,
    this.images,
    this.userId,
    this.createdAt,
    this.shareCode,
    this.shareUrl,
  });

  factory AdModel.fromJson(Map<String, dynamic> json) =>
      _$AdModelFromJson(json);
}

// =============================================================================
@JsonSerializable()
class UserMonthlyPointsResponse {
  final bool? status;
  @JsonKey(name: 'current_month')
  final int? currentMonth;
  @JsonKey(name: 'total_points')
  final String? totalPoints;
  UserMonthlyPointsResponse(this.status, this.currentMonth, this.totalPoints);

  factory UserMonthlyPointsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserMonthlyPointsResponseFromJson(json);
}

// === DeleteAdResponse
@JsonSerializable()
class DeleteAdResponse {
  String? message;
  DeleteAdResponse({
    this.message,
  });

  factory DeleteAdResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAdResponseFromJson(json);
}

// ====== Update Response ======================================================
@JsonSerializable()
class UpdateAdResponse {
  String? message;
  bool? status;

  UpdateAdResponse({
    this.message,
    this.status,
  });

  factory UpdateAdResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAdResponseFromJson(json);
}

@JsonSerializable()
class FilterSectionResponse {
  final bool? success;
  final int? count;
  final List<FilterSectionModel>? data;

  FilterSectionResponse({this.success, this.count, this.data});

  factory FilterSectionResponse.fromJson(Map<String, dynamic> json) =>
      _$FilterSectionResponseFromJson(json);
}

@JsonSerializable()
class FilterSectionModel {
  final int? id;
  @JsonKey(name: 'plan_price')
  final String? planPrice;
  @JsonKey(name: 'plan_name')
  final String? planName;
  @JsonKey(name: 'transaction_type')
  final String? transactionType;
  final String? phone;
  final String? status;
  final String? description;
  @JsonKey(name: 'auction_date')
  final String? auctionDate;
  final String? type;
  final String? region;
  final String? price;
  final String? images;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'share_code')
  final String? shareCode;
  @JsonKey(name: 'share_url')
  final String? shareUrl;

  FilterSectionModel({
    this.id,
    this.planPrice,
    this.planName,
    this.transactionType,
    this.phone,
    this.status,
    this.description,
    this.auctionDate,
    this.type,
    this.region,
    this.price,
    this.images,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.shareCode,
    this.shareUrl,
  });

  // --- أضف الدالة هنا ---
  VipAdsDataResponse toVipResponse() {
    return VipAdsDataResponse(
      id: id,
      planPrice: planPrice,
      planName: planName,
      transactionType: transactionType,
      phone: phone,
      description: description,
      type: type.toString(),
      region: region,
      price: price,
      images: images,
      userId: userId,
    );
  }

  factory FilterSectionModel.fromJson(Map<String, dynamic> json) =>
      _$FilterSectionModelFromJson(json);
}

@JsonSerializable()
class PropertyTypesResponse {
  final bool? success;
  final String? message;
  final List<PropertyTypesResponseData>? data;

  PropertyTypesResponse({this.success, this.message, this.data});

  factory PropertyTypesResponse.fromJson(Map<String, dynamic> json) =>
      _$PropertyTypesResponseFromJson(json);
}

@JsonSerializable()
class PropertyTypesResponseData {
  final int? id;
  final String? name;

  PropertyTypesResponseData({this.id, this.name});

  factory PropertyTypesResponseData.fromJson(Map<String, dynamic> json) =>
      _$PropertyTypesResponseDataFromJson(json);
}

@JsonSerializable()
class AreasResponse {
  final bool? success;
  final String? message;
  final List<AreaData>? data;

  AreasResponse({this.success, this.message, this.data});

  factory AreasResponse.fromJson(Map<String, dynamic> json) =>
      _$AreasResponseFromJson(json);
}

@JsonSerializable()
class AreaData {
  final int? id;
  final String? name;

  AreaData({this.id, this.name});

  factory AreaData.fromJson(Map<String, dynamic> json) =>
      _$AreaDataFromJson(json);
}

// ================= News =====================================

@JsonSerializable()
class NewsResponse {
  final bool? success;
  final List<NewsResponseData>? data;
  final String? message;

  NewsResponse({this.success, this.message, this.data});

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);
}

@JsonSerializable()
class NewsResponseData {
  final int? id;
  final String? title;
  final String? url;

  NewsResponseData({this.id, this.title, this.url});

  factory NewsResponseData.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseDataFromJson(json);
}

// ================ SearchFilterResponse =======================================

@JsonSerializable()
class SearchFilterResponse {
  final bool? success;
  final int? count;
  final List<SearchFilterData>? data;

  SearchFilterResponse({
    required this.success,
    required this.count,
    required this.data,
  });

  factory SearchFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchFilterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchFilterResponseToJson(this);
}

@JsonSerializable()
class SearchFilterData {
  final int? id;
  @JsonKey(name: 'plan_price')
  final String? planPrice;
  @JsonKey(name: 'plan_name')
  final String? planName;
  @JsonKey(name: 'transaction_type')
  final String? transactionType;
  final String? phone;
  final String? status;
  final String? description;
  @JsonKey(name: 'auction_date')
  final String? auctionDate;
  final String? type;
  final String? region;
  final String? price;
  final String? images;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'share_code')
  final String? shareCode;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'share_url')
  final String? shareUrl;

  SearchFilterData({
    required this.id,
    required this.planPrice,
    required this.planName,
    required this.transactionType,
    required this.phone,
    required this.status,
    required this.description,
    required this.auctionDate,
    required this.type,
    required this.region,
    required this.price,
    required this.images,
    required this.userId,
    required this.shareCode,
    required this.createdAt,
    required this.updatedAt,
    required this.shareUrl,
  });

  factory SearchFilterData.fromJson(Map<String, dynamic> json) =>
      _$SearchFilterDataFromJson(json);

  Map<String, dynamic> toJson() => _$SearchFilterDataToJson(this);
}
//==============================================================================

@JsonSerializable()
class CalculateMarketValueRsponse {
  final String? status;
  @JsonKey(name: 'estimated_value')
  final int? estimatedValue;
  final String? currency;
  CalculateMarketValueRsponseData? details;
  CalculateMarketValueRsponse(
      this.status, this.estimatedValue, this.currency, this.details);

  factory CalculateMarketValueRsponse.fromJson(Map<String, dynamic> json) =>
      _$CalculateMarketValueRsponseFromJson(json);
}

@JsonSerializable()
class CalculateMarketValueRsponseData {
  @JsonKey(name: 'base_price')
  final int? basePrice;
  @JsonKey(name: 'land_impact')
  final int? landImpact;
  CalculateMarketValueRsponseData(this.basePrice, this.landImpact);

  factory CalculateMarketValueRsponseData.fromJson(Map<String, dynamic> json) =>
      _$CalculateMarketValueRsponseDataFromJson(json);
}
//==============================================================================

@JsonSerializable()
class CalculateConstructionCostRsponse {
  final String? status;
  @JsonKey(name: 'construction_estimate')
  final int? constructionEstimate;
  final String? currency;
  CalculateConstructionCostRsponseData? breakdown;
  CalculateConstructionCostRsponse(
      this.status, this.constructionEstimate, this.currency, this.breakdown);

  factory CalculateConstructionCostRsponse.fromJson(
          Map<String, dynamic> json) =>
      _$CalculateConstructionCostRsponseFromJson(json);
}

@JsonSerializable()
class CalculateConstructionCostRsponseData {
  @JsonKey(name: 'structure_and_finishing')
  final int? structureAndFinishing;
  final int? elevators;
  @JsonKey(name: 'basement_extra')
  final int? basementExtra;
  @JsonKey(name: 'avg_cost_per_meter')
  final double? avg_costPerMeter;
  CalculateConstructionCostRsponseData(this.structureAndFinishing,
      this.elevators, this.basementExtra, this.avg_costPerMeter);

  factory CalculateConstructionCostRsponseData.fromJson(
          Map<String, dynamic> json) =>
      _$CalculateConstructionCostRsponseDataFromJson(json);
}
