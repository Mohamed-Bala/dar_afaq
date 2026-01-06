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