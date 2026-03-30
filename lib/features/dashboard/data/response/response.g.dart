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
      shareCode: json['share_code'] as String?,
      shareUrl: json['share_url'] as String?,
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
      'share_code': instance.shareCode,
      'share_url': instance.shareUrl,
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
      shareCode: json['share_code'] as String?,
      shareUrl: json['share_url'] as String?,
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
      'share_code': instance.shareCode,
      'share_url': instance.shareUrl,
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
      shareCode: json['share_code'] as String?,
      shareUrl: json['share_url'] as String?,
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
      'share_code': instance.shareCode,
      'share_url': instance.shareUrl,
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

SearchAdsResponse _$SearchAdsResponseFromJson(Map<String, dynamic> json) =>
    SearchAdsResponse(
      (json['count'] as num?)?.toInt(),
      (json['data'] as List<dynamic>?)
          ?.map((e) => AdModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['message'] as String?,
    );

Map<String, dynamic> _$SearchAdsResponseToJson(SearchAdsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'count': instance.count,
      'data': instance.data,
    };

AdModel _$AdModelFromJson(Map<String, dynamic> json) => AdModel(
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
      shareCode: json['share_code'] as String?,
      shareUrl: json['share_url'] as String?,
    );

Map<String, dynamic> _$AdModelToJson(AdModel instance) => <String, dynamic>{
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
      'share_code': instance.shareCode,
      'share_url': instance.shareUrl,
    };

UserMonthlyPointsResponse _$UserMonthlyPointsResponseFromJson(
        Map<String, dynamic> json) =>
    UserMonthlyPointsResponse(
      json['status'] as bool?,
      (json['current_month'] as num?)?.toInt(),
      json['total_points'] as String?,
    );

Map<String, dynamic> _$UserMonthlyPointsResponseToJson(
        UserMonthlyPointsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'current_month': instance.currentMonth,
      'total_points': instance.totalPoints,
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

FilterSectionResponse _$FilterSectionResponseFromJson(
        Map<String, dynamic> json) =>
    FilterSectionResponse(
      success: json['success'] as bool?,
      count: (json['count'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FilterSectionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FilterSectionResponseToJson(
        FilterSectionResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };

FilterSectionModel _$FilterSectionModelFromJson(Map<String, dynamic> json) =>
    FilterSectionModel(
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
      updatedAt: json['updated_at'] as String?,
      shareCode: json['share_code'] as String?,
      shareUrl: json['share_url'] as String?,
    );

Map<String, dynamic> _$FilterSectionModelToJson(FilterSectionModel instance) =>
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
      'updated_at': instance.updatedAt,
      'share_code': instance.shareCode,
      'share_url': instance.shareUrl,
    };

PropertyTypesResponse _$PropertyTypesResponseFromJson(
        Map<String, dynamic> json) =>
    PropertyTypesResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              PropertyTypesResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PropertyTypesResponseToJson(
        PropertyTypesResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

PropertyTypesResponseData _$PropertyTypesResponseDataFromJson(
        Map<String, dynamic> json) =>
    PropertyTypesResponseData(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PropertyTypesResponseDataToJson(
        PropertyTypesResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

AreasResponse _$AreasResponseFromJson(Map<String, dynamic> json) =>
    AreasResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AreaData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AreasResponseToJson(AreasResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

AreaData _$AreaDataFromJson(Map<String, dynamic> json) => AreaData(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$AreaDataToJson(AreaData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

NewsResponse _$NewsResponseFromJson(Map<String, dynamic> json) => NewsResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NewsResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsResponseToJson(NewsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };

NewsResponseData _$NewsResponseDataFromJson(Map<String, dynamic> json) =>
    NewsResponseData(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$NewsResponseDataToJson(NewsResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
    };

SearchFilterResponse _$SearchFilterResponseFromJson(
        Map<String, dynamic> json) =>
    SearchFilterResponse(
      success: json['success'] as bool?,
      count: (json['count'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SearchFilterData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchFilterResponseToJson(
        SearchFilterResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };

SearchFilterData _$SearchFilterDataFromJson(Map<String, dynamic> json) =>
    SearchFilterData(
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
      shareCode: json['share_code'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      shareUrl: json['share_url'] as String?,
    );

Map<String, dynamic> _$SearchFilterDataToJson(SearchFilterData instance) =>
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
      'share_code': instance.shareCode,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'share_url': instance.shareUrl,
    };

CalculateMarketValueRsponse _$CalculateMarketValueRsponseFromJson(
        Map<String, dynamic> json) =>
    CalculateMarketValueRsponse(
      json['status'] as String?,
      (json['estimated_value'] as num?)?.toInt(),
      json['currency'] as String?,
      json['details'] == null
          ? null
          : CalculateMarketValueRsponseData.fromJson(
              json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CalculateMarketValueRsponseToJson(
        CalculateMarketValueRsponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'estimated_value': instance.estimatedValue,
      'currency': instance.currency,
      'details': instance.details,
    };

CalculateMarketValueRsponseData _$CalculateMarketValueRsponseDataFromJson(
        Map<String, dynamic> json) =>
    CalculateMarketValueRsponseData(
      (json['base_price'] as num?)?.toInt(),
      (json['land_impact'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CalculateMarketValueRsponseDataToJson(
        CalculateMarketValueRsponseData instance) =>
    <String, dynamic>{
      'base_price': instance.basePrice,
      'land_impact': instance.landImpact,
    };

CalculateConstructionCostRsponse _$CalculateConstructionCostRsponseFromJson(
        Map<String, dynamic> json) =>
    CalculateConstructionCostRsponse(
      json['status'] as String?,
      (json['construction_estimate'] as num?)?.toInt(),
      json['currency'] as String?,
      json['breakdown'] == null
          ? null
          : CalculateConstructionCostRsponseData.fromJson(
              json['breakdown'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CalculateConstructionCostRsponseToJson(
        CalculateConstructionCostRsponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'construction_estimate': instance.constructionEstimate,
      'currency': instance.currency,
      'breakdown': instance.breakdown,
    };

CalculateConstructionCostRsponseData
    _$CalculateConstructionCostRsponseDataFromJson(Map<String, dynamic> json) =>
        CalculateConstructionCostRsponseData(
          (json['structure_and_finishing'] as num?)?.toInt(),
          (json['elevators'] as num?)?.toInt(),
          (json['basement_extra'] as num?)?.toInt(),
          (json['avg_cost_per_meter'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$CalculateConstructionCostRsponseDataToJson(
        CalculateConstructionCostRsponseData instance) =>
    <String, dynamic>{
      'structure_and_finishing': instance.structureAndFinishing,
      'elevators': instance.elevators,
      'basement_extra': instance.basementExtra,
      'avg_cost_per_meter': instance.avg_costPerMeter,
    };
