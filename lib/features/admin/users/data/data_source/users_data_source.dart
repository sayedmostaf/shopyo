import 'package:shopyo/core/service/graphql/api_service.dart';
import 'package:shopyo/core/service/graphql/qraphql_queries/admin/users_queries.dart';
import 'package:shopyo/features/admin/users/data/models/get_all_users_response.dart';

class UsersDataSource {
  final ApiService _graphql;
  UsersDataSource(this._graphql);
  Future<GetAllUsersResponse> getAllUsers() async {
    final response = await _graphql.getAllUsers(
      UsersQueries().getAllUsersMapQuery(),
    );
    return response;
  }

  Future<void> deleteUser({required String userId}) async {
    final response = await _graphql.deleteUser(
      UsersQueries().deleteUserMapQuery(userId: userId),
    );
    return response;
  }
}
