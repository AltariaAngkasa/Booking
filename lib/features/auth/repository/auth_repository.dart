import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRepository {
  final String baseUrl;
  final String apiKey;
  AuthRepository({required this.baseUrl, required this.apiKey}); // Ganti dengan URL API kamu

  Future<Map<String, dynamic>> register({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String pin,
  }) async {
    final url = Uri.parse("$baseUrl/register/user");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json",
      "X-API-KEY": "$apiKey#"},
      body: jsonEncode({
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "pin": pin,
      }),
    );

    if (response.statusCode == 200) {
      return {
        "success": true,
        "data": jsonDecode(response.body),
      };
    } else {
      return {
        "success": false,
        "message": jsonDecode(response.body)["message"] ?? "Gagal register",
      };
    }
  }

  Future<Map<String, dynamic>> login({
    required String phone,
    required String password,
  }) async {
    final url = Uri.parse("$baseUrl/rlogin/user");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json",
      "X-API-KEY": "$apiKey#"},
      body: jsonEncode({
        "phone": phone,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      return {
        "success": true,
        "data": jsonDecode(response.body),
      };
    } else {
      return {
        "success": false,
        "message": jsonDecode(response.body)["message"] ?? "Gagal login",
      };
    }
  }
}
