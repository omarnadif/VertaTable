import 'dart:math';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:vertatable/src/constants/constantsColors.dart';
import 'package:vertatable/src/constants/constantsImg.dart';
import '../home_page.dart';

class CommandeDonePage extends StatefulWidget {
  const CommandeDonePage({Key? key}) : super(key: key);

  @override
  _CommandeDonePageState createState() => _CommandeDonePageState();
}

class _CommandeDonePageState extends State<CommandeDonePage> {
  late ConfettiController _confettiControllerRight;
  late ConfettiController _confettiControllerLeft;

  @override
  void initState() {
    super.initState();
    _confettiControllerRight = ConfettiController(duration: const Duration(seconds: 3));
    _confettiControllerLeft = ConfettiController(duration: const Duration(seconds: 3));
    _confettiControllerRight.play();
    _confettiControllerLeft.play();
  }

  @override
  void dispose() {
    _confettiControllerRight.dispose();
    _confettiControllerLeft.dispose();
    super.dispose();
  }

  void _navigateToHomePage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  tWelcomePageImage1,
                  width: 400,
                  height: 400,
                ),
                const SizedBox(height: 20),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 40,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Commande ',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: tAccentColor,
                        ),
                      ),
                      TextSpan(
                        text: 'faite',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: tSecondaryColor,
                        ),
                      ),
                      TextSpan(
                        text: ' !',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: tDarkColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () => _navigateToHomePage(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tAccentColor,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  ),
                  child: const Text(
                    "Retournez à l'accueil",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: ConfettiWidget(
              confettiController: _confettiControllerRight,
              blastDirection: pi / 4,
              blastDirectionality: BlastDirectionality.explosive,
              maxBlastForce: 50,
              minBlastForce: 20,
              emissionFrequency: 0.02,
              numberOfParticles: 100,
              gravity: 0.1,
              shouldLoop: false,
              colors: const [Colors.green, Colors.red, Colors.yellow, Colors.blue, Colors.orange],
              createParticlePath: (size) => Path()..addRect(Rect.fromLTRB(0, 0, size.width, size.height)),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: ConfettiWidget(
              confettiController: _confettiControllerLeft,
              blastDirection: 3 * pi / 4,
              blastDirectionality: BlastDirectionality.explosive,
              maxBlastForce: 50,
              minBlastForce: 20,
              emissionFrequency: 0.02,
              numberOfParticles: 100,
              gravity: 0.1,
              shouldLoop: false,
              colors: const [Colors.green, Colors.red, Colors.yellow, Colors.blue, Colors.orange],
              createParticlePath: (size) => Path()..addRect(Rect.fromLTRB(0, 0, size.width, size.height)),
            ),
          ),
        ],
      ),
    );
  }
}
