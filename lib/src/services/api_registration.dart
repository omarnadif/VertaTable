import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiRegistration {
  static Future<Map<String, dynamic>> registerUser(Map<String, dynamic> userData) async {
    final Uri url = Uri.parse('https://10.190.128.242:8000/api/register');
    try {
      final http.Response response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userData),
      );

      return jsonDecode(response.body);
    } catch (e) {
      print('Error in registration: $e');
      return {'status': 'error', 'message': 'Registration failed: $e'};
    }
  }

  static Future<Map<String, dynamic>> finalizeRegistration(int userId, List<int> allergies) async {
    final Uri url = Uri.parse('https://10.190.128.242:8000/api/finalize-registration');
    try {
      final http.Response response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'userId': userId, 'allergies': allergies}),
      );

      return jsonDecode(response.body);
    } catch (e) {
      print('Error in finalizing registration: $e');
      return {'status': 'error', 'message': 'Finalization failed: $e'};
    }
  }
}
