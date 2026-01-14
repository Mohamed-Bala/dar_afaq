import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/helper/constants.dart';
import '../../../core/helper/shared_pref.dart';
import '../data/repository/home_repository.dart';
import '../data/requests/requests.dart';
import '../data/response/response.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;
  HomeCubit(this._homeRepository) : super(const HomeState.initial());
  List<AdsDataResponse?>? specializationsList = [];
  List<AuctionDataResponse?>? auctionResponseList = [];
  List<VipAdsDataResponse?>? vipAdsDataResponseList = [];

  void getAllAds() async {
    emit(const HomeState.allAdsLoading());
    final response = await _homeRepository.getSpecialization();
    response.when(
      success: (specializationsResponseModel) {
        specializationsList = specializationsResponseModel.allAds ?? [];
        emit(HomeState.allAdsSuccess(specializationsResponseModel));
      },
      failure: (errorHandler) {
        emit(HomeState.allAdsError(errorHandler));
      },
    );
  }

  Future<void> getAllAuction() async {
    if (auctionResponseList!.isNotEmpty) return;
    emit(const HomeState.auctionLoading());
    final response = await _homeRepository.getAuctionResponse();
    response.when(
      success: (auctionResponseModel) {
        auctionResponseList = auctionResponseModel.upcomingAuctions ?? [];
        emit(HomeState.auctionSuccess(auctionResponseModel));
      },
      failure: (errorHandler) {
        emit(HomeState.auctionError(errorHandler));
      },
    );
  }

  void getVipAds() async {
    emit(const HomeState.vipAdsLoading());
    final response = await _homeRepository.getHome();
    response.when(
      success: (homeResponse) {
        vipAdsDataResponseList = homeResponse.vipAds ?? [];
        emit(HomeState.vipAdsSuccess(homeResponse));
      },
      failure: (errorHandler) {
        emit(HomeState.vipAdsError(errorHandler));
      },
    );
  }
}

class AddAdvertisementCubit extends Cubit<AddAdvertisementState> {
  final AddAdvertisementRepository _addAdvertisementRepository;
  AddAdvertisementCubit(this._addAdvertisementRepository)
      : super(const AddAdvertisementState.initial());
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  File? selectedImage;
  final ImagePicker _picker = ImagePicker();
  String? selectedPropertyType;
  String? selectedRegion;
  String selectedPlanName = "الأساسية";
  int selectedPlanPrice = 100;
  String selectedTransactionType = '';

  void updateTransactionType(String type) {
    selectedTransactionType = type;
    emit(const AddAdvertisementState.initial());
  }

  final List<String> propertyTypes = [
    'بيت للبيع',
    'دور',
    'شقة مفروشة',
    ' شقة دوبلكس',
    ' محل للبيع',
    ' مخازن',
    ' مزرعة',
    ' قسيمة صناعية',
    ' استراحة',
    'شاليه',
    ' بيت للإيجار',
    '  دور للإيجار',
    ' شقة مفروشة للإيجار',
    ' شقة دوبلكس للإيجار',
    ' محل للإيجار',
    ' مخازن للإيجار',
    ' مزرعة للإيجار',
    ' قسيمة صناعية للإيجار',
    ' استراحة للإيجار',
    ' شاليه للإيجار',
    ' تبادل بيت',
    ' تبادل دور',
    ' تبادل شقة مفروشة',
    ' تبادل دوبلكس',
    ' عقارات في الإمارات',
    ' عقارات في السعودية',
    ' عقارات في قطر',
    ' مكاتب للإيجار',
    ' مكاتب مجهزة',
    ' مكاتب للاستثمار',
    ' إدارة عقارات سكنية',
    ' إدارة محلات تجارية',
    ' إدارة مخازن',
    ' خدمات البناء',
    ' خدمات التشطيب',
    ' استشارات هندسية',
    '  تصميم معماري',
    ' تصميم هندسي',
    ' إشراف ومتابعة'
  ];

  final List<String> regions = [
    // محافظة العاصمة
    ' الشرق',

    'القبلة',

    'الصالحية',

    'المرقاب',

    'بنيد القار',

    'الدسمة',

    'الدعية',

    'الشامية',

    'الروضة',

    'العديلية',

    'الخالدية',

    'القادسية',

    'المنصورية',

    'النزهة',

    'قرطبة',

    'اليرموك',

    'الصليبخات',

    'الدوحة',

    'غرناطة',

    // محافظة حولي

    'حولي',

    'السالمية',

    'البيان',

    'مشرف',

    'سلوى',

    'الرميثية',

    'الجابرية',

    'النقره',

    '  ميدان حولي',

    'الشعب',

    'الشهداء',

    // محافظة الفروانية
    'الفروانية',

    'خيطان',

    'الأندلس',

    'الرقعي',

    'العارضية',

    'العمرية',

    'الرابية',

    ' جليب الشيوخ',

    'اشبيلية',

    'السغر',

    // محافظة الأحمدي
    'الأحمدي', 'الفنطاس', 'العقيلة', 'الظهر', 'النويصب', 'الرقة', 'هدية',
    'أبو حليفة',
    'الصباحية', 'المنقف', 'الفحيحيل', 'الوفرة', 'الزور', 'الخيران',
    'الأحمدي الجديدة',
    ' الخيران ', 'جابر العلي', 'المقوع',
    ' أم الهيمان'

        // محافظة مبارك الكبير
    'مبارك الكبير',
    'صباح السالم',
    'المسيلة',
    'العدان',
    'القصور',
    'القرين',
    'أبو الحصانية',
    'أبو فطيرة', 'الفنيطيس', 'المسايل', 'صبحان',

    // محافظة الجهراء
    'الجهراء', 'الواحة', 'العيون', 'القصر', 'النسيم', 'تيماء', 'النعيم',
    'كبد',
    'المطلاع', 'كبد', 'الصليبية', 'العبدلي', 'أمغرة'
  ];

  void updatePropertyType(String value) {
    selectedPropertyType = value;
    emit(AddAdvertisementState.propertyTypeChanged(value));
  }

  void updateRegion(String value) {
    selectedRegion = value;
    emit(AddAdvertisementState.regionChanged(value));
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage = File(image.path);
      emit(const AddAdvertisementState.initial());
      emit(AddAdvertisementState.imagePicked(selectedImage!));
    }
  }

  void setPackageDetails(String name, int price) {
    selectedPlanName = name;
    selectedPlanPrice = price;
    emit(const AddAdvertisementState.initial());
  }

  void getAddAdvertisement() async {
    if (selectedImage == null) return;

    if (selectedPropertyType == null || selectedRegion == null) {
      // emit( const AddAdvertisementState.addAdvertisementError("يرجى اختيار النوع والمنطقة"));
      return;
    }
    final int userId = await SharedPrefHelper.getInt(SharedPrefKeys.userId);
    final String userPhone =
        await SharedPrefHelper.getString(SharedPrefKeys.userPhone);
    emit(const AddAdvertisementState.addAdvertisementLoading());
    List<int> imageBytes = await selectedImage!.readAsBytes();
    String base64Image = base64Encode(imageBytes);

    final response = await _addAdvertisementRepository.addAdvertisement(
      AddAdvertisementRequest(
        description: descriptionController.text,
        selectedPlanPrice: selectedPlanPrice,
        selectedPlanName: selectedPlanName,
        transactionType: selectedTransactionType,
        title: 'title',
        type: selectedPropertyType!,
        region: selectedRegion!,
        price: priceController.text,
        phone: userPhone,
        userId: userId,
        image: base64Image,
      ),
    );
    response.when(
      success: (addAdvertisementModel) {
        emit(AddAdvertisementState.addAdvertisementSuccess(
            addAdvertisementModel));
      },
      failure: (errorHandler) {
        emit(AddAdvertisementState.addAdvertisementError(errorHandler));
      },
    );
  }
}

// =================== ShowUserAdCubit =========================================
class ShowUserAdCubit extends Cubit<ShowUserAdsState> {
  final ShowUserAdRepository showUserAdRepository;
  ShowUserAdCubit(this.showUserAdRepository)
      : super(const ShowUserAdsState.initial());

  void emitGetUserAds() async {
    final int userId = await SharedPrefHelper.getInt(SharedPrefKeys.userId);
    emit(const ShowUserAdsState.showUserAdsLoading());

    final result = await showUserAdRepository.getUserAd(
      ShowUserAdRequest(
        userId: userId,
      ),
    );

    result.when(
      success: (showUserAdResponse) {
        print(showUserAdResponse.showUserAdvertisementData);
        emit(ShowUserAdsState.showUserAdsSuccess(showUserAdResponse));
      },
      failure: (apiError) {
        emit(ShowUserAdsState.showUserAdsError(apiError));
      },
    );
  }
}

// ========== NotificationsCubit ===============================================

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepository notificationsRepository;
  NotificationsCubit(this.notificationsRepository)
      : super(const NotificationsState.initial());

  void emitGetNotifications() async {
    emit(const NotificationsState.notificationsLoading());

    final result = await notificationsRepository.getNotifications();

    result.when(
      success: (notificationsResponse) {
        emit(NotificationsState.notificationsSuccess(notificationsResponse));
      },
      failure: (apiError) {
        emit(NotificationsState.notificationsError(apiError));
      },
    );
  }
}

// Delete Cubit ==========================================================

class DeleteAdCubit extends Cubit<DeleteState> {
  final DeleteAdRepository deleteAdRepository;
  DeleteAdCubit(this.deleteAdRepository) : super(const DeleteState.initial());

  void emitDeleteAds(int id) async {
    final int userId = await SharedPrefHelper.getInt(SharedPrefKeys.userId);
    emit(const DeleteState.deleteLoading());

    final result = await deleteAdRepository.deleteAd(
      DeleteAdRequest(
        userId: userId,
        id: id,
      ),
    );
    result.when(
      success: (deleteAdResponse) {
        print(deleteAdResponse.message);
        emit(DeleteState.deleteSuccess(deleteAdResponse));
      },
      failure: (apiError) {
        emit(DeleteState.deleteError(apiError));
      },
    );
  }
}

// Update Cubit=============================================================

class UpdateAdCubit extends Cubit<UpdateAdState> {
  final UpdateAdRepository updateAdRepository;

  UpdateAdCubit(this.updateAdRepository) : super(UpdateAdState.initial());
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // File? selectedImage;
  // final ImagePicker _picker = ImagePicker();
  String selectedPlanName = "الأساسية";

  // Future<void> pickImage() async {
  //   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     selectedImage = File(image.path);
  //     emit(UpdateAdState.initial());
  //     emit(UpdateAdState.updateAdImagePicked(selectedImage!));
  //   }
  // }

  void emitUpdateAd(
      {required int adId,
      required String selectedPlanName,
      required String transactionType,
      String? imageBase64}) async {
    final int userId = await SharedPrefHelper.getInt(SharedPrefKeys.userId);
    final String userPhone =
        await SharedPrefHelper.getString(SharedPrefKeys.userPhone);
    emit(UpdateAdState.updateAdLoading());

    final result = await updateAdRepository.updateAd(
      UpdateAdvertisementRequest(
        selectedPlanPrice: 100,
        selectedPlanName: selectedPlanName,
        transactionType: transactionType,
        title: '',
        description: descriptionController.text,
        type: typeController.text,
        region: regionController.text,
        price: priceController.text,
        phone: userPhone,
        userId: userId,
        id: adId,
        image: imageBase64 ?? "",
      ),
    );
    result.when(
      success: (response) => emit(UpdateAdState.updateAdSuccess(response)),
      failure: (apiError) => emit(UpdateAdState.updateAdError(apiError)),
    );
  }
}

class FilterCubit extends Cubit<FilterState> {
  final AdsSearchRepository adsSearchRepository;

  String? currentRegion;
  String? currentTransactionType;

  FilterCubit(this.adsSearchRepository) : super(FilterState.initial());

  Future<void> getAdsSearch({String? region, String? transactionType}) async {
    // 1. تحديث القيم المحفوظة (إذا تم تمرير قيم جديدة)
    if (region != null) currentRegion = region;
    if (transactionType != null) currentTransactionType = transactionType;

    emit(FilterState.filterLoading());

    final response = await adsSearchRepository.getAdsSearch(
      AdsSearchRequest(
        region: currentRegion,
        transactionType: currentTransactionType,
      ),
    );

    response.when(
      success: (data) => emit(FilterState.filterSuccess(data)),
      failure: (error) => emit(FilterState.filterError(error)),
    );
  }

  // دالة لمسح الفلاتر والبدء من جديد
  void clearFilters() {
    currentRegion = null;
    currentTransactionType = null;
    getAdsSearch(); // جلب كل البيانات بدون فلاتر
  }
}

//==============================================================================

class FilterSctionCubit extends Cubit<FilterSectionState> {
  final FilterSectionRepository filterSectionRepository;

  String? currentSection;
  String? currentType;

  FilterSctionCubit(this.filterSectionRepository)
      : super(FilterSectionState.initial());

  Future<void> getfilterSection({String? section, String? type}) async {
    if (section != null) currentSection = section;
    if (type != null) currentType = type;

    emit(FilterSectionState.filterSectionLoading());

    final response = await filterSectionRepository.getfilterSection(
      FilterSectionRequest(
        section: currentSection,
        type: currentType,
      ),
    );

    response.when(
      success: (data) => emit(FilterSectionState.filterSectionSuccess(data)),
      failure: (error) => emit(FilterSectionState.filterSectionError(error)),
    );
  }
}
