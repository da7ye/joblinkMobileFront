class Config {
  static const String appUrl = "http://127.0.0.1:8000/api";
  static const String categoriesEndpoint = "categories/";
  static const String providersEndpoint = "providers/";
  static const String usersEndpoint = "users/";
  static String categoryProviderEndpoint(int categoryId) =>
      "categoryProvider/$categoryId";
}
