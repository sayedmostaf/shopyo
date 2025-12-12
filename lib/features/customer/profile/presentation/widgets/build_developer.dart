import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopyo/core/app/env.variables.dart';
import 'package:shopyo/core/common/widgets/text_app.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/language/lang_keys.dart';
import 'package:shopyo/core/routes/app_routes.dart';
import 'package:shopyo/core/style/fonts/font_weight_helper.dart';
import 'package:shopyo/core/style/images/app_images.dart';

class BuildDeveloper extends StatelessWidget {
  const BuildDeveloper({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppImages.buildDeveloper,
          color: context.color.textColor,
        ),
        SizedBox(width: 10.w),
        TextApp(
          text: context.translate(LangKeys.buildDeveloper),
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
        Spacer(),
        InkWell(
          onTap: () {
            context.pushName(
              AppRoutes.webview,
              arguments: EnvVariable.instance.buildDeveloper,
            );
          },
          child: Row(
            children: [
              TextApp(
                text: 'Shopyo Store',
                theme: context.textStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeightHelper.regular,
                ),
              ),
              SizedBox(width: 5.w),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: context.color.textColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
