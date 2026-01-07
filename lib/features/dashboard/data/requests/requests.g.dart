// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAdvertisementRequest _$AddAdvertisementRequestFromJson(
        Map<String, dynamic> json) =>
    AddAdvertisementRequest(
      selectedPlanPrice: (json['selected_plan_price'] as num).toInt(),
      selectedPlanName: json['selected_plan_name'] as String,
      transactionType: json['transaction_type'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      region: json['region'] as String,
      price: json['price'] as String,
      phone: json['phone'] as String,
      userId: (json['user_id'] as num).toInt(),
      image: json['image_base64'] as String,
    );

Map<String, dynamic> _$AddAdvertisementRequestToJson(
        AddAdvertisementRequest instance) =>
    <String, dynamic>{
      'selected_plan_price': instance.selectedPlanPrice,
      'selected_plan_name': instance.selectedPlanName,
      'transaction_type': instance.transactionType,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'region': instance.region,
      'price': instance.price,
      'phone': instance.phone,
      'user_id': instance.userId,
      'image_base64': instance.image,
    };

ShowUserAdRequest _$ShowUserAdRequestFromJson(Map<String, dynamic> json) =>
    ShowUserAdRequest(
      userId: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$ShowUserAdRequestToJson(ShowUserAdRequest instance) =>
    <String, dynamic>{
      'id': instance.userId,
    };

DeleteAdRequest _$DeleteAdRequestFromJson(Map<String, dynamic> json) =>
    DeleteAdRequest(
      userId: (json['user_id'] as num).toInt(),
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$DeleteAdRequestToJson(DeleteAdRequest instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'id': instance.id,
    };

UpdateAdvertisementRequest _$UpdateAdvertisementRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateAdvertisementRequest(
      selectedPlanPrice: (json['selected_plan_price'] as num).toInt(),
      selectedPlanName: json['selected_plan_name'] as String,
      transactionType: json['transaction_type'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      region: json['region'] as String,
      price: json['price'] as String,
      phone: json['phone'] as String,
      userId: (json['user_id'] as num).toInt(),
      image: json['image_base64'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$UpdateAdvertisementRequestToJson(
        UpdateAdvertisementRequest instance) =>
    <String, dynamic>{
      'selected_plan_price': instance.selectedPlanPrice,
      'selected_plan_name': instance.selectedPlanName,
      'transaction_type': instance.transactionType,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'region': instance.region,
      'price': instance.price,
      'phone': instance.phone,
      'user_id': instance.userId,
      'id': instance.id,
      'image_base64': instance.image,
    };

AdsSearchRequest _$AdsSearchRequestFromJson(Map<String, dynamic> json) =>
    AdsSearchRequest(
      region: json['region'] as String?,
      transactionType: json['transaction_type'] as String?,
    );

Map<String, dynamic> _$AdsSearchRequestToJson(AdsSearchRequest instance) =>
    <String, dynamic>{
      'region': instance.region,
      'transaction_type': instance.transactionType,
    };

FilterSectionRequest _$FilterSectionRequestFromJson(
        Map<String, dynamic> json) =>
    FilterSectionRequest(
      section: json['section'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$FilterSectionRequestToJson(
        FilterSectionRequest instance) =>
    <String, dynamic>{
      'section': instance.section,
      'type': instance.type,
    };
