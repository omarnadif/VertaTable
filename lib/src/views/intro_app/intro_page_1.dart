import 'package:flutter/material.dart';
import 'package:vertatable/src/constants/constantsText.dart';
import 'package:vertatable/src/constants/constantsImg.dart';
import 'package:vertatable/src/constants/constantsColors.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final spaceHeight = mediaQuery.size.height * 0.02;
    final maxHeight = mediaQuery.size.height * 0.5;

    return Container(
      decoration: const BoxDecoration(
        color: tWhiteColor,
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
            SizedBox(
              height: maxHeight,
              child: Image.asset(tWelcomePageImage1),
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
                        fontFamily: "Poppins",
                        fontSize: mediaQuery.size.width * 0.08,
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                          text: tWelcomePagesText1,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: tAccentColor,
                          ),
                        ),
                        TextSpan(
                          text: tWelcomePagesText2,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: tDarkColor,
                          ),
                        ),
                        TextSpan(
                          text: tWelcomePagesText3,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: tSecondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: tWelcomePagesText4,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: tDarkColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
