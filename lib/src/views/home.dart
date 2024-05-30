import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    // Définition de variables pour les tailles de police et les tailles d'icônes en fonction de la largeur de l'écran
    double screenWidth = MediaQuery.of(context).size.width;
    double smallFontSize = screenWidth * 0.045;
    double mediumFontSize = screenWidth * 0.06;
    double largeFontSize = screenWidth * 0.08;
    double iconSize = screenWidth * 0.07;

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //HEADER//
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    // Récupération du nom d'utilisateur
                    'HI ',
                    style: TextStyle(
                      fontSize: smallFontSize,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              //BODY//
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Text(
                      'Welcome to Creami',
                      style: TextStyle(
                        fontSize: largeFontSize,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}