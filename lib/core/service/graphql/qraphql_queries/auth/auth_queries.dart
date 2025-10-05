import 'package:shopyo/features/auth/data/models/login_request_body.dart';

class AuthQueries {
  const AuthQueries._();
  factory AuthQueries() {
    return _instance;
  }
  static const AuthQueries _instance = AuthQueries._();

  Map<String, dynamic> loginMapQuery({required LoginRequestBody body}) {
    return {
      'query': r'''
        mutation Login($email: String!, $password: String!){
          login(email: $email, password: $password){
          access_token,
          refresh_token
          }
        }
''',
      'variables': {'email': body.email, 'password': body.password},
    };
  }
}
