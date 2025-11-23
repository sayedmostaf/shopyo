import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopyo/core/common/widgets/admin_app_bar.dart';
import 'package:shopyo/core/di/injection_container.dart';
import 'package:shopyo/core/style/colors/colors_dark.dart';
import 'package:shopyo/features/admin/add_products/presentation/blocs/get_all_admin_product/get_all_admin_product_bloc.dart';
import 'package:shopyo/features/admin/add_products/presentation/refactors/add_products_body.dart';

class AddProductsScreen extends StatelessWidget {
  const AddProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GetAllAdminProductBloc>()
            ..add(GetAllAdminProductEvent.getAllProducts(isNotLoading: true)),
        ),
      ],
      child: Scaffold(
        backgroundColor: ColorsDark.mainColor,
        appBar: AdminAppBar(
          title: 'Products',
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
        ),
        body: AddProductsBody(),
      ),
    );
  }
}
