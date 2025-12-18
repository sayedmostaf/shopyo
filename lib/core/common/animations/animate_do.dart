import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shopyo/core/service/shared_pref/pref_keys.dart';
import 'package:shopyo/core/service/shared_pref/shared_pref.dart';

class CustomFadeInDown extends StatelessWidget {
  const CustomFadeInDown({
    super.key,
    required this.duration,
    required this.child,
  });
  final int duration;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: Duration(milliseconds: duration),
      delay: Duration(milliseconds: 300),
      child: child,
    );
  }
}

class CustomFadeInUp extends StatelessWidget {
  const CustomFadeInUp({
    super.key,
    required this.duration,
    required this.child,
  });
  final int duration;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Duration(milliseconds: duration),
      delay: Duration(milliseconds: 300),
      child: child,
    );
  }
}

class CustomFadeInLeft extends StatelessWidget {
  const CustomFadeInLeft({
    super.key,
    required this.duration,
    required this.child,
  });
  final int duration;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SharedPref().getString(PrefKeys.language) == 'ar'
        ? FadeInLeft(
            duration: Duration(milliseconds: duration),
            delay: Duration(milliseconds: 300),
            child: child,
          )
        : FadeInRight(
            duration: Duration(milliseconds: duration),
            delay: Duration(milliseconds: 300),
            child: child,
          );
  }
}

class CustomFadeInRight extends StatelessWidget {
  const CustomFadeInRight({
    super.key,
    required this.duration,
    required this.child,
  });
  final int duration;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SharedPref().getString(PrefKeys.language) == 'ar'
        ? FadeInRight(
            delay: const Duration(milliseconds: 300),
            duration: Duration(milliseconds: duration),
            child: child,
          )
        : FadeInLeft(
            delay: const Duration(milliseconds: 300),
            duration: Duration(milliseconds: duration),
            child: child,
          );
  }
}
