import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/features/customer/profile/presentation/bloc/profile_bloc/profile_bloc.dart';
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
          ],
        ),
      ),
    );
  }
}
