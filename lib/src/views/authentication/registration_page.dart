import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vertatable/src/components/buttonSubmit.dart';
import 'package:vertatable/src/components/inputField.dart';
import 'package:vertatable/src/components/dateField.dart';
import 'package:vertatable/src/constants/constantsColors.dart';
import 'package:vertatable/src/constants/constantsText.dart';
import 'package:vertatable/src/views/authentication/allergies_page.dart';
import 'package:vertatable/src/views/authentication/login_page.dart';

import '../../services/api_registration.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final emailController = TextEditingController();
  final telephoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmationPasswordController = TextEditingController();
  final codeEntrepriseController = TextEditingController();
  final dateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void registerUser() async {
    Map<String, dynamic> userData = {
      'nom': nomController.text,
      'prenom': prenomController.text,
      'email': emailController.text,
      'telephone': telephoneController.text,
      'password': passwordController.text,
      'confirmationPassword': confirmationPasswordController.text,
      'codeEntreprise': codeEntrepriseController.text,
      'date_de_naissance': dateController.text,
    };

    try {
      final response = await ApiRegistration.registerUser(userData);

      if (response['message'] == 'User registration data stored. Proceed to select allergies.') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AllergiesPage(userId: response['userId'])),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Errore durante la registrazione')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 25,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: tRegistrationText1,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: tAccentColor,
                          ),
                        ),
                        TextSpan(
                          text: tRegistrationText2,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: tDarkColor,
                          ),
                        ),
                        TextSpan(
                          text: tRegistrationText3,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: tSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(
                        child: InputField(
                          controller: nomController,
                          hintText: tRegistrationText4,
                          obscureText: false,
                          icon: Icons.person,
                          iconColor: tPrimaryColor,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer votre nom';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: InputField(
                          controller: prenomController,
                          hintText: tRegistrationText5,
                          obscureText: false,
                          icon: Icons.person,
                          iconColor: tPrimaryColor,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer votre prénom';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  InputField(
                    controller: emailController,
                    hintText: tRegistrationText6,
                    obscureText: false,
                    icon: Icons.email,
                    iconColor: tPrimaryColor,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre adresse email';
                      }
                      final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if (!emailRegExp.hasMatch(value)) {
                        return 'Veuillez entrer une adresse email valide';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  DateField(
                    controller: dateController,
                    hintText: tRegistrationText14,
                    icon: Icons.calendar_today,
                    iconColor: tPrimaryColor,
                  ),
                  const SizedBox(height: 25),
                  InputField(
                    controller: telephoneController,
                    hintText: tRegistrationText7,
                    obscureText: false,
                    icon: Icons.phone,
                    iconColor: tPrimaryColor,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre numéro de téléphone';
                      } else if (value.length > 13) {
                        return 'Veuillez entrer un numéro de téléphone valide';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  InputField(
                    controller: passwordController,
                    hintText: tRegistrationText8,
                    obscureText: true,
                    icon: Icons.lock,
                    iconColor: tPrimaryColor,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre mot de passe';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  InputField(
                    controller: confirmationPasswordController,
                    hintText: tRegistrationText9,
                    obscureText: true,
                    icon: Icons.lock,
                    iconColor: tPrimaryColor,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez confirmer votre mot de passe';
                      }
                      if (passwordController.text != value) {
                        return 'Les mots de passe ne correspondent pas';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  InputField(
                    controller: codeEntrepriseController,
                    hintText: tRegistrationText10,
                    obscureText: false,
                    icon: Icons.business,
                    iconColor: tPrimaryColor,
                  ),
                  const SizedBox(height: 25),
                  ButtonSubmit(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        registerUser();
                      }
                    },
                    buttonText: tRegistrationText11,
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: tRegistrationText12,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: tRegistrationText13,
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
        ),
      ),
    );
  }
}
