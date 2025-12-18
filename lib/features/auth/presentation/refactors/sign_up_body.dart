import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/common/animations/animate_do.dart';
import 'package:shopyo/core/common/widgets/text_app.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/language/lang_keys.dart';
import 'package:shopyo/core/routes/app_routes.dart';
import 'package:shopyo/features/auth/presentation/widgets/auth_title_info.dart';
import 'package:shopyo/features/auth/presentation/widgets/dark_and_lang_buttons.dart';
import 'package:shopyo/features/auth/presentation/widgets/sign_up/sign_up_button.dart';
import 'package:shopyo/features/auth/presentation/widgets/sign_up/sign_up_text_form.dart';
import 'package:shopyo/features/auth/presentation/widgets/sign_up/user_avatar_image.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            DarkAndLangButtons(),
            SizedBox(height: 30.h),
            AuthTitleInfo(
              title: context.translate(LangKeys.signUp),
              description: context.translate(LangKeys.signUpWelcome),
            ),
            SizedBox(height: 10.h),
            UserAvatarImage(),
            SizedBox(height: 20.h),
            SignUpTextForm(),
            SizedBox(height: 20.h),
            SignUpButton(),
            SizedBox(height: 20.h),
            CustomFadeInDown(
              duration: 400,
              child: TextButton(
                onPressed: () {
                  context.pushReplacementNamed(AppRoutes.login);
                },
                child: TextApp(
                  text: context.translate(LangKeys.youHaveAccount),
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: context.color.bluePinkLight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
