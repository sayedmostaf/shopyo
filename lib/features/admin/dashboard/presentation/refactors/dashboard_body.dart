import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/common/widgets/text_app.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/style/images/app_images.dart';
import 'package:shopyo/core/utils/app_strings.dart';
import 'package:shopyo/features/admin/dashboard/presentation/blocs/categories_number/categories_number_bloc.dart';
import 'package:shopyo/features/admin/dashboard/presentation/blocs/products_number/products_number_bloc.dart';
import 'package:shopyo/features/admin/dashboard/presentation/blocs/users_number/users_number_bloc.dart';
import 'package:shopyo/features/admin/dashboard/presentation/widgets/dashboard_container.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
      child: RefreshIndicator(
        child: ListView(
          children: [
            BlocBuilder<ProductsNumberBloc, ProductsNumberState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return DashboardContainer(
                      title: 'Products',
                      number: "",
                      image: AppImages.productsDrawer,
                      isLoading: true,
                    );
                  },
                  success: (productsNumber) {
                    return DashboardContainer(
                      title: 'Products',
                      number: productsNumber,
                      image: AppImages.productsDrawer,
                      isLoading: false,
                    );
                  },
                  error: (errorMessage) {
                    return TextApp(
                      text: errorMessage,
                      theme: context.textStyle.copyWith(
                        color: Colors.red,
                        fontSize: 16.sp,
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 20.h),
            BlocBuilder<CategoriesNumberBloc, CategoriesNumberState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return DashboardContainer(
                      title: 'Categories',
                      number: '',
                      image: AppImages.categoriesDrawer,
                      isLoading: true,
                    );
                  },
                  success: (categoriesNumber) {
                    debugPrint("category number" + categoriesNumber);
                    return DashboardContainer(
                      title: 'Categories',
                      number: categoriesNumber,
                      image: AppImages.categoriesDrawer,
                      isLoading: false,
                    );
                  },
                  error: (errorMessage) {
                    return TextApp(
                      text: errorMessage,
                      theme: context.textStyle.copyWith(
                        color: Colors.red,
                        fontSize: 16.sp,
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 20.h),
            BlocBuilder<UsersNumberBloc, UsersNumberState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return DashboardContainer(
                      title: 'Users',
                      number: '',
                      image: AppImages.usersDrawer,
                      isLoading: true,
                    );
                  },
                  success: (usersNumber) {
                    return DashboardContainer(
                      title: 'Users',
                      number: usersNumber,
                      image: AppImages.usersDrawer,
                      isLoading: false,
                    );
                  },
                  error: (errorMessage) {
                    return TextApp(
                      text: errorMessage,
                      theme: context.textStyle.copyWith(
                        color: Colors.red,
                        fontSize: 16.sp,
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
        onRefresh: () async {
          context.read<ProductsNumberBloc>().add(
            ProductsNumberEvent.getProductsNumber(),
          );
          context.read<CategoriesNumberBloc>().add(
            CategoriesNumberEvent.getCategoriesNumber(),
          );
          context.read<UsersNumberBloc>().add(
            UsersNumberEvent.getUsersNumber(),
          );
        },
      ),
    );
  }
}
