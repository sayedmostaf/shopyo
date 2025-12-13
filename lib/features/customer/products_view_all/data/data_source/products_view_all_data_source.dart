import 'package:shopyo/core/service/graphql/api_service.dart';
import 'package:shopyo/core/service/graphql/qraphql_queries/customer/products_view_all_queries.dart';
import 'package:shopyo/features/admin/add_products/data/models/get_all_product_response.dart';

class ProductsViewAllDataSource {
  final ApiService _graphql;
  ProductsViewAllDataSource(this._graphql);

  Future<GetAllProductResponse> getProductsViewAll({
    required int offset,
  }) async {
    final response = await _graphql.getProductsViewAll(
      ProductViewAllQueries().getProductsViewAllMapQuery(offset: offset),
    );
    return response;
  }
}
