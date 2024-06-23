import 'package:flutter/material.dart';
import 'package:vertatable/src/constants/constantsColors.dart';
import 'package:vertatable/src/constants/constantsImg.dart';

class PropsAppPage extends StatelessWidget {
  const PropsAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('À propos de l\'app'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Logo
            Center(
              child: Image.asset(
                tbigLogo,
                width: 250,
                height: 250,
              ),
            ),

            //Espace
            const SizedBox(height: 40),

            // Text
            const Text(
              'Pendant le MyDigitalProject, nous avons eu l\'opportunité de créer VertaTable. Ce projet consiste à développer une entreprise fictive qui met en relation la production locale avec les entreprises en livrant des plats préparés. VertaTable vise à renforcer l\'inclusion dans les entreprises en offrant des moments de convivialité autour de repas sains et locaux. De plus, en limitant les déplacements des employés, VertaTable contribue à réduire l\'impact environnemental tout en soutenant la production locale.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: tDarkColor,
              ),
            ),
            const Spacer(),

            // Version app
            const Text(
              'Version 1.0v',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: tPrimaryColor,
              ),
            ),

            //Espace
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
