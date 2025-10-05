import 'package:dio/dio.dart';
import 'package:shopyo/core/service/graphql/api_service.dart';
import 'package:shopyo/core/service/graphql/qraphql_queries/auth/auth_queries.dart';
import 'package:shopyo/features/auth/data/models/login_request_body.dart';
import 'package:shopyo/features/auth/data/models/login_response.dart';
import 'package:shopyo/features/auth/data/models/user_role_response.dart';

class AuthDataSource {
  const AuthDataSource(this._graphql);
  final ApiService _graphql;

  Future<LoginResponse> login({required LoginRequestBody body}) async {
    final response = await _graphql.login(
      AuthQueries().loginMapQuery(body: body),
    );
    return response;
  }

  Future<UserRoleResponse> userRole() async {
    final response = await _graphql.userRole();
    return response;
  }
}
