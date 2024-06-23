import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vertatable/src/constants/ipConfigurationApi.dart';

class PlatsServices {
  static Future<Map<String, dynamic>> fetchFilteredPlats(int userId) async {
    final List<String> categories = ['Viande', 'Poisson', 'Légumes'];
    Map<String, dynamic> filteredDishes = {};

    try {
      for (String category in categories) {
        final Uri url = Uri.parse('${IP}/api/plat/filtered?userId=$userId&categories[]=$category');
        final response = await http.get(url);

        if (response.statusCode == 200) {
          List<dynamic> dishes = jsonDecode(response.body);
          if (dishes.isNotEmpty) {
            filteredDishes[category] = dishes[0];
          }
        } else {
          throw Exception('Failed to load filtered dishes for category $category');
        }
      }
      return filteredDishes;
    } catch (e) {
      print('Error fetching filtered dishes: $e');
      throw Exception('Failed to load filtered dishes');
    }
  }

  static Future<Map<String, dynamic>> fetchPlatDetails(int platId) async {
    final Uri url = Uri.parse('${IP}/api/plat/details/$platId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load plat details');
    }
  }
}

