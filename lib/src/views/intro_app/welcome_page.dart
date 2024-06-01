import 'package:flutter/material.dart';
import 'package:vertatable/src/views/home_page.dart';
import 'package:vertatable/src/views/intro_app/intro_page_1.dart';
import 'package:vertatable/src/views/intro_app/intro_page_2.dart';
import 'package:vertatable/src/views/intro_app/intro_page_3.dart';
import 'package:vertatable/src/constants/constantsColors.dart';
import 'package:vertatable/src/constants/constantsImg.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:vertatable/src/views/authentication/login_page.dart';

//--------------------------------//INFO//--------------------------------//

//Le texte des titres est défini dans le fichier "constants/constantsText.dart"
//Les img sont défini dans le fichier "constants/constantsImg.dart"

//------------------------------------------------------------------------//

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _controller = PageController();
  int currentPageIndex = 0;

  // Méthode pour libérer les ressources du contrôleur de page
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(tWelcomePageBackground),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Création du LiquidSwipe pour les pages d'introduction
          LiquidSwipe(
            pages: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
            onPageChangeCallback: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            waveType: WaveType.liquidReveal,
            positionSlideIcon: 0.9,
            //slideIconWidget: const Icon(Icons.arrow_back_ios_rounded, size: 30, color: Color(0xB31A5377)),
            ignoreUserGestureWhileAnimating: true,
            //limite page 3
            enableLoop: false,
          ),

          // Bouton ! (Présent page 3)
          Container(
            margin: const EdgeInsets.only(right: 15, bottom: 2),
            alignment: const Alignment(0, 0.99),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (currentPageIndex == 2)
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: tPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Get.to(() => const LoginPage());
                    },
                    child: const Text(
                      "C'est parti!",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFFFF),
                        fontFamily: "Billy",
                        fontSize: 18,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Indicateurs de page ronds
          Positioned(
            left: 0,
            right: 0,
            bottom: 85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(3, (int index) {
                return Container(
                  width: 18,
                  height: 18,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        currentPageIndex == index ? tPrimaryColor : tGreyColor,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
