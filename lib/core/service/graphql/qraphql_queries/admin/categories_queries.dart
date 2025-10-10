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
}
