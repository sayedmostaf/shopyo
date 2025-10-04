import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopyo/core/common/screens/page_under_build_screen.dart';
import 'package:shopyo/core/routes/base_routes.dart';
import 'package:shopyo/features/auth/presentation/screens/login_screen.dart';
import 'package:shopyo/features/auth/presentation/screens/sign_up_screen.dart';

class AppRoutes {
  static const String login = 'login';
  static const String signUp = 'signUp';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case login:
        return BaseRoutes(page: LoginScreen());
        case signUp:
        return BaseRoutes(page: SignUpScreen());
      default:
        return BaseRoutes(page: PageUnderBuildScreen());
    }
  }
}
