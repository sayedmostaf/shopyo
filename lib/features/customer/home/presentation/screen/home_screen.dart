import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/common/animations/animate_do.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/features/customer/home/presentation/refactors/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollUp() {
    scrollController.animateTo(
      0,
      duration: Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HomeBody(scrollController: scrollController),
        CustomFadeInLeft(
          duration: 200,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: FloatingActionButton(
                onPressed: scrollUp,
                backgroundColor: context.color.bluePinkLight,
                child: Icon(Icons.arrow_upward, color: Colors.white, size: 30),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
