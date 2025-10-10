import 'package:shopyo/core/service/graphql/api_service.dart';
import 'package:shopyo/core/service/graphql/qraphql_queries/admin/categories_queries.dart';
import 'package:shopyo/features/admin/add_categories/data/models/create_category_request_body.dart';
import 'package:shopyo/features/admin/add_categories/data/models/create_category_response.dart';
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

  Future<CreateCategoryResponse> createCategory(
    CreateCategoryRequestBody body,
  ) async {
    final response = await _graphql.createCategory(
      CategoriesQueries().createCategoryQuery(body),
    );
    return response;
  }
}
