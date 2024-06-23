import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vertatable/src/constants/ipConfigurationApi.dart';

class ApiPlatsAvailable {
  Future<List<Map<String, dynamic>>> getPlatsAvailable(String date) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (token == null) {
      throw Exception('Token not found');
    }

    final Uri url = Uri.parse('${IP}/api/plat/available?date=$date');

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> responseBody = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(responseBody);
    } else {
      throw Exception('Failed to load available plats');
    }
  }
}
