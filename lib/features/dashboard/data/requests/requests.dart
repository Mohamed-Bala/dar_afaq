import 'package:json_annotation/json_annotation.dart';
part 'requests.g.dart';

@JsonSerializable()
class AddAdvertisementRequest {
  @JsonKey(name: 'selected_plan_price')
  final int selectedPlanPrice;
  @JsonKey(name: 'selected_plan_name')
  final String selectedPlanName;
  @JsonKey(name: 'transaction_type')
  final String transactionType;
  final String title;
  final String description;
  final String type;
  final String region;
  final String price;
  final String phone;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'image_base64')
  final String image;

  AddAdvertisementRequest({
    required this.selectedPlanPrice,
    required this.selectedPlanName,
    required this.transactionType,
    required this.title,
    required this.description,
    required this.type,
    required this.region,
    required this.price,
    required this.phone,
    required this.userId,
    required this.image,
  });

  Map<String, dynamic> toJson() => _$AddAdvertisementRequestToJson(this);
}

@JsonSerializable()
class ShowUserAdRequest {
  @JsonKey(name: 'id')
  final int userId;

  ShowUserAdRequest({
    required this.userId,
  });

  Map<String, dynamic> toJson() => _$ShowUserAdRequestToJson(this);
}

// ======== DeleteAd ===========================================================
@JsonSerializable()
class DeleteAdRequest {
  @JsonKey(name: 'user_id')
  final int userId;
  final int id;

  DeleteAdRequest({
    required this.userId,
    required this.id,
  });

  Map<String, dynamic> toJson() => _$DeleteAdRequestToJson(this);
}

// Update Ads

@JsonSerializable()
class UpdateAdvertisementRequest {
  @JsonKey(name: 'selected_plan_price')
  final int selectedPlanPrice;
  @JsonKey(name: 'selected_plan_name')
  final String selectedPlanName;
  @JsonKey(name: 'transaction_type')
  final String transactionType;
  final String title;
  final String description;
  final String type;
  final String region;
  final String price;
  final String phone;
  @JsonKey(name: 'user_id')
  final int userId;
  final int id;
  @JsonKey(name: 'image_base64')
  final String image;

  UpdateAdvertisementRequest({
    required this.selectedPlanPrice,
    required this.selectedPlanName,
    required this.transactionType,
    required this.title,
    required this.description,
    required this.type,
    required this.region,
    required this.price,
    required this.phone,
    required this.userId,
    required this.image,
    required this.id,
  });

  Map<String, dynamic> toJson() => _$UpdateAdvertisementRequestToJson(this);
}

@JsonSerializable()
class AdsSearchRequest {
  final String? region;
  @JsonKey(name: 'transaction_type')
  final String? transactionType;

  AdsSearchRequest({
    this.region,
    this.transactionType,
  });

  // هذه الدالة هي التي تحول الكائن إلى الخريطة (Map) التي تُرسل في الـ Body
  Map<String, dynamic> toJson() => _$AdsSearchRequestToJson(this);
}

//==============================================================================
@JsonSerializable()
class UserMonthlyPointsRequest {
  @JsonKey(name: 'user_id')
  final int? userId;
  UserMonthlyPointsRequest({this.userId});

  Map<String, dynamic> toJson() => _$UserMonthlyPointsRequestToJson(this);
}

//==============================================================================

@JsonSerializable()
class FilterSectionRequest {
  final String? section;
  final String? type;

  FilterSectionRequest({
    this.section,
    this.type,
  });

  Map<String, dynamic> toJson() => _$FilterSectionRequestToJson(this);
}

// Serach ==========
@JsonSerializable()
class SearchFilterRequest {
  @JsonKey(name: 'transaction_type')
  final String transactionType;
  final List<String> type;
  final List<String> region;
  @JsonKey(name: 'price_range')
  final String priceRange;

  SearchFilterRequest({
    required this.transactionType,
    required this.type,
    required this.region,
    required this.priceRange,
  });

  factory SearchFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchFilterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchFilterRequestToJson(this);
}
//==============================================================================

@JsonSerializable()
class CalculateMarketValueRequest {
  @JsonKey(name: 'land_size')
  final int landSize;
  final String location;
  final int position;
  @JsonKey(name: 'building_age')
  final String buildingAge;
  @JsonKey(name: 'finishing_level')
  final int finishingLevel;
  final List<String> features;

  CalculateMarketValueRequest(
      {required this.landSize,
      required this.location,
      required this.position,
      required this.buildingAge,
      required this.finishingLevel,
      required this.features});

  factory CalculateMarketValueRequest.fromJson(Map<String, dynamic> json) =>
      _$CalculateMarketValueRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CalculateMarketValueRequestToJson(this);
}
//==============================================================================

@JsonSerializable()
class CalculateConstructionCostRequest {
  @JsonKey(name: 'building_area')
  final int buildingArea;
  @JsonKey(name: 'structure_type')
  final int structureType;
  @JsonKey(name: 'finishing_type')
  final int finishingType;
  @JsonKey(name: 'ac_type')
  final int acType;
  @JsonKey(name: 'energy_saving')
  final bool energySaving;
  final int elevators;
  @JsonKey(name: 'plumbing_type')
  final int plumbingType;
  @JsonKey(name: 'has_basement')
  final bool hasBasement;

  CalculateConstructionCostRequest({
    required this.buildingArea,
    required this.structureType,
    required this.finishingType,
    required this.acType,
    required this.energySaving,
    required this.elevators,
    required this.plumbingType,
      required this.hasBasement,
  });

  factory CalculateConstructionCostRequest.fromJson(
          Map<String, dynamic> json) =>
      _$CalculateConstructionCostRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CalculateConstructionCostRequestToJson(this);
}
