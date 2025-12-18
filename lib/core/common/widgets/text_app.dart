import 'package:flutter/material.dart';

class TextApp extends StatelessWidget {
  const TextApp({
    super.key,
    required this.text,
    required this.theme,
    this.maxLines,
    this.softWrap,
    this.textOverflow,
    this.textAlign,
  });
  final String text;
  final TextStyle theme;
  final int? maxLines;
  final bool? softWrap;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: theme,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: textOverflow,
      textAlign: textAlign,
    );
  }
}
