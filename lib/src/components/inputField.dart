import 'package:flutter/material.dart';
import 'package:vertatable/src/constants/constantsImg.dart';
import 'package:vertatable/src/constants/constantsColors.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;

  InputField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.icon,
    this.iconColor,
    this.onTap,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: tGreyColor),
            borderRadius: BorderRadius.circular(40),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: tSecondaryColor),
            borderRadius: BorderRadius.circular(40),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          prefixIcon: icon != null ? Icon(icon, color: iconColor,) : null,
        ),
        validator: validator,
      ),
    );
  }
}

