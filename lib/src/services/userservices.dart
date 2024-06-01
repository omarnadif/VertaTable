import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vertatable/src/constants/ipConfigurationApi.dart';

class UserService {
  static Future<Map<String, dynamic>> getUser(int userId) async {
    final Uri url = Uri.parse('${IP}/api/user/$userId/details');
    try {
      final http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return {'error': 'Failed to load user data'};
    }
  }
}
