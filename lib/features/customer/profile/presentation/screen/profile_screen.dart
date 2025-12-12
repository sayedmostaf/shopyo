import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopyo/core/di/injection_container.dart';
import 'package:shopyo/features/customer/profile/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:shopyo/features/customer/profile/presentation/refactors/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileBloc>()..add(ProfileEvent.getUserInfo()),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ProfileBody(),
      ),
    );
  }
}
