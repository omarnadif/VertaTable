import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:vertatable/src/constants/ipConfigurationApi.dart';

class ApiRegistration {
  static Future<void> saveUserData(Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_data', jsonEncode(userData));
  }

  static Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  static Future<Map<String, dynamic>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userDataString = prefs.getString('user_data');
    if (userDataString != null) {
      return Map<String, dynamic>.from(jsonDecode(userDataString));
    } else {
      return {};
    }
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  static Future<Map<String, dynamic>> registerUser(Map<String, dynamic> userData) async {
    final Uri url = Uri.parse('${IP}/api/register');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(userData),
    );

    if (response.statusCode == 201) {
      final responseBody = jsonDecode(response.body);
      await _saveToken(responseBody['token']);
      print('Token saved: ${responseBody['token']}');
      return responseBody;
    } else {
      throw Exception('Failed to register');
    }
  }
}

