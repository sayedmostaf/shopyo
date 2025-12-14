import 'package:shopyo/core/service/graphql/api_service.dart';
import 'package:shopyo/core/service/graphql/qraphql_queries/customer/search_queries.dart';
import 'package:shopyo/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:shopyo/features/customer/search/data/models/search_request_body.dart';

class SearchDataSource {
  final ApiService _graphql;
  SearchDataSource(this._graphql);

  Future<GetAllProductResponse> searchProduct({
    required SearchRequestBody body,
  }) async {
    final response = await _graphql.searchProduct(
      SearchQueries().searchProduct(body: body),
    );
    return response;
  }
}
