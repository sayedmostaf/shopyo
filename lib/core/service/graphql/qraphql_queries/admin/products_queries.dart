import 'package:shopyo/features/admin/add_products/data/models/create_product_request_body.dart';

class ProductsQueries {
  factory ProductsQueries() {
    return _instance;
  }
  const ProductsQueries._();
  static const ProductsQueries _instance = ProductsQueries._();
  Map<String, dynamic> getAllProductsQuery() {
    return {
      'query': '''
            {
            products{
              id
              title
              price
              images
              description
              category{
                id
                name
                }
            }
          }
      ''',
    };
  }

  Map<String, dynamic> createProductMap({
    required CreateProductRequestBody body,
  }) {
    return {
      'query': r'''
          mutation CreateProduct($title: String!, $price: Float!, $description:String!, $categoryId: Float!,$imagesList:[String!]!  ) {
              addProduct(
                data: {
                  title: $title,
                  price: $price
                  description: $description
                  categoryId: $categoryId
                  images: $imagesList
                }
              ) {
                title
              }
            }
        ''',
      'variables': {
        'title': body.title,
        'price': body.price,
        'description': body.description,
        'categoryId': body.categoryId,
        'imagesList': body.imageList,
      },
    };
  }

  Map<String, dynamic> deleteMapQuery({required String productId}) {
    return {
      'query': r'''
            mutation DeleteCategory($productId: ID!) {
              deleteProduct(id: $productId)
            }
      ''',
      'variables': {'productId': productId},
    };
  }
}
