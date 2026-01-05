import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';

// helper converter: convert any value to String?
String? _stringFromJson(dynamic value) => value?.toString();

@JsonSerializable()
class LoginResponse {
  @JsonKey(fromJson: _stringFromJson)
  String? message;
  @JsonKey(name: 'user')
  LoginData? loginData;
  @JsonKey(fromJson: _stringFromJson)
  String? token;

  LoginResponse({this.message, this.loginData, this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class LoginData {
  int? id;
  @JsonKey(name: 'name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(fromJson: _stringFromJson)
  String? email;
  @JsonKey(fromJson: _stringFromJson)
  String? phone;
  @JsonKey(name: 'user_type', fromJson: _stringFromJson)
  String? userType;
  @JsonKey(name: 'phone_type', fromJson: _stringFromJson)
  String? phoneType;

  LoginData(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.userType,
      this.phoneType});

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}
// Register

@JsonSerializable()
class RegisterResponse {
  @JsonKey(fromJson: _stringFromJson)
  String? message;
  @JsonKey(name: 'user')
  RegisterData? registerData;
  @JsonKey(fromJson: _stringFromJson)
  String? token;

  RegisterResponse({this.message, this.registerData, this.token});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

@JsonSerializable()
class RegisterData {
  @JsonKey(fromJson: _stringFromJson)
  String? id;
  @JsonKey(name: 'name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(fromJson: _stringFromJson)
  String? email;
  @JsonKey(fromJson: _stringFromJson)
  String? phone;

  RegisterData(
      {this.id, this.firstName, this.lastName, this.email, this.phone});

  factory RegisterData.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataFromJson(json);
}

// Send Code Response
@JsonSerializable()
class ResetPasswordResponse {
  String? message;

  ResetPasswordResponse({
    this.message,
  });

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);
}

@JsonSerializable()
class UserInfoResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "user")
  UserResponse? user;

  UserInfoResponse({this.status, this.user});

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$UserInfoResponseFromJson(json);
}

@JsonSerializable()
class UserResponse {
  int? id;
  String? name;
  String? email;
  String? phone;

  UserResponse({
    this.id,
    this.name,
    this.email,
    this.phone,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}

// Forgot Password Response
@JsonSerializable()
class ForgotPasswordResponse {
  String? message;

  ForgotPasswordResponse({
    this.message,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);
}

// // Verify Code Response
// @JsonSerializable()
// class VerifyCodeResponse {
//   String? message;

//   VerifyCodeResponse({
//     this.message,
//   });

//   factory VerifyCodeResponse.fromJson(Map<String, dynamic> json) =>
//       _$VerifyCodeResponseFromJson(json);
// }

// =========== Verify Code Forgot Response =====================================
@JsonSerializable()
class VerifyCodeResponse {
  String? message;

  VerifyCodeResponse({
    this.message,
  });

  factory VerifyCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeResponseFromJson(json);
}

// Update User Info

@JsonSerializable()
class UpdateUserInfoResponse {
  String? message;
  @JsonKey(name: "user")
  UpdateUserDataResponse? updateUserInfo;

  UpdateUserInfoResponse({this.message, this.updateUserInfo});

  factory UpdateUserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserInfoResponseFromJson(json);
}

@JsonSerializable()
class UpdateUserDataResponse {
  @JsonKey(name: "id")
  int? userId;
  @JsonKey(name: "name")
  String? firstName;
  @JsonKey(name: "last_name")
  String? lastName;
  String? email;
  String? phone;

  UpdateUserDataResponse({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  factory UpdateUserDataResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserDataResponseFromJson(json);
}
