// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      phone: json['phone'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'password': instance.password,
    };

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      firstName: json['name'] as String,
      lastName: json['last_name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'name': instance.firstName,
      'last_name': instance.lastName,
      'phone': instance.phone,
      'email': instance.email,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
    };

ResetPasswordRequest _$ResetPasswordRequestFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
    );

Map<String, dynamic> _$ResetPasswordRequestToJson(
        ResetPasswordRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
    };

ForgotPasswordRequest _$ForgotPasswordRequestFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordRequest(
      type: json['type'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$ForgotPasswordRequestToJson(
        ForgotPasswordRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'email': instance.email,
    };

UpdateUserInfoRequest _$UpdateUserInfoRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateUserInfoRequest(
      userId: (json['user_id'] as num).toInt(),
      phone: json['phone'] as String,
      firstName: json['name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UpdateUserInfoRequestToJson(
        UpdateUserInfoRequest instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.firstName,
      'last_name': instance.lastName,
      'phone': instance.phone,
      'email': instance.email,
      'password': instance.password,
    };

VerifyCodeRequest _$VerifyCodeRequestFromJson(Map<String, dynamic> json) =>
    VerifyCodeRequest(
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$VerifyCodeRequestToJson(VerifyCodeRequest instance) =>
    <String, dynamic>{
      'code': instance.code,
    };

VerifyCodeRegisterRequest _$VerifyCodeRegisterRequestFromJson(
        Map<String, dynamic> json) =>
    VerifyCodeRegisterRequest(
      code: json['code'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$VerifyCodeRegisterRequestToJson(
        VerifyCodeRegisterRequest instance) =>
    <String, dynamic>{
      'code': instance.code,
      'phone': instance.phone,
    };
