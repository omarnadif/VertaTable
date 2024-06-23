import 'package:flutter/material.dart';
import '../constants/constantsColors.dart';
import '../constants/constantsText.dart';

// Widget pour une option d'allergie
class AllergyOption extends StatefulWidget {
  final String title;
  final String iconPath;
  final bool isSelected;
  final Function(bool) onSelect;

  const AllergyOption({
    Key? key,
    required this.title,
    required this.iconPath,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  _AllergyOptionState createState() => _AllergyOptionState();
}

// État pour le widget d'option d'allergie
class _AllergyOptionState extends State<AllergyOption> {
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
        widget.onSelect(_isSelected);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _isSelected ? Colors.green : tDarkColor,
                width: _isSelected ? 3.0 : 1.0,
              ),
            ),
            child: CircleAvatar(
              backgroundColor: tWhiteColor,
              child: Image.asset(
                widget.iconPath,
                width: 45,
                height: 50,
              ),
            ),
          ),

          // Espace
          const SizedBox(height: 5),

          // Texte
          Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: tDarkColor,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
