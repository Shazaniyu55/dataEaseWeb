// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dataapp/services/tokenServie.dart';
import 'package:http/http.dart' as http;

class RequestAssistant {
  /// Generic request handler
  static Future<dynamic> sendRequest(
    String url, {
    String method = "GET", // default is GET
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      // Default headers
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      // Merge custom headers
      if (headers != null) {
        requestHeaders.addAll(headers);
      }

      http.Response httpResponse;

      switch (method.toUpperCase()) {
        case "POST":
          httpResponse = await http.post(
            Uri.parse(url),
            headers: requestHeaders,
            body: jsonEncode(body ?? {}),
          );
          break;

        case "PUT":
          httpResponse = await http.put(
            Uri.parse(url),
            headers: requestHeaders,
            body: jsonEncode(body ?? {}),
          );
          break;

        case "DELETE":
          httpResponse = await http.delete(
            Uri.parse(url),
            headers: requestHeaders,
          );
          break;

        case "GET":
        default:
          httpResponse = await http.get(
            Uri.parse(url),
            headers: requestHeaders,
          );
      }

      // Parse response
      if (httpResponse.statusCode >= 200 && httpResponse.statusCode < 300) {
        return jsonDecode(httpResponse.body);
      } else {
        return "Error: ${httpResponse.statusCode}, ${httpResponse.body}";
      }
    } catch (e) {
      return "Exception occurred: $e";
    }
  }

  // Optional shortcuts for convenience
  static Future<dynamic> get(String url, {Map<String, String>? headers}) =>
      sendRequest(url, method: "GET", headers: headers);

  static Future<dynamic> post(String url, Map<String, dynamic> body,
          {Map<String, String>? headers}) =>
      sendRequest(url, method: "POST", body: body, headers: headers);

  static Future<dynamic> put(String url, Map<String, dynamic> body,
          {Map<String, String>? headers}) =>
      sendRequest(url, method: "PUT", body: body, headers: headers);

  static Future<dynamic> delete(String url, {Map<String, String>? headers}) =>
      sendRequest(url, method: "DELETE", headers: headers);
}




class VtuApi {

  final String baseUrl = "https://vtu.ng/wp-json";

  VtuApi();

  /// Fetch wallet balance
  Future<Map<String, dynamic>> checkBalance() async {
    final TokenService tokenService = TokenService();

    final savedToken = await tokenService.getToken();
    final url = Uri.parse("$baseUrl/api/v2/balance");

    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $savedToken",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      print("Balance fetched successfully: ${response.body}");

      return json.decode(response.body);
    } else {
      throw Exception("Failed to fetch balance: ${response.body}");
    }
  }

/// LOGIN - Get JWT Token
  Future<String> login(String username, String password) async {
    final TokenService tokenService = TokenService();
    final url = Uri.parse("$baseUrl/jwt-auth/v1/token");

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await tokenService.saveToken(data["token"]); // Save token securely  
      print("Login successful. Token: ${data["token"]}");
      return data["token"];
    } else {
      throw Exception("Login failed: ${response.body}");
    }
  }


}

