import 'package:shopyo/core/service/graphql/api_service.dart';
import 'package:shopyo/core/service/graphql/qraphql_queries/customer/product_details_queries.dart';
import 'package:shopyo/features/customer/product_details/data/models/product_details_response.dart';

class ProductDetailsDataSource {
  final ApiService _graphql;
  ProductDetailsDataSource(this._graphql);

  Future<ProductDetailsResponse> productDetails({required int id}) async {
    final response = await _graphql.productDetails(
      ProductDetailsQueries().getProductDetailsMapQuery(id: id),
    );
    return response;
  }
}
