import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vertatable/src/constants/constantsColors.dart';
import 'package:intl/intl.dart';
import '../../services/api_user_data.dart';

class InfoUserPage extends StatefulWidget {
  const InfoUserPage({Key? key}) : super(key: key);

  @override
  _InfoUserPageState createState() => _InfoUserPageState();
}

class _InfoUserPageState extends State<InfoUserPage> {
  late Future<Map<String, dynamic>> _userData;

  @override
  void initState() {
    super.initState();
    _userData = ApiUserData().getUserData();
  }

  String formatDate(String date) {
    final DateTime parsedDate = DateTime.parse(date);
    return DateFormat('dd/MM/yy').format(parsedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Utilisateur'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _userData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No user data available'));
          } else {
            final user = snapshot.data!;
            final String fullName = '${user['prenom']} ${user['nom']}';
            final String email = user['email'];
            final String telephone = user['telephone'];
            final String dateDeNaissance = formatDate(user['date_de_naissance']);
            final String codeEntreprise = user['entreprise']['codeEntreprise'];

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: tPrimaryColor,
                    child: Icon(FontAwesomeIcons.user, size: 40.0, color: Colors.white),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    fullName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: tPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildUserInfo(FontAwesomeIcons.envelope, 'Email', email),
                  _buildUserInfo(FontAwesomeIcons.phone, 'Téléphone', telephone),
                  _buildUserInfo(FontAwesomeIcons.birthdayCake, 'Date de Naissance', dateDeNaissance),
                  _buildUserInfo(FontAwesomeIcons.building, 'Code Entreprise', codeEntreprise),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildUserInfo(IconData icon, String title, String info) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: tPrimaryColor, width: 1),
      ),
      child: Row(
        children: [
          Icon(icon, color: tPrimaryColor),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                info,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
