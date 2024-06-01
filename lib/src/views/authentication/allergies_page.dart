import 'package:flutter/material.dart';
import 'package:vertatable/src/services/api_registration.dart';
import '../../components/allergyOption.dart';
import '../../components/buttonSubmit.dart';
import '../../components/squareSelection.dart';
import '../../constants/constantsColors.dart';
import '../../constants/constantsImg.dart';
import '../../constants/constantsText.dart';
import '../home_page.dart';

class AllergiesPage extends StatefulWidget {
  final int userId;

  const AllergiesPage({Key? key, required this.userId}) : super(key: key);

  @override
  State<AllergiesPage> createState() => _AllergiesPageState();
}

class _AllergiesPageState extends State<AllergiesPage> {
  int? selectedDietaryOptionId;
  List<int> selectedAllergies = [];

  //Choix de l'option diététique
  void handleDietaryOptionSelected(String option) {
    setState(() {
      selectedDietaryOptionId = option == 'Omnivore' ? 14 : option == 'Vegetarian' ? 15 : 16;
      selectedAllergies.removeWhere((id) => id == 14 || id == 15 || id == 16);
      selectedAllergies.add(selectedDietaryOptionId!);
    });
  }

  //Choix de l'option allergie
  void handleAllergyOptionSelected(int allergyId, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedAllergies.add(allergyId);
      } else {
        selectedAllergies.remove(allergyId);
      }
    });
  }


  void finalizeRegistration() async {
    try {
      final response = await ApiRegistration.finalizeRegistration(widget.userId, selectedAllergies);

      if (response.containsKey('message') && response['message'] == 'User registered successfully with allergies!') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage(userId: widget.userId)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Un erreur est survenue lors de l\'enregistrement de vos allergies')),
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
            child: Column(
              children: [

                //Allergies title
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 25,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: tAllergiesText1,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: tAccentColor,
                        ),
                      ),
                      TextSpan(
                        text: tAllergiesText2,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: tDarkColor,
                        ),
                      ),
                      TextSpan(
                        text: tAllergiesText3,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: tSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),

                //Espace
                const SizedBox(height: 25),

                //Dietary selection
                SquareSelection(
                  title1: tAllergiesText4,
                  title2: tAllergiesText5,
                  title3: tAllergiesText6,
                  imagePath1: tOmivoreImage,
                  imagePath2: tVegetarianImage,
                  imagePath3: tVeganImage,
                  onOptionSelected: handleDietaryOptionSelected,
                ),

                //Espace
                const SizedBox(height: 25),

                //Allergies title
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 25,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: tAllergiesText1,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: tDarkColor,
                        ),
                      ),
                      TextSpan(
                        text: tAllergiesText7,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: tSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),

                //Allergies options
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AllergyOption(
                      title: tAllergiesText8,
                      iconPath: tLaitImage,
                      isSelected: selectedAllergies.contains(1),
                      onSelect: (isSelected) {
                        handleAllergyOptionSelected(1, isSelected);
                      },
                    ),
                    const SizedBox(width: 16),
                    AllergyOption(
                      title: tAllergiesText9,
                      iconPath: tOeufImage,
                      isSelected: selectedAllergies.contains(2),
                      onSelect: (isSelected) {
                        handleAllergyOptionSelected(2, isSelected);
                      },
                    ),
                    const SizedBox(width: 16),
                    AllergyOption(
                      title: tAllergiesText10,
                      iconPath: tCrustacesImage,
                      isSelected: selectedAllergies.contains(3),
                      onSelect: (isSelected) {
                        handleAllergyOptionSelected(3, isSelected);
                      },
                    ),
                    const SizedBox(width: 16),
                    AllergyOption(
                      title: tAllergiesText11,
                      iconPath: tFruitsACoqueImage,
                      isSelected: selectedAllergies.contains(4),
                      onSelect: (isSelected) {
                        handleAllergyOptionSelected(4, isSelected);
                      },
                    ),
                    const SizedBox(width: 16),
                    AllergyOption(
                      title: tAllergiesText12,
                      iconPath: tSesameImage,
                      isSelected: selectedAllergies.contains(5),
                      onSelect: (isSelected) {
                        handleAllergyOptionSelected(5, isSelected);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AllergyOption(
                      title: tAllergiesText13,
                      iconPath: tGlutenImage,
                      isSelected: selectedAllergies.contains(6),
                      onSelect: (isSelected) {
                        handleAllergyOptionSelected(6, isSelected);
                      },
                    ),
                    const SizedBox(width: 16),
                    AllergyOption(
                      title: tAllergiesText14,
                      iconPath: tArachideImage,
                      isSelected: selectedAllergies.contains(7),
                      onSelect: (isSelected) {
                        handleAllergyOptionSelected(7, isSelected);
                      },
                    ),
                    const SizedBox(width: 16),
                    AllergyOption(
                      title: tAllergiesText15,
                      iconPath: tCeleriImage,
                      isSelected: selectedAllergies.contains(8),
                      onSelect: (isSelected) {
                        handleAllergyOptionSelected(8, isSelected);
                      },
                    ),
                    const SizedBox(width: 16),
                    AllergyOption(
                      title: tAllergiesText16,
                      iconPath: tMoutardeImage,
                      isSelected: selectedAllergies.contains(9),
                      onSelect: (isSelected) {
                        handleAllergyOptionSelected(9, isSelected);
                      },
                    ),
                    const SizedBox(width: 16),
                    AllergyOption(
                      title: tAllergiesText17,
                      iconPath: tPoissonImage,
                      isSelected: selectedAllergies.contains(10),
                      onSelect: (isSelected) {
                        handleAllergyOptionSelected(10, isSelected);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AllergyOption(
                      title: tAllergiesText18,
                      iconPath: tSojaImage,
                      isSelected: selectedAllergies.contains(11),
                      onSelect: (isSelected) {
                        handleAllergyOptionSelected(11, isSelected);
                      },
                    ),
                    const SizedBox(width: 16),
                    AllergyOption(
                      title: tAllergiesText19,
                      iconPath: tMollusquesImage,
                      isSelected: selectedAllergies.contains(12),
                      onSelect: (isSelected) {
                        handleAllergyOptionSelected(12, isSelected);
                      },
                    ),
                    const SizedBox(width: 16),
                    AllergyOption(
                      title: tAllergiesText20,
                      iconPath: tLupinImage,
                      isSelected: selectedAllergies.contains(13),
                      onSelect: (isSelected) {
                        handleAllergyOptionSelected(13, isSelected);
                      },
                    ),
                  ],
                ),

                //Espace
                const SizedBox(height: 25),

                //Button to finalize registration
                ButtonSubmit(
                  onTap: finalizeRegistration,
                  buttonText: tRegistrationText11,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
