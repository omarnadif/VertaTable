import 'package:flutter/material.dart';
import '../services/plats_services.dart';
import '../views/plats/plats_details_page.dart';
import '../constants/constantsColors.dart';
import '../constants/constantsText.dart';

// Widget de sélection des plats
class DishSelection extends StatefulWidget {
  final String title1;
  final String title2;
  final String title3;
  final String imagePath1;
  final String imagePath2;
  final String imagePath3;
  final IconData categoryIcon1;
  final IconData categoryIcon2;
  final IconData categoryIcon3;
  final int dishId1;
  final int dishId2;
  final int dishId3;
  final Function(String, String) onDishSelected;

  const DishSelection({
    Key? key,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.imagePath1,
    required this.imagePath2,
    required this.imagePath3,
    required this.categoryIcon1,
    required this.categoryIcon2,
    required this.categoryIcon3,
    required this.dishId1,
    required this.dishId2,
    required this.dishId3,
    required this.onDishSelected,
  }) : super(key: key);

  @override
  _DishSelectionState createState() => _DishSelectionState();
}

// État pour le widget de sélection des plats
class _DishSelectionState extends State<DishSelection> {
  // Ouvre la page de détail du plat
  void _openDishDetailPage(int dishId, String dishName, String imagePath) async {
    try {
      final dishDetails = await PlatsServices.fetchPlatDetails(dishId);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlatsDetailsPage(
            dishName: dishDetails['nom'],
            imagePath: dishDetails['image'],
            rating: dishDetails['rating'] ?? 0.0,
            description: dishDetails['description'],
            ingredients: List<String>.from(dishDetails['ingredients']),
            onDishSelected: widget.onDishSelected,
          ),
        ),
      );
    } catch (e) {
      print('Failed to load dish details: $e');
    }
  }

  // Construit une option de plat
  Widget buildDishOption(String imagePath, String dishName, IconData categoryIcon, int dishId) {
    return GestureDetector(
      onTap: () {
        _openDishDetailPage(dishId, dishName, imagePath);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: tDarkColor,
                width: 1.0,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Stack(
                children: [
                  Image.network(
                    imagePath,
                    width: double.infinity,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 1,
                    left: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          categoryIcon,
                          color: tWhiteColor,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5), // Espace
          Text(
            dishName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: tDarkColor,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      children: [
        buildDishOption(widget.imagePath1, widget.title1, widget.categoryIcon1, widget.dishId1),
        buildDishOption(widget.imagePath2, widget.title2, widget.categoryIcon2, widget.dishId2),
        buildDishOption(widget.imagePath3, widget.title3, widget.categoryIcon3, widget.dishId3),
      ],
    );
  }
}
