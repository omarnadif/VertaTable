import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vertatable/src/constants/ipConfigurationApi.dart';

class ApiLogout {
  final Uri url = Uri.parse('${IP}/api/logout');

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      await prefs.remove('auth_token');
    } else {
      print('Failed to logout: ${response.body}');
      throw Exception('Failed to logout');

    }
  }
}
