// lib/app/api_constants.dart

class ApiConstants {
  // Base URL of your Laravel API
  static const String baseUrl = "https://kitchydz.com/kitchy-api/api";

  // Auth endpoints
  static const String register = "$baseUrl/auth/register";
  static const String login = "$baseUrl/auth/login";
  static const String me = "$baseUrl/auth/me";
  static const String logout = "$baseUrl/auth/logout";

  // Product endpoints
  static const String products = "$baseUrl/products"; // GET all, POST create
  static String product(int id) =>
      "$baseUrl/products/$id"; // GET one, PUT update, DELETE

  // Orders endpoints
  static const String orders = "$baseUrl/orders"; // GET all, POST create
  static String order(int id) =>
      "$baseUrl/orders/$id"; // GET one, PUT update, DELETE

  static const String colors = "$baseUrl/colors"; // GET all, POST create
}
