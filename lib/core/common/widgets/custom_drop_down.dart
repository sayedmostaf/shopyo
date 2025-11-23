import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/common/widgets/text_app.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/style/colors/colors_dark.dart';
import 'package:shopyo/core/style/fonts/font_family_helper.dart';
import 'package:shopyo/core/style/fonts/font_weight_helper.dart';

class CustomCreateDropDown extends StatelessWidget {
  const CustomCreateDropDown({
    super.key,
    required this.hintText,
    required this.items,
    required this.onChanged,
    required this.value,
  });
  final String hintText;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: ColorsDark.blueLight),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          iconSize: 30,
          borderRadius: BorderRadius.circular(12),
          dropdownColor: ColorsDark.blueDark,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeightHelper.medium,
            fontFamily: FontFamilyHelper.poppinsEnglish,
          ),
          elevation: 16,
          icon: Icon(Icons.expand_more, color: Colors.white),
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              onTap: () {},
              value: value,
              child: TextApp(
                text: value,
                theme: context.textStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          isExpanded: true,
          value: items.isNotEmpty ? value : null,
          hint: TextApp(
            text: hintText,
            theme: context.textStyle.copyWith(
              fontSize: 14.sp,
              color: Colors.white,
              fontFamily: FontFamilyHelper.poppinsEnglish,
            ),
          ),
        ),
      ),
    );
  }
}
