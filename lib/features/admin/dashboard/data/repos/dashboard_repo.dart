import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/features/admin/dashboard/data/data_source/dashboard_data_source.dart';
import 'package:shopyo/features/admin/dashboard/data/models/categories_number_response.dart';
import 'package:shopyo/features/admin/dashboard/data/models/products_number_response.dart';
import 'package:shopyo/features/admin/dashboard/data/models/users_number_response.dart';

class DashboardRepo {
  final DashboardDataSource _dataSource;
  DashboardRepo(this._dataSource);

  Future<ApiResult<ProductsNumberResponse>> numberOfProducts() async {
    try {
      final response = await _dataSource.numberOfProducts();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure('please, try again we have error');
    }
  }

  Future<ApiResult<CategoriesNumberResponse>> numberOfCategories() async {
    try {
      final response = await _dataSource.numberOfCategories();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure('please, try again we have error');
    }
  }

  Future<ApiResult<UsersNumberResponse>> numberOfUsers() async {
    try {
      final response = await _dataSource.numberOfUsers();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure('please, try again we have error');
    }
  }
}
