import 'package:flutter/material.dart';
import 'package:vertatable/src/constants/constantsColors.dart';

class ButtonSubmit extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;

  const ButtonSubmit({Key? key, required this.onTap, required this.buttonText}) : super(key: key); // Aggiornato il costruttore

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: tPrimaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
