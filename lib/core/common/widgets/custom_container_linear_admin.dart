import 'package:flutter/material.dart';
import 'package:shopyo/core/style/colors/colors_dark.dart';

class CustomContainerLinearAdmin extends StatelessWidget {
  const CustomContainerLinearAdmin({
    super.key,
    required this.height,
    required this.width,
    required this.child,
  });
  final double height, width;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            ColorsDark.black1.withOpacity(0.8),
            ColorsDark.black2.withOpacity(0.8),
          ],
          begin: Alignment(0.36, 0.27),
          end: Alignment(0.58, 0.85),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorsDark.black1.withOpacity(0.3),
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
          BoxShadow(
            color: ColorsDark.black2.withOpacity(0.3),
            offset: Offset(0, 4),
            blurRadius: 2,
          ),
        ],
      ),
      child: child,
    );
  }
}
