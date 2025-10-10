import 'package:shopyo/core/service/graphql/api_service.dart';
import 'package:shopyo/core/service/graphql/qraphql_queries/admin/categories_queries.dart';
import 'package:shopyo/features/admin/add_categories/data/models/get_all_categories_response.dart';

class CategoriesAdminDataSource {
  final ApiService _graphql;
  CategoriesAdminDataSource(this._graphql);

  Future<GetAllCategoriesResponse> getAllCategoriesAdmin() async {
    final response = await _graphql.getAllCategories(
      CategoriesQueries().getAllCategoriesQuery(),
    );
    return response;
  }
}
