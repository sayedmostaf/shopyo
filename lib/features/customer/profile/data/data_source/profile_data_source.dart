import 'package:shopyo/core/service/graphql/api_service.dart';
import 'package:shopyo/features/auth/data/models/user_role_response.dart';

class ProfileDataSource {
  final ApiService _api;
  ProfileDataSource(this._api);
  Future<UserRoleResponse> getUserInfo() async {
    final response = await _api.userRole();
    return response;
  }
}
