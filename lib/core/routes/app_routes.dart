import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopyo/core/common/screens/page_under_build_screen.dart';
import 'package:shopyo/core/di/injection_container.dart';
import 'package:shopyo/core/routes/base_routes.dart';
import 'package:shopyo/features/admin/home_admin.dart';
import 'package:shopyo/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:shopyo/features/auth/presentation/screens/login_screen.dart';
import 'package:shopyo/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:shopyo/features/customer/home_customer.dart';

class AppRoutes {
  static const String login = 'login';
  static const String signUp = 'signUp';
  static const String homeAdmin = 'homeAdmin';
  static const String homeCustomer = 'homeCustomer';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case login:
        return BaseRoutes(
          page: BlocProvider(
            create: (context) => sl<AuthBloc>(),
            child: LoginScreen(),
          ),
        );
      case signUp:
        return BaseRoutes(page: SignUpScreen());
      case homeAdmin:
        return BaseRoutes(page: HomeAdminScreen());
      case homeCustomer:
        return BaseRoutes(page: HomeCustomerScreen());
      default:
        return BaseRoutes(page: PageUnderBuildScreen());
    }
  }
}
