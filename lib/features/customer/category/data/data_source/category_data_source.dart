import 'package:shopyo/core/service/graphql/api_service.dart';
import 'package:shopyo/core/service/graphql/qraphql_queries/customer/category_queries.dart';
import 'package:shopyo/features/admin/add_products/data/models/get_all_product_response.dart';

class CategoryDataSource {
  final ApiService _graphql;

  CategoryDataSource(this._graphql);
  Future<GetAllProductResponse> getCategory({required int categoryId}) async {
    final response = await _graphql.getCategory(
      CategoryQueries().getCategoryMapQuery(categoryId: categoryId),
    );
    return response;
  }
}
