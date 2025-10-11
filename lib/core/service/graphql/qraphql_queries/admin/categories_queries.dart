import 'package:shopyo/features/admin/add_categories/data/models/create_category_request_body.dart';
import 'package:shopyo/features/admin/add_categories/data/models/update_category_request_body.dart';

class CategoriesQueries {
  const CategoriesQueries._();
  factory CategoriesQueries() {
    return _instance;
  }
  static const CategoriesQueries _instance = CategoriesQueries._();

  Map<String, dynamic> getAllCategoriesQuery() {
    return {
      'query': '''
            {
            categories{
              id
              name
              image
            }
          }
      ''',
    };
  }

  Map<String, dynamic> createCategoryQuery(CreateCategoryRequestBody body) {
    return {
      'query': r'''
          mutation Create($name: String!, $image: String!) {
            addCategory(
              data: {name: $name, image: $image}
            ) {
              id
              name
              image
            }
          }
        ''',
      'variables': {'name': body.name, 'image': body.image},
    };
  }

  Map<String, dynamic> deleteCategoryQuery({required String categoryId}) {
    return {
      'query': r'''
            mutation DeleteCategory($categoryId: ID!) {
              deleteCategory(id: $categoryId)
            }
      ''',
      'variables': {'categoryId': categoryId},
    };
  }

  Map<String, dynamic> updateCategoryQuery({
    required UpdateCategoryRequestBody body,
  }) {
    return {
      'query': r'''
            mutation Update($id: ID!, $name: String!, $image: String!) {
            updateCategory(id: $id, changes: { name: $name, image: $image}) {
              id
            }
          }
        ''',
      'variables': {'id': body.id, 'name': body.name, 'image': body.image},
    };
  }
}
