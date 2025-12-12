import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/common/animations/animate_do.dart';
import 'package:shopyo/core/common/widgets/text_app.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/language/lang_keys.dart';
import 'package:shopyo/core/style/fonts/font_weight_helper.dart';
import 'package:shopyo/features/customer/profile/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:shopyo/features/customer/profile/presentation/widgets/build_developer.dart';
import 'package:shopyo/features/customer/profile/presentation/widgets/build_version.dart';
import 'package:shopyo/features/customer/profile/presentation/widgets/dark_mode_change.dart';
import 'package:shopyo/features/customer/profile/presentation/widgets/language_change.dart';
import 'package:shopyo/features/customer/profile/presentation/widgets/notifications_change.dart';
import 'package:shopyo/features/customer/profile/presentation/widgets/user_profile_info.dart';
import 'package:shopyo/features/customer/profile/presentation/widgets/user_profile_shimmer.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return state.when(
                    loading: UserProfileShimmer.new,
                    success: (userInfoData) =>
                        UserProfileInfo(userInfo: userInfoData),
                    error: Text.new,
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            CustomFadeInRight(
              duration: 400,
              child: TextApp(
                text: context.translate(LangKeys.applicationFeatures),
                theme: context.textStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ),
            SizedBox(height: 30.h),
            CustomFadeInRight(duration: 400, child: LanguageChange()),
            SizedBox(height: 20.h),
            CustomFadeInRight(duration: 400, child: DarkModeChange()),
            SizedBox(height: 20.h),
            CustomFadeInRight(duration: 400, child: BuildDeveloper()),
            SizedBox(height: 20.h),
            CustomFadeInRight(duration: 400, child: NotificationsChange()),
            SizedBox(height: 20.h),
            CustomFadeInRight(duration: 400, child: BuildVersion()),
          ],
        ),
      ),
    );
  }
}
