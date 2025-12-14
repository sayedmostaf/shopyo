import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopyo/core/common/widgets/customer_app_bar.dart';
import 'package:shopyo/core/di/injection_container.dart';
import 'package:shopyo/features/customer/search/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:shopyo/features/customer/search/presentation/refactors/search_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchBloc>(),
      child: const Scaffold(
        appBar: CustomerAppBar(title: 'Search'),
        body: SearchBody(),
      ),
    );
  }
}
