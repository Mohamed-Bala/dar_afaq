import '../../../../core/network/api_result.dart';
import '../../../../core/network/app_api.dart';
import '../../../../core/network/error_handler.dart';
import '../models/requests/requests.dart';
import '../models/response/response.dart';

class LoginRepository {
  final ApiService _apiService;

  LoginRepository(this._apiService);

  Future<ApiResult<LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      final response = await _apiService.login(loginRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

class RegisterRepository {
  final ApiService _apiService;

  RegisterRepository(this._apiService);

  Future<ApiResult<RegisterResponse>> register(
      RegisterRequest registerRequest) async {
    try {
      final response = await _apiService.register(registerRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

class ForgotPasswordRepository {
  final ApiService _apiService;

  ForgotPasswordRepository(this._apiService);

  Future<ApiResult<ForgotPasswordResponse>> forgotPassword(
      ForgotPasswordRequest forgotPasswordRequest) async {
    try {
      final response = await _apiService.forgotPassword(forgotPasswordRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

// // ===== VerifyCodeRepository
// class VerifyCodeRepository {
//   final ApiService _apiService;

//   VerifyCodeRepository(this._apiService);

//   Future<ApiResult<VerifyCodeResponse>> verifyCode(
//       VerifyCodeRequest verifyCodeRequest) async {
//     try {
//       final response = await _apiService.verifyCode(verifyCodeRequest);
//       return ApiResult.success(response);
//     } catch (error) {
//       return ApiResult.failure(ApiErrorHandler.handle(error));
//     }
//   }
// }

// ========= Verify Code Forgot Repository =====================================
class VerifyCodeRepository {
  final ApiService _apiService;

  VerifyCodeRepository(this._apiService);

  Future<ApiResult<VerifyCodeResponse>> verifyCode(
      VerifyCodeRequest verifyCodeRequest) async {
    try {
      final response = await _apiService.verifyCode(verifyCodeRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

class ResetPasswordRepository {
  final ApiService _apiService;

  ResetPasswordRepository(this._apiService);

  Future<ApiResult<ResetPasswordResponse>> resetPassword(
      ResetPasswordRequest resetPasswordRequest) async {
    try {
      final response = await _apiService.resetPassword(resetPasswordRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

class UserInfoRepository {
  final ApiService _apiService;

  UserInfoRepository(this._apiService);

  Future<ApiResult<UserInfoResponse>> userInfo(int userId) async {
    try {
      final response = await _apiService.getUserInfo(userId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

class UpdateUserInfoRepository {
  final ApiService _apiService;

  UpdateUserInfoRepository(this._apiService);

  Future<ApiResult<UpdateUserInfoResponse>> updateInfo(
    UpdateUserInfoRequest updateUserInfoRequest,
  ) async {
    try {
      final response = await _apiService.updateInfo(updateUserInfoRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
