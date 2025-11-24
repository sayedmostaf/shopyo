import 'package:shopyo/core/service/graphql/api_service.dart';
import 'package:shopyo/core/service/graphql/qraphql_queries/admin/products_queries.dart';
import 'package:shopyo/features/admin/add_products/data/models/create_product_request_body.dart';
import 'package:shopyo/features/admin/add_products/data/models/get_all_product_response.dart';

class ProductsAdminDataSource {
  final ApiService _graphql;
  ProductsAdminDataSource(this._graphql);
  Future<GetAllProductResponse> getAllProductsAdmin() async {
    final response = await _graphql.getAllProducts(
      ProductsQueries().getAllProductsQuery(),
    );
    return response;
  }

  Future<void> createProductsAdmin({
    required CreateProductRequestBody body,
  }) async {
    final response = await _graphql.createProduct(
      ProductsQueries().createProductMap(body: body),
    );
    return response;
  }

  Future<void> deleteProducts({required String productId}) async {
    final response = await _graphql.deleteProduct(
      ProductsQueries().deleteMapQuery(productId: productId),
    );
    return response;
  }
}
