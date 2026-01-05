// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdsResponse _$AdsResponseFromJson(Map<String, dynamic> json) => AdsResponse(
      message: json['message'] as String?,
      allAds: (json['advertisements'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : AdsDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdsResponseToJson(AdsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'advertisements': instance.allAds,
    };

AdsDataResponse _$AdsDataResponseFromJson(Map<String, dynamic> json) =>
    AdsDataResponse(
      id: (json['id'] as num?)?.toInt(),
      planPrice: json['plan_price'] as String?,
      planName: json['plan_name'] as String?,
      transactionType: json['transaction_type'] as String?,
      phone: json['phone'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      region: json['region'] as String?,
      price: json['price'] as String?,
      images: json['images'] as String?,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$AdsDataResponseToJson(AdsDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plan_price': instance.planPrice,
      'plan_name': instance.planName,
      'transaction_type': instance.transactionType,
      'phone': instance.phone,
      'description': instance.description,
      'type': instance.type,
      'region': instance.region,
      'price': instance.price,
      'images': instance.images,
      'user_id': instance.userId,
    };

AuctionResponse _$AuctionResponseFromJson(Map<String, dynamic> json) =>
    AuctionResponse(
      status: json['status'] as bool?,
      count: (json['count'] as num?)?.toInt(),
      upcomingAuctions: (json['upcoming_auctions'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : AuctionDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AuctionResponseToJson(AuctionResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'count': instance.count,
      'upcoming_auctions': instance.upcomingAuctions,
    };

AuctionDataResponse _$AuctionDataResponseFromJson(Map<String, dynamic> json) =>
    AuctionDataResponse(
      id: (json['id'] as num?)?.toInt(),
      planPrice: json['plan_price'] as String?,
      planName: json['plan_name'] as String?,
      transactionType: json['transaction_type'] as String?,
      phone: json['phone'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      region: json['region'] as String?,
      price: json['price'] as String?,
      images: json['images'] as String?,
      userId: json['user_id'] as String?,
    )..auctionDate = json['auction_date'] as String?;

Map<String, dynamic> _$AuctionDataResponseToJson(
        AuctionDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plan_price': instance.planPrice,
      'plan_name': instance.planName,
      'transaction_type': instance.transactionType,
      'auction_date': instance.auctionDate,
      'phone': instance.phone,
      'description': instance.description,
      'type': instance.type,
      'region': instance.region,
      'price': instance.price,
      'images': instance.images,
      'user_id': instance.userId,
    };

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      status: json['status'] as bool?,
      count: (json['count'] as num?)?.toInt(),
      vipAds: (json['vip_ads'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : VipAdsDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'count': instance.count,
      'vip_ads': instance.vipAds,
    };

VipAdsDataResponse _$VipAdsDataResponseFromJson(Map<String, dynamic> json) =>
    VipAdsDataResponse(
      id: (json['id'] as num?)?.toInt(),
      planPrice: json['plan_price'] as String?,
      planName: json['plan_name'] as String?,
      transactionType: json['transaction_type'] as String?,
      phone: json['phone'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      region: json['region'] as String?,
      price: json['price'] as String?,
      images: json['images'] as String?,
      userId: json['user_id'] as String?,
    )..auctionDate = json['auction_date'] as String?;

Map<String, dynamic> _$VipAdsDataResponseToJson(VipAdsDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plan_price': instance.planPrice,
      'plan_name': instance.planName,
      'transaction_type': instance.transactionType,
      'auction_date': instance.auctionDate,
      'phone': instance.phone,
      'description': instance.description,
      'type': instance.type,
      'region': instance.region,
      'price': instance.price,
      'images': instance.images,
      'user_id': instance.userId,
    };

AddAdvertisementResponse _$AddAdvertisementResponseFromJson(
        Map<String, dynamic> json) =>
    AddAdvertisementResponse(
      message: json['message'] as String?,
      addAdvertisement: json['advertisement'] == null
          ? null
          : AddAdvertisementDataResponse.fromJson(
              json['advertisement'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddAdvertisementResponseToJson(
        AddAdvertisementResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'advertisement': instance.addAdvertisement,
    };

AddAdvertisementDataResponse _$AddAdvertisementDataResponseFromJson(
        Map<String, dynamic> json) =>
    AddAdvertisementDataResponse(
      id: (json['id'] as num?)?.toInt(),
      planName: json['plan_name'] as String?,
      planPrice: (json['plan_price'] as num?)?.toInt(),
      transactionType: json['transaction_type'] as String?,
      phone: json['phone'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      region: json['region'] as String?,
      price: json['price'] as String?,
      images: json['images'],
      userId: (json['user_id'] as num?)?.toInt(),
    )
      ..auctionDate = json['auction_date'] as String?
      ..title = json['title'] as String?;

Map<String, dynamic> _$AddAdvertisementDataResponseToJson(
        AddAdvertisementDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plan_price': instance.planPrice,
      'plan_name': instance.planName,
      'transaction_type': instance.transactionType,
      'auction_date': instance.auctionDate,
      'title': instance.title,
      'phone': instance.phone,
      'description': instance.description,
      'type': instance.type,
      'region': instance.region,
      'price': instance.price,
      'images': instance.images,
      'user_id': instance.userId,
    };

ShowUserAdResponse _$ShowUserAdResponseFromJson(Map<String, dynamic> json) =>
    ShowUserAdResponse(
      showUserAdvertisementData: (json['advertisements'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ShowUserAdvertisementData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShowUserAdResponseToJson(ShowUserAdResponse instance) =>
    <String, dynamic>{
      'advertisements': instance.showUserAdvertisementData,
    };

ShowUserAdvertisementData _$ShowUserAdvertisementDataFromJson(
        Map<String, dynamic> json) =>
    ShowUserAdvertisementData(
      id: (json['id'] as num?)?.toInt(),
      planPrice: json['plan_price'] as String?,
      planName: json['plan_name'] as String?,
      transactionType: json['transaction_type'] as String?,
      phone: json['phone'] as String?,
      status: json['status'] as String?,
      description: json['description'] as String?,
      auctionDate: json['auction_date'] as String?,
      type: json['type'] as String?,
      region: json['region'] as String?,
      price: json['price'] as String?,
      images: json['images'] as String?,
      userId: json['user_id'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$ShowUserAdvertisementDataToJson(
        ShowUserAdvertisementData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plan_price': instance.planPrice,
      'plan_name': instance.planName,
      'transaction_type': instance.transactionType,
      'phone': instance.phone,
      'status': instance.status,
      'description': instance.description,
      'auction_date': instance.auctionDate,
      'type': instance.type,
      'region': instance.region,
      'price': instance.price,
      'images': instance.images,
      'user_id': instance.userId,
      'created_at': instance.createdAt,
    };

NotificationsResponse _$NotificationsResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationsResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      notificationsDataResponse: (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : NotificationsDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationsResponseToJson(
        NotificationsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.notificationsDataResponse,
    };

NotificationsDataResponse _$NotificationsDataResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationsDataResponse(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      message: json['Message'] as String?,
      subject: json['Subject'] as String?,
    );

Map<String, dynamic> _$NotificationsDataResponseToJson(
        NotificationsDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'Message': instance.message,
      'Subject': instance.subject,
    };

RegionsResponse _$RegionsResponseFromJson(Map<String, dynamic> json) =>
    RegionsResponse(
      regions:
          (json['regions'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$RegionsResponseToJson(RegionsResponse instance) =>
    <String, dynamic>{
      'regions': instance.regions,
    };

DeleteAdResponse _$DeleteAdResponseFromJson(Map<String, dynamic> json) =>
    DeleteAdResponse(
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DeleteAdResponseToJson(DeleteAdResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

UpdateAdResponse _$UpdateAdResponseFromJson(Map<String, dynamic> json) =>
    UpdateAdResponse(
      message: json['message'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$UpdateAdResponseToJson(UpdateAdResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
