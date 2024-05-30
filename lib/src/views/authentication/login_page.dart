import 'package:flutter/material.dart';
import 'package:vertatable/src/components/buttonSubmit.dart';
import 'package:vertatable/src/components/inputField.dart';
import 'package:vertatable/src/constants/constantsColors.dart';
import 'package:vertatable/src/constants/constantsText.dart';
import 'package:vertatable/src/constants/constantsImg.dart';
import 'package:vertatable/src/views/authentication/registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //Controller login
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children:  [
              //Space
              const SizedBox(height: 50),
              //Logo
              Image.asset(tLogo, width: 150),

              //App Name
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 25,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: tLoginText1,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: tAccentColor,
                      ),
                    ),
                    TextSpan(
                      text: tLoginText2,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: tDarkColor,
                      ),
                    ),
                    TextSpan(
                      text: tLoginText3,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: tSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              //Space
              const SizedBox(height: 25),
              //Email TextField
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: InputField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                  icon: Icons.person,
                  iconColor: tPrimaryColor,
                ),
              ),
              //Space
              const SizedBox(height: 25),
              //Password TextField
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: InputField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  icon: Icons.lock,
                  iconColor: tPrimaryColor,
                ),
              ),
              //Forgot Password
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      tLoginText4,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: tPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              //Space
              const SizedBox(height: 20),
              //Login Button
              ButtonSubmit(onTap: () {  }, buttonText: 'Connexion',),

              //OU Divider
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Divider()
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(tLoginText7),
                      ),
                      Expanded(
                          child: Divider()
                      ),
                    ]
                ),
              ),

              //Inscription
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationPage()),
                  );
                },
                child: const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: tLoginText5,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: tLoginText6,
                        style: TextStyle(
                          fontSize: 14,
                          color: tPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
