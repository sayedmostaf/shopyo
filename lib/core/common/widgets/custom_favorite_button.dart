import 'package:flutter/material.dart';
import 'package:shopyo/core/extensions/context_extension.dart';

class CustomFavoriteButton extends StatelessWidget {
  const CustomFavoriteButton({required this.size, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      padding: EdgeInsets.zero,
      icon: Icon(
        Icons.favorite_outline,
        color: context.color.textColor,
        size: size,
      ),
    );
  }
}
