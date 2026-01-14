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
  });

  factory AdModel.fromJson(Map<String, dynamic> json) =>
      _$AdModelFromJson(json);
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
