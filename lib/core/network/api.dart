import '../config/flavor_config.dart';

class API {
  static String get BASE_URL => FlavorConfig.instance.apiBaseUrl;

  // Books
  static String get BOOKS => '$BASE_URL/books/v1/volumes';
}
