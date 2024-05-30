import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DietarySelection extends StatefulWidget {
  final String title1;
  final String title2;
  final String title3;
  final String imagePath1;
  final String imagePath2;
  final String imagePath3;
  final Function(String) onOptionSelected;

  const DietarySelection({
    Key? key,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.imagePath1,
    required this.imagePath2,
    required this.imagePath3,
    required this.onOptionSelected,
  }) : super(key: key);

  @override
  _DietarySelectionState createState() => _DietarySelectionState();
}

class _DietarySelectionState extends State<DietarySelection> {
  int? _selectedOptionIndex;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      children: [
        buildDietaryOption(widget.imagePath1, widget.title1, 0),
        buildDietaryOption(widget.imagePath2, widget.title2, 1),
        buildDietaryOption(widget.imagePath3, widget.title3, 2),
      ],
    );
  }

  Widget buildDietaryOption(String imagePath, String optionName, int index) {
    bool isSelected = _selectedOptionIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedOptionIndex = index;
        });
        widget.onOptionSelected(optionName);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: isSelected ? Colors.green : Colors.black,
            width: isSelected ? 4.0 : 2.0,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Stack(
            children: [
              Container(
                color: isSelected ? Colors.green : Colors.transparent,
              ),
              Image.asset(
                imagePath,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54.withOpacity(0.5),
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Text(
                      optionName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
