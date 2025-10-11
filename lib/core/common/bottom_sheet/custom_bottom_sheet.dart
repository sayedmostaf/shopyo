import 'package:flutter/material.dart';
import 'package:shopyo/core/style/colors/colors_dark.dart';

class CustomBottomSheet {
  CustomBottomSheet._();
  static void showModalBottomSheetContainer({
    required BuildContext context,
    required Widget widget,
    Color? backgroundColor,
    VoidCallback? whenComplete,
  }) => showModalBottomSheet<dynamic>(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    context: context,
    backgroundColor: backgroundColor ?? ColorsDark.blueDark,
    isScrollControlled: true,

    builder: (context) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(padding: EdgeInsets.all(16), child: widget),
        ),
      );
    },
  ).whenComplete(whenComplete ?? () {});
}
