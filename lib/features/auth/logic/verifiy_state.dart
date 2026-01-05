// part of 'verifiy_cubit.dart';

// @freezed
// // ملف: forgot_password_state.dart

// class VerifiyState extends Equatable {
//   final String phoneNumber; // رقم الهاتف المُمرَّر
//   final String email;       // الإيميل المُدخل
//   final bool isLoading;
//   final String? error;

//   const VerifiyState({
//     this.phoneNumber = '', 
//     this.email = '',
//     this.isLoading = false,
//     this.error,
//   });

//   VerifiyState copyWith({
//     String? phoneNumber,
//     String? email,
//     bool? isLoading,
//     String? error,
//   }) {
//     return VerifiyState(
//       phoneNumber: phoneNumber ?? this.phoneNumber,
//       email: email ?? this.email,
//       isLoading: isLoading ?? this.isLoading,
//       error: error, // قد يكون null في حالة النجاح
//     );
//   }

//   @override
//   List<Object?> get props => [phoneNumber, email, isLoading, error];
// }
