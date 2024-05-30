import 'package:flutter/material.dart';
import 'package:vertatable/src/constants/constantsText.dart';
import 'package:vertatable/src/constants/constantsColors.dart';
import 'package:vertatable/src/constants/constantsImg.dart';

//--------------------------------//INFO//--------------------------------//

//Le texte des titres est défini dans le fichier "constants/constantsText.dart"
//Les img sont défini dans le fichier "constants/constantsImg.dart"
//La couleur est définie dans le fichier "constants/constantsColors.dart"
//------------------------------------------------------------------------//

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final spaceHeight = mediaQuery.size.height * 0.02;
    final maxHeight = mediaQuery.size.height * 0.5;

    return Container(
      decoration: const BoxDecoration(
        color: tThirdColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: mediaQuery.size.height * 0.1,
          left: mediaQuery.size.width * 0.05,
          right: mediaQuery.size.width * 0.05,
        ),

        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: maxHeight,
              child: Image.asset(
                tWelcomePageImage2,
                height: mediaQuery.size.height * 0.7,
              ),
            ),

            SizedBox(height: spaceHeight * 0.5),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: "Billy",
                      fontSize: mediaQuery.size.width * 0.08 ,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: tWelcomePagesText5,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: tAccentColor,
                        ),
                      ),
                      TextSpan(
                        text: tWelcomePagesText6,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: tDarkColor,
                        ),
                      ),
                      TextSpan(
                        text: tWelcomePagesText7,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: tWhiteColor,
                        ),
                      ),
                      TextSpan(
                        text: tWelcomePagesText8,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: tDarkColor,
                        ),
                      ),
                    ],
                  ),
                )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
