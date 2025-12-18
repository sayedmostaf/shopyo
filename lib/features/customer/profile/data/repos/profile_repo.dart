import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/core/utils/app_strings.dart';
import 'package:shopyo/features/auth/data/models/user_role_response.dart';
import 'package:shopyo/features/customer/profile/data/data_source/profile_data_source.dart';

class ProfileRepo {
  final ProfileDataSource _dataSource;
  ProfileRepo(this._dataSource);
  Future<ApiResult<UserRoleResponse>> getUserProfile() async {
    try {
      final response = await _dataSource.getUserInfo();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(errorMessage);
    }
  }
}
