import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  static final String baseUrl = dotenv.env['BASE_URL'] ?? '';
  static final String apiKey = dotenv.env['API_KEY'] ?? '';

  // Endpoint
  static String get loginUrl => '$baseUrl/login';
  static String get registerUrl => '$baseUrl/register';
  static String get createInvoiceUrl => '$baseUrl/create-invoice';
}
