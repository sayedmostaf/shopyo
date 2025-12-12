import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopyo/core/app/app_cubit/app_cubit.dart';
import 'package:shopyo/core/common/widgets/text_app.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/language/lang_keys.dart';
import 'package:shopyo/core/style/fonts/font_weight_helper.dart';
import 'package:shopyo/core/style/images/app_images.dart';

class DarkModeChange extends StatelessWidget {
  const DarkModeChange({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return Row(
      children: [
        SvgPicture.asset(AppImages.darkMode, color: context.color.textColor),
        SizedBox(width: 10.w),
        TextApp(
          text: context.translate(LangKeys.darkMode),
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
        Spacer(),
        Transform.scale(
          scale: 0.75,
          child: Switch.adaptive(
            value: cubit.isDark,
            inactiveTrackColor: Color(0xff262626),
            activeColor: Colors.green,
            onChanged: (value) {
              cubit.changeAppThemeMode();
            },
          ),
        ),
      ],
    );
  }
}
