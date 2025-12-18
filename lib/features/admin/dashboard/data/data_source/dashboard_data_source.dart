import 'package:shopyo/core/service/graphql/api_service.dart';
import 'package:shopyo/core/service/graphql/qraphql_queries/admin/dashboard_queries.dart';
import 'package:shopyo/features/admin/dashboard/data/models/categories_number_response.dart';
import 'package:shopyo/features/admin/dashboard/data/models/products_number_response.dart';
import 'package:shopyo/features/admin/dashboard/data/models/users_number_response.dart';

class DashboardDataSource {
  final ApiService _apiService;
  DashboardDataSource(this._apiService);

  Future<ProductsNumberResponse> numberOfProducts() async {
    final response = await _apiService.numberOfProducts(
      DashboardQueries().numberOfProductsQuery(),
    );
    return response;
  }

  Future<CategoriesNumberResponse> numberOfCategories() async {
    final response = await _apiService.numberOfCategories(
      DashboardQueries().numberOfCategoriesQuery(),
    );
    return response;
  }

  Future<UsersNumberResponse> numberOfUsers() async {
    final response = await _apiService.numberOfUsers(
      DashboardQueries().numberOfUsersQuery(),
    );
    return response;
  }
}
