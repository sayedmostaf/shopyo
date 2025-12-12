import 'package:flutter/material.dart';
import 'package:shopyo/features/customer/profile/presentation/refactors/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ProfileBody(),
    );
  }
}
