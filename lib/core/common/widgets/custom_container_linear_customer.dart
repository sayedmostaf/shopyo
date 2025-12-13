import 'package:flutter/material.dart';
import 'package:shopyo/core/extensions/context_extension.dart';

class CustomContainerLinearCustomer extends StatelessWidget {
  const CustomContainerLinearCustomer({
    super.key,
    required this.width,
    required this.height,
    required this.child,
  });
  final double width, height;
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
            context.color.containerLinear1!.withOpacity(0.8),
            context.color.containerLinear2!.withOpacity(0.8),
          ],
          begin: Alignment(0.36, 0.27),
          end: Alignment(0.58, 0.85),
        ),
        boxShadow: [
          BoxShadow(
            color: context.color.containerLinear1!.withOpacity(0.3),
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
          BoxShadow(
            color: context.color.containerLinear2!.withOpacity(0.3),
            offset: Offset(0, 4),
            blurRadius: 2,
          ),
        ],
      ),
      child: child,
    );
  }
}
