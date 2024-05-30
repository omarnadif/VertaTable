import 'package:flutter/material.dart';

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
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: _isSelected ? Colors.green : Colors.black,
            width: _isSelected ? 3.0 : 1.0,
          ),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.asset(
            widget.iconPath,
            width: 45,
            height: 50,
          ),
        ),
      ),
    );
  }
}
