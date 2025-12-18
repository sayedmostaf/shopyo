import 'package:flutter/material.dart';
import 'package:shopyo/core/extensions/context_extension.dart';

class CustomFavoriteButton extends StatelessWidget {
  const CustomFavoriteButton({
    required this.size,
    super.key,
    required this.isFavorites,
    required this.onTap,
  });
  final bool isFavorites;
  final double size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      icon: Icon(
        isFavorites ? Icons.favorite : Icons.favorite_outline,
        color: isFavorites
            ? context.color.bluePinkLight
            : context.color.textColor,
        size: size,
      ),
    );
  }
}
