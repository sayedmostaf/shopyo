import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/core/utils/app_strings.dart';
import 'package:shopyo/features/admin/users/data/data_source/users_data_source.dart';
import 'package:shopyo/features/admin/users/data/models/get_all_users_response.dart';

class UsersRepo {
  final UsersDataSource _dataSource;
  UsersRepo(this._dataSource);
  Future<ApiResult<GetAllUsersResponse>> getAllUsers() async {
    try {
      final response = await _dataSource.getAllUsers();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(errorMessage);
    }
  }
  Future<ApiResult<void>> deleteUser({required String userId}) async {
    try {
      final response = await _dataSource.deleteUser(userId: userId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(errorMessage);
    }
  }
}
