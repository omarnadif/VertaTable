import 'package:flutter/material.dart';
import 'package:vertatable/src/constants/constantsColors.dart';

class DateField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final Color iconColor;

  const DateField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  @override
  _DateFieldState createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        String formattedDate = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
        widget.controller.text = formattedDate;
      });
    }
  }



  String _addLeadingZero(int number) {
    return number.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      readOnly: true,
      onTap: () => _selectDate(context),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: tGreyColor),
          borderRadius: BorderRadius.circular(40),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: tSecondaryColor),
          borderRadius: BorderRadius.circular(40),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: widget.hintText,
        prefixIcon: widget.icon != null ? Icon(widget.icon, color: widget.iconColor,) : null,
      ),
    );
  }
}
