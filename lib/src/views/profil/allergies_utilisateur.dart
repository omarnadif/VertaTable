import 'package:flutter/material.dart';
import 'package:vertatable/src/constants/constantsColors.dart';
import 'package:vertatable/src/constants/constantsText.dart';
import 'package:vertatable/src/constants/constantsImg.dart';
import 'package:vertatable/src/services/api_user_data.dart';

import '../../components/allergyOption.dart';


class AllergiesUtilisateurPage extends StatefulWidget {
  const AllergiesUtilisateurPage({Key? key}) : super(key: key);

  @override
  _AllergiesUtilisateurPageState createState() => _AllergiesUtilisateurPageState();
}

class _AllergiesUtilisateurPageState extends State<AllergiesUtilisateurPage> {
  late Future<Map<String, dynamic>> _userData;

  @override
  void initState() {
    super.initState();
    _userData = ApiUserData().getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _userData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('Aucune donnée utilisateur disponible'));
          } else {
            final user = snapshot.data!;
            final allergenes = user['allergenes'] as List<dynamic>;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                          text: tAllergiesText1,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: tPrimaryColor,
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
                          text: tAllergiesText21,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: tSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  if (allergenes.isEmpty)
                    const Center(
                      child: Text(
                        'Vous n\'avez pas d\'allergies :)',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: tPrimaryColor,
                        ),
                      ),
                    )
                  else
                    _buildAllergyOptions(allergenes),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildAllergyOptions(List<dynamic> allergenes) {
    return Center(
      child: Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        children: allergenes.map((allergene) {
          final allergieId = allergene['id'] as int;
          final allergieNom = allergene['nom'] as String;
          final allergieImage = _getAllergieImage(allergieId);
          return AllergyOption(
            title: allergieNom,
            iconPath: allergieImage,
            isSelected: true,
            onSelect: (bool _) {},
          );
        }).toList(),
      ),
    );
  }

  String _getAllergieImage(int allergieId) {
    switch (allergieId) {
      case 1:
        return tLaitImage;
      case 2:
        return tOeufImage;
      case 3:
        return tCrustacesImage;
      case 4:
        return tFruitsACoqueImage;
      case 5:
        return tSesameImage;
      case 6:
        return tGlutenImage;
      case 7:
        return tArachideImage;
      case 8:
        return tCeleriImage;
      case 9:
        return tMoutardeImage;
      case 10:
        return tPoissonImage;
      case 11:
        return tSojaImage;
      case 12:
        return tMollusquesImage;
      case 13:
        return tLupinImage;
      default:
        return tNotFoundImage;
    }
  }
}
