import 'package:afaq_real_estate/core/di/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/helper/spacing.dart';
import '../../core/resources/color_manager.dart';
import '../../core/resources/strings_manager.dart';
import '../../core/resources/styles_manager.dart';
import '../../core/widgets/app_text_button.dart';
import '../../core/widgets/app_text_form_field.dart';
import '../dashboard/logic/home_cubit.dart';
import '../dashboard/logic/home_state.dart';
import 'widget/search_blocBuilder.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di<SearchFilterCubit>(),
        ),
        BlocProvider(
          create: (context) => di<AddAdvertisementCubit>()
            ..getPropertyTypes()
            ..getRegions(),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Transaction Type
                Text(
                  "transaction type",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                verticalSpace(10),
                AppTextFormField(
                  hintText: "عقارات للبيع",
                  controller: context.read<SearchFilterCubit>().transactionType,
                  validator: (String) {},
                ),
                verticalSpace(10),

                /// ================= Property Types =================
                Text(
                  AppStrings.propertyType.tr(),
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                verticalSpace(10),
                BlocBuilder<AddAdvertisementCubit, AddAdvertisementState>(
                  builder: (context, state) {
                    final cubit = context.read<AddAdvertisementCubit>();

                    if (state is PropertyTypesLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => _showPropertyTypesDialog(context, cubit),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 15.h),
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorManager.lightGrey),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    cubit.selectedPropertyTypes.isEmpty
                                        ? AppStrings.none
                                            .tr() // "اختر نوع العقار"
                                        : cubit.selectedPropertyTypes.join(
                                            ', '), // يعرض العناصر المختارة مفصولة بفاصلة
                                    style: StylesManager.font14Grey,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Icon(Icons.arrow_drop_down,
                                    color: ColorManager.primary),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),

                /// ================= Regions =================
                verticalSpace(10),

                Text(
                  AppStrings.region.tr(),
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                verticalSpace(10),
                BlocBuilder<AddAdvertisementCubit, AddAdvertisementState>(
                  builder: (context, state) {
                    final cubit = context.read<AddAdvertisementCubit>();

                    if (state is RegionsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(8),
                        InkWell(
                          onTap: () => _showRegionsDialog(context, cubit),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 15.h),
                            decoration: BoxDecoration(
                              color: ColorManager.white,
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(color: ColorManager.lightGrey),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    cubit.selectedRegions.isEmpty
                                        ? AppStrings.none.tr() // "اختر المناطق"
                                        : cubit.selectedRegions
                                            .join(', '), // عرض المناطق المختارة
                                    style: StylesManager.font14Grey,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const Icon(Icons.location_on_outlined,
                                    color:
                                        Colors.green), // أيقونة موقع بلون أخضر
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),

                /// ================= Price =================
                verticalSpace(10),

                Text(
                  AppStrings.price.tr(),
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                AppTextFormField(
                  hintText: AppStrings.priceHint.tr(),
                  keyboardType: TextInputType.number,
                  controller: context.read<SearchFilterCubit>().priceRange,
                  validator: (String) {},
                ),

                verticalSpace(20),

                /// ================= Button =================
                BlocBuilder<SearchFilterCubit, SearchFilterState>(
                  builder: (context, state) {
                    final isLoading = state is SearchFilterLoading;

                    return SizedBox(
                      width: double.infinity,
                      child: AppTextButton(
                        buttonText: isLoading ? "جاري البحث..." : "بحث",
                        textStyle: StylesManager.font16White,
                        onPressed: isLoading
                            ? null
                            : () {
                                final addCubit =
                                    context.read<AddAdvertisementCubit>();
                                final searchCubit =
                                    context.read<SearchFilterCubit>();

                                // التحقق من وجود مدخلات (اختياري حسب رغبتك)
                                searchCubit.getSearchFilter(
                                  // تصحيح الخطأ الإملائي في شرط القائمة
                                  addCubit.selectedPropertyTypes.isEmpty
                                      ? null
                                      : addCubit.selectedPropertyTypes,

                                  (addCubit.selectedRegions.isEmpty
                                      ? null
                                      : addCubit.selectedRegions),
                                  (searchCubit.transactionType.text.isEmpty
                                      ? null
                                      : searchCubit.transactionType.text),

                                  searchCubit.priceRange.text.isEmpty
                                      ? null
                                      : searchCubit.priceRange.text,
                                );
                                ;
                              },
                      ),
                    );
                  },
                ),

                /// ================= Results =================
                SingleChildScrollView(
                  
                  child: SearchBlocbuilder()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showPropertyTypesDialog(
      BuildContext context, AddAdvertisementCubit cubit) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text(AppStrings.propertyType.tr(),
                  textAlign: TextAlign.right),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cubit.propertyTypes.length,
                  itemBuilder: (context, index) {
                    final type = cubit.propertyTypes[index];
                    final isSelected =
                        cubit.selectedPropertyTypes.contains(type);

                    return CheckboxListTile(
                      title: Text(type),
                      value: isSelected,
                      activeColor: ColorManager.primary,
                      onChanged: (bool? value) {
                        cubit.togglePropertyType(type);
                        // لتحديث شكل الـ Dialog فوراً
                        setDialogState(() {});
                        // لتحديث النص في الشاشة الرئيسية خلف الـ Dialog
                        setState(() {});
                      },
                    );
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("تم"), // "تم"
                ),
              ],
            );
          },
        );
      },
    );
  }

  //============================================================================
  void _showRegionsDialog(BuildContext context, AddAdvertisementCubit cubit) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text(
                AppStrings.geographicLocation.tr(),
                textAlign: TextAlign.right,
                style: StylesManager.font18BlackBold,
              ),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: cubit.regions.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final region = cubit.regions[index];
                    final isSelected = cubit.selectedRegions.contains(region);

                    return CheckboxListTile(
                      title: Text(region, style: StylesManager.font14Grey),
                      value: isSelected,
                      activeColor: ColorManager
                          .primary, // لون التحديد أخضر كما في طلبك الأصلي
                      onChanged: (bool? value) {
                        cubit.toggleRegion(region); // دالة التبديل في الـ Cubit
                        setDialogState(
                            () {}); // لتحديث الـ Checkbox داخل الـ Dialog
                        setState(
                            () {}); // لتحديث النص الظاهر في الصفحة الرئيسية
                      },
                    );
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child:
                      Text("تم", style: const TextStyle(color: Colors.green)),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
