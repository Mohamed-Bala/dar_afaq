import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/network/api_error_model.dart';
import '../data/response/response.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.allAdsLoading() = AllAdsLoading;
  const factory HomeState.allAdsSuccess(AdsResponse adsResponse) =
      AllAdsSuccess;
  const factory HomeState.allAdsError(ApiErrorModel apiErrorModel) =
      AllAdsError;

  const factory HomeState.auctionLoading() = AuctionLoading;
  const factory HomeState.auctionSuccess(AuctionResponse auctionResponse) =
      AuctionSuccess;
  const factory HomeState.auctionError(ApiErrorModel apiErrorModel) =
      AuctionError;

  const factory HomeState.vipAdsLoading() = VipAdsLoading;
  const factory HomeState.vipAdsSuccess(HomeResponse homeResponse) =
      VipAdsSuccess;
  const factory HomeState.vipAdsError(ApiErrorModel apiErrorModel) =
      VipAdsError;
}

@freezed
class AddAdvertisementState with _$AddAdvertisementState {
  const factory AddAdvertisementState.initial() = _AddAdvertisementInitial;

  const factory AddAdvertisementState.addAdvertisementLoading() =
      AddAdvertisementLoading;
  const factory AddAdvertisementState.addAdvertisementSuccess(
          AddAdvertisementResponse addAdvertisementResponse) =
      AddAdvertisementSuccess;
  const factory AddAdvertisementState.addAdvertisementError(
      ApiErrorModel apiErrorModel) = AddAdvertisementError;

  const factory AddAdvertisementState.imagePicked(File image) = ImagePicked;

  const factory AddAdvertisementState.propertyTypeChanged(String type) =
      PropertyTypeChanged;
  const factory AddAdvertisementState.regionChanged(String region) =
      RegionChanged;
  // داخل ملف الـ State
  const factory AddAdvertisementState.transactionTypeChanged(String type) =
      TransactionTypeChanged;
}

@freezed
class ShowUserAdsState with _$ShowUserAdsState {
  const factory ShowUserAdsState.initial() = _ShowUserAdsInitial;

  // حالات جلب إعلانات المستخدم الخاص (My Ads)
  const factory ShowUserAdsState.showUserAdsLoading() = ShowUserAdsLoading;
  const factory ShowUserAdsState.showUserAdsSuccess(
      ShowUserAdResponse showUserAdResponse) = ShowUserAdsSuccess;
  const factory ShowUserAdsState.showUserAdsError(ApiErrorModel apiErrorModel) =
      ShowUserAdsError;

  // // حالات جلب تفاصيل إعلان محدد (Ad Details)
  // const factory UserAdsState.adDetailsLoading() = AdDetailsLoading;
  // const factory UserAdsState.adDetailsSuccess(ShowAdResponse showAdResponse) = AdDetailsSuccess;
  // const factory UserAdsState.adDetailsError(ApiErrorModel apiErrorModel) = AdDetailsError;
}

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initial() = _NotificationsInitial;
  const factory NotificationsState.notificationsLoading() =
      NotificationssLoading;
  const factory NotificationsState.notificationsSuccess(
      NotificationsResponse notificationsResponse) = NotificationsSuccess;
  const factory NotificationsState.notificationsError(
      ApiErrorModel apiErrorModel) = NotificationsError;
}

//======== Delete Ad State =====================================================
@freezed
class DeleteState with _$DeleteState {
  const factory DeleteState.initial() = _DeleteStateInitial;
  const factory DeleteState.deleteLoading() = DeleteLoading;
  const factory DeleteState.deleteSuccess(DeleteAdResponse deleteAdResponse) =
      DeleteSuccess;
  const factory DeleteState.deleteError(ApiErrorModel apiErrorModel) =
      DeleteError;
}

//======= Update Ad State ======================================================

@freezed
class UpdateAdState with _$UpdateAdState {
  const factory UpdateAdState.initial() = _UpdateAdInitial;
  const factory UpdateAdState.updateAdLoading() = UpdateAdLoading;
  const factory UpdateAdState.updateAdSuccess(UpdateAdResponse updateAdResponse) =
      UpdateAdSuccess;
  const factory UpdateAdState.updateAdError(ApiErrorModel apiErrorModel) =
      UpdateAdStateError;

      const factory UpdateAdState.updateAdImagePicked(File image) = UpdateAdImagePicked;
}
