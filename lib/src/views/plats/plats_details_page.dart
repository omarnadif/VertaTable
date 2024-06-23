import 'package:flutter/material.dart';

class PlatsDetailsPage extends StatelessWidget {
  final String dishName;
  final String imagePath;
  final double rating;
  final String description;
  final List<String> ingredients;
  final Function(String, String) onDishSelected;

  const PlatsDetailsPage({
    Key? key,
    required this.dishName,
    required this.imagePath,
    required this.rating,
    required this.description,
    required this.ingredients,
    required this.onDishSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dishName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                imagePath,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '$rating ★',
              style: TextStyle(fontSize: 16, color: Colors.orange),
            ),
            const SizedBox(height: 10),
            Text(
              dishName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
            const SizedBox(height: 10),
            Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 5),
            Text(
              description,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 10),
            Text(
              'Ingredients',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: ingredients.map((ingredient) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Row(
                    children: [
                      Icon(Icons.brightness_1, size: 6, color: Colors.black),
                      const SizedBox(width: 8),
                      Expanded(child: Text(ingredient, style: TextStyle(fontSize: 14))),
                    ],
                  ),
                );
              }).toList(),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  onDishSelected(dishName, imagePath);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text('Choisir', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
