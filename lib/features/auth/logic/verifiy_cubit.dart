// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'verifiy_state.dart';
// //part 'verifiy_cubit.freezed.dart';

// // class VerifiyCubit extends Cubit<VerifiyState> {
// //   VerifiyCubit() : super(VerifiyState.initial());
// // }

// // ملف: forgot_password_cubit.dart

// // استيراد ملف الحالة
// // ... (افترض وجود ApiService لإرسال الطلب)

// class VerifiyCubit extends Cubit<VerifiyState> {
//   // 1. التهيئة بالحالة الافتراضية
//   VerifiyCubit() : super(const VerifiyState());

//   // 2. دالة تخزين رقم الهاتف المُمرَّر (ما يعادل الحدث "Loaded")
//   void setPhoneNumber(String phoneNumber) {
//     // نستخدم emit لتحديث الحالة الجديدة التي تحتوي على رقم الهاتف
//     emit(state.copyWith(phoneNumber: phoneNumber));
//   }

//   // 3. دالة معالجة الإرسال (ما يعادل الحدث "Submitted")
//   Future<void> submitForgotPassword(String email) async {
//     // 3.1 تحديث الحالة: حفظ الإيميل وبدء التحميل
//     emit(state.copyWith(email: email, isLoading: true, error: null));

//     if (state.phoneNumber.isEmpty) {
//       emit(state.copyWith(
//         isLoading: false,
//         error: 'رقم الهاتف مفقود. الرجاء العودة إلى شاشة تسجيل الدخول.',
//       ));
//       return;
//     }

//     try {
//       // 3.2 إرسال الطلب إلى الـ API باستخدام كلتا القيمتين المخزنتين في الحالة
//       // ----------------------------------------------------
//       // final response = await apiService.recoverPassword(
//       //   email: state.email,       // الإيميل من الحالة
//       //   phone: state.phoneNumber, // رقم الهاتف المخزن
//       // );
//       // (محاكاة لرد API)
//       await Future.delayed(const Duration(seconds: 2));

//       // 3.3 معالجة النجاح
//       emit(state.copyWith(isLoading: false));
//       // ... (يمكنك إضافة منطق لإظهار رسالة نجاح هنا)
//     } catch (e) {
//       // 3.4 معالجة الخطأ
//       emit(state.copyWith(isLoading: false, error: e.toString()));
//     }
//   }
// }
