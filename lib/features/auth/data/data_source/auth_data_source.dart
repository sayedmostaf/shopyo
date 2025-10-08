import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shopyo/core/service/graphql/api_service.dart';
import 'package:shopyo/core/service/graphql/qraphql_queries/auth/auth_queries.dart';
import 'package:shopyo/features/auth/data/models/login_request_body.dart';
import 'package:shopyo/features/auth/data/models/login_response.dart';
import 'package:shopyo/features/auth/data/models/sign_up_request_body.dart';
import 'package:shopyo/features/auth/data/models/sign_up_response.dart';
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

  Future<UserRoleResponse> userRole(String token) async {
    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    final client = ApiService(dio);
    final response = await client.userRole();
    debugPrint('User Role => ${response.userRole}');
    return response;
  }

  Future<SignUpResponse> signUp({required SignUpRequestBody body}) async {
    final response = await _graphql.signUp(AuthQueries().signUpMapQuery(body: body));
    return response;
  }
}
