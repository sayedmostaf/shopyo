import 'package:shopyo/core/language/lang_keys.dart';
import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/core/utils/app_strings.dart';
import 'package:shopyo/features/auth/data/data_source/auth_data_source.dart';
import 'package:shopyo/features/auth/data/models/login_request_body.dart';
import 'package:shopyo/features/auth/data/models/login_response.dart';
import 'package:shopyo/features/auth/data/models/sign_up_request_body.dart';
import 'package:shopyo/features/auth/data/models/sign_up_response.dart';
import 'package:shopyo/features/auth/data/models/user_role_response.dart';

class AuthRepo {
  final AuthDataSource _dataSource;
  const AuthRepo(this._dataSource);

  Future<ApiResult<LoginResponse>> login(LoginRequestBody body) async {
    try {
      final response = await _dataSource.login(body: body);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(LangKeys.loggedError);
    }
  }

  Future<UserRoleResponse> userRole(String token) async {
    final response = await _dataSource.userRole(token);
    return response;
  }

  Future<ApiResult<SignUpResponse>> signUp(SignUpRequestBody body) async {
    try {
      final response = await _dataSource.signUp(body: body);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(LangKeys.loggedError);
    }
  }
}
