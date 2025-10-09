class DashboardQueries {
  factory DashboardQueries() {
    return _instance;
  }
  const DashboardQueries._();
  static const DashboardQueries _instance = DashboardQueries._();

  Map<String, dynamic> numberOfProductsQuery() {
    return {
      'query': '''
        {
          products{
            title
          }
        }
''',
    };
  }

  Map<String, dynamic> numberOfCategoriesQuery() {
    return {
      'query': '''
        {
          categories{
            name
          }
        }
''',
    };
  }

  Map<String, dynamic> numberOfUsersQuery() {
    return {
      'query': '''
        {
          users{
            name
          }
        }
''',
    };
  }
}
