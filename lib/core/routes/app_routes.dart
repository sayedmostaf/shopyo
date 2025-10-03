import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopyo/core/common/screens/page_under_build_screen.dart';
import 'package:shopyo/core/routes/base_routes.dart';
import 'package:shopyo/test_one_screen.dart';
import 'package:shopyo/test_two_screen.dart';

class AppRoutes {
  static const String testOne = 'testOne';
  static const String testTwo = 'testTwo';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case testOne:
        return BaseRoutes(page: TestOneScreen());
      case testTwo:
        return BaseRoutes(page: TestTwoScreen()); 
      default:
        return BaseRoutes(page: PageUnderBuildScreen());
    }
  }
}
