import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:shopyo/core/app/app_cubit/app_cubit.dart';
import 'package:shopyo/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:shopyo/core/app/upload_image/data_source/upload_image_data_source.dart';
import 'package:shopyo/core/app/upload_image/repo/upload_image_repo.dart';
import 'package:shopyo/core/service/graphql/api_service.dart';
import 'package:shopyo/core/service/graphql/dio_factory.dart';
import 'package:shopyo/features/admin/add_categories/data/data_source/categories_admin_data_source.dart';
import 'package:shopyo/features/admin/add_categories/data/repos/categories_admin_repo.dart';
import 'package:shopyo/features/admin/add_categories/presentation/blocs/create_category/create_category_bloc.dart';
import 'package:shopyo/features/admin/add_categories/presentation/blocs/delete_category/delete_category_bloc.dart';
import 'package:shopyo/features/admin/add_categories/presentation/blocs/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:shopyo/features/admin/add_categories/presentation/blocs/update_category/update_category_bloc.dart';
import 'package:shopyo/features/admin/add_products/data/data_source/products_admin_data_source.dart';
import 'package:shopyo/features/admin/add_products/data/repos/products_admin_repo.dart';
import 'package:shopyo/features/admin/add_products/presentation/blocs/create_product/create_product_bloc.dart';
import 'package:shopyo/features/admin/add_products/presentation/blocs/delete_product/delete_product_bloc.dart';
import 'package:shopyo/features/admin/add_products/presentation/blocs/get_all_admin_product/get_all_admin_product_bloc.dart';
import 'package:shopyo/features/admin/dashboard/data/data_source/dashboard_data_source.dart';
import 'package:shopyo/features/admin/dashboard/data/repos/dashboard_repo.dart';
import 'package:shopyo/features/admin/dashboard/presentation/blocs/categories_number/categories_number_bloc.dart';
import 'package:shopyo/features/admin/dashboard/presentation/blocs/products_number/products_number_bloc.dart';
import 'package:shopyo/features/admin/dashboard/presentation/blocs/users_number/users_number_bloc.dart';
import 'package:shopyo/features/auth/data/data_source/auth_data_source.dart';
import 'package:shopyo/features/auth/data/repos/auth_repo.dart';
import 'package:shopyo/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;
Future<void> setupInjector() async {
  await _initCore();
  await _initAuth();
  await _initDashboard();
  await _initCategoriesAdmin();
  await _initProductsAdmin();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  final navigatorKey = GlobalKey<NavigatorState>();
  sl
    ..registerFactory(AppCubit.new)
    ..registerLazySingleton<ApiService>(() => ApiService(dio))
    ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey)
    ..registerFactory(() => UploadImageCubit(sl()))
    ..registerLazySingleton(() => UploadImageRepo(sl()))
    ..registerLazySingleton(() => UploadImageDataSource(sl()));
}

Future<void> _initAuth() async {
  sl
    ..registerFactory(() => AuthBloc(sl()))
    ..registerLazySingleton(() => AuthRepo(sl()))
    ..registerLazySingleton(() => AuthDataSource(sl()));
}

Future<void> _initDashboard() async {
  sl
    ..registerLazySingleton(() => DashboardDataSource(sl()))
    ..registerLazySingleton(() => DashboardRepo(sl()))
    ..registerFactory(() => ProductsNumberBloc(sl()))
    ..registerFactory(() => CategoriesNumberBloc(sl()))
    ..registerFactory(() => UsersNumberBloc(sl()));
}

Future<void> _initCategoriesAdmin() async {
  sl
    ..registerLazySingleton(() => CategoriesAdminRepo(sl()))
    ..registerLazySingleton(() => CategoriesAdminDataSource(sl()))
    ..registerFactory(() => GetAllAdminCategoriesBloc(sl()))
    ..registerFactory(() => CreateCategoryBloc(sl()))
    ..registerFactory(() => DeleteCategoryBloc(sl()))
    ..registerFactory(() => UpdateCategoryBloc(sl()));
}

Future<void> _initProductsAdmin() async {
  sl
    ..registerLazySingleton(() => ProductsAdminRepo(sl()))
    ..registerLazySingleton(() => ProductsAdminDataSource(sl()))
    ..registerFactory(() => GetAllAdminProductBloc(sl()))
    ..registerFactory(() => CreateProductBloc(sl()))
    ..registerFactory(() => DeleteProductBloc(sl()));
}
