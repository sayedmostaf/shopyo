class UsersQueries {
  factory UsersQueries() {
    return _instance;
  }
  UsersQueries._();
  static UsersQueries _instance = UsersQueries._();

  Map<String, dynamic> getAllUsersMapQuery() {
    return {
      'query': '''
            {
              users{
                  name
                  id
                  email

              }
          }
      ''',
    };
  }
}
