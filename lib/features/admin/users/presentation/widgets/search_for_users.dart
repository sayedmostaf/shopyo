import 'package:flutter/material.dart';
import 'package:shopyo/core/common/widgets/custom_text_field.dart';
import 'package:shopyo/core/style/colors/colors_dark.dart';

class SearchForUsers extends StatelessWidget {
  const SearchForUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: TextEditingController(),
      keyboardType: TextInputType.emailAddress,
      hintText: 'Search for users',
      onChanged: (value) {},
      suffixIcon: IconButton(
        onPressed: () {},
        icon: Icon(Icons.clear, color: ColorsDark.blueLight),
      ),
    );
  }
}
