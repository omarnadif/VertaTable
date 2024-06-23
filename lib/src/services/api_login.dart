import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vertatable/src/constants/ipConfigurationApi.dart';

class LoginService {
  Future<Map<String, dynamic>> login(String email, String password) async {
    final Uri url = Uri.parse('${IP}/api/login');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      await _saveToken(responseBody['token']);
      print('Token saved: ${responseBody['token']}');
      return responseBody;
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }
}

