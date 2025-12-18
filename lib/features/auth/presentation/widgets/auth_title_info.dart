import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/common/animations/animate_do.dart';
import 'package:shopyo/core/common/widgets/text_app.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/style/fonts/font_weight_helper.dart';

class AuthTitleInfo extends StatelessWidget {
  const AuthTitleInfo({
    super.key,
    required this.title,
    required this.description,
  });
  final String title, description;
  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 400,
      child: Column(
        children: [
          TextApp(
            text: title,
            theme: context.textStyle.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeightHelper.bold,
              color: context.color.textColor,
            ),
          ),
          SizedBox(height: 10.h),
          TextApp(
            text: description,
            theme: context.textStyle.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeightHelper.medium,
              color: context.color.textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
