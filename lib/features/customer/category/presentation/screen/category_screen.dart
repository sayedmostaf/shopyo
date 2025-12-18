import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopyo/core/common/widgets/customer_app_bar.dart';
import 'package:shopyo/core/di/injection_container.dart';
import 'package:shopyo/features/customer/category/presentation/bloc/get_category_bloc/get_category_bloc.dart';
import 'package:shopyo/features/customer/category/presentation/refactors/category_body.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.categoryInfo});
  final ({String categoryName, int categoryId}) categoryInfo;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetCategoryBloc>()
        ..add(
          GetCategoryEvent.getCategory(categoryId: categoryInfo.categoryId),
        ),
      child: Scaffold(
        appBar: CustomerAppBar(title: categoryInfo.categoryName),
        body: CategoryBody(),
      ),
    );
  }
}
