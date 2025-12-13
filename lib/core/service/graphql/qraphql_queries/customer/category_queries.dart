class CategoryQueries {
  factory CategoryQueries() {
    return _instance;
  }
  const CategoryQueries._();

  static const CategoryQueries _instance = CategoryQueries._();

  Map<String, dynamic> getCategoryMapQuery({required int categoryId}) {
    return {
      'query':
          '''
          {
          products(categoryId: $categoryId) {
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
        },
  
      ''',
    };
  }
}
