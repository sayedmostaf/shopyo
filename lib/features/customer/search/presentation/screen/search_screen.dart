import 'package:flutter/material.dart';
import 'package:shopyo/core/common/widgets/customer_app_bar.dart';
import 'package:shopyo/features/customer/search/presentation/refactors/search_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerAppBar(title: 'Search'),
      body: SearchBody(),
    );
  }
}
