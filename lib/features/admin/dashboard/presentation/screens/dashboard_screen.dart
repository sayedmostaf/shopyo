import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopyo/core/common/widgets/admin_app_bar.dart';
import 'package:shopyo/core/di/injection_container.dart';
import 'package:shopyo/core/style/colors/colors_dark.dart';
import 'package:shopyo/features/admin/dashboard/presentation/blocs/categories_number/categories_number_bloc.dart';
import 'package:shopyo/features/admin/dashboard/presentation/blocs/products_number/products_number_bloc.dart';
import 'package:shopyo/features/admin/dashboard/presentation/blocs/users_number/users_number_bloc.dart';
import 'package:shopyo/features/admin/dashboard/presentation/refactors/dashboard_body.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<ProductsNumberBloc>()
                ..add(ProductsNumberEvent.getProductsNumber()),
        ),
        BlocProvider(
          create: (context) =>
              sl<CategoriesNumberBloc>()
                ..add(CategoriesNumberEvent.getCategoriesNumber()),
        ),
        BlocProvider(
          create: (context) =>
              sl<UsersNumberBloc>()..add(UsersNumberEvent.getUsersNumber()),
        ),
      ],
      child: Scaffold(
        backgroundColor: ColorsDark.mainColor,
        appBar: AdminAppBar(
          title: 'DashBoard',
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
        ),
        body: DashboardBody(),
      ),
    );
  }
}
