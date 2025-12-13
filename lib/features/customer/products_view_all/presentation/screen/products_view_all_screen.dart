import 'package:flutter/material.dart';
import 'package:shopyo/core/common/widgets/customer_app_bar.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/language/lang_keys.dart';

class ProductsViewAllScreen extends StatelessWidget {
  const ProductsViewAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerAppBar(title: context.translate(LangKeys.viewAll)),
    );
  }
}
