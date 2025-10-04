import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/extensions/context_extension.dart';

class CustomLinearButton extends StatelessWidget {
  const CustomLinearButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
    this.height,
  });
  final VoidCallback onPressed;
  final Widget child;
  final double? width, height;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: context.color.bluePinkLight!.withOpacity(0.3),
      onTap: onPressed,
      child: Container(
        height: height ?? 44.h,
        width: width ?? 44.w,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          gradient: LinearGradient(
            begin: Alignment(0.46, -0.89),
            end: Alignment(-0.46, 0.89),
            colors: [context.color.bluePinkDark!, context.color.bluePinkLight!],
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}
