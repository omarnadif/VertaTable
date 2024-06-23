import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vertatable/src/constants/constantsColors.dart';
import 'package:vertatable/src/views/profil/props_app.dart';
import '../../components/notifications/coming_soon.dart';
import '../../services/api_logout.dart';
import '../../services/api_user_data.dart';
import '../authentication/login_page.dart';
import 'allergies_utilisateur.dart';
import 'info_user.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);
  final ApiLogout apiLogout = ApiLogout();

  void _logout(BuildContext context) async {
    try {
      await apiLogout.logout();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to logout: $e')),
      );
    }
  }

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
        title: const Text('Profil'),
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
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Header
                  Container(
                    decoration: BoxDecoration(
                      color: tPrimaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const Icon(FontAwesomeIcons.user, size: 40.0, color: Colors.white),
                        const SizedBox(width: 16.0),
                        Text(
                          fullName,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // User Info
                  _buildProfileOption(
                    Icons.info,
                    'Mes informations personnelles',
                    'Modifier vos informations',
                    context,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const InfoUserPage()),
                      );
                    },
                  ),
                  _buildProfileOption(
                    Icons.fastfood,
                    'Préférences alimentaires',
                    'Sélectionnez votre régime alimentaire',
                    context,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AllergiesUtilisateurPage()),
                      );
                    },
                  ),
                  _buildProfileOption(
                    Icons.fingerprint,
                    'Face ID / Touch ID',
                    'Pour la sécurité de votre compte',
                    context,
                    switchOption: true,
                    onTap: () => ComingSoon(context),
                  ),
                  _buildProfileOption(
                    Icons.logout,
                    'Log out',
                    '',
                    context,
                    onTap: () => widget._logout(context),
                  ),

                  const SizedBox(height: 20),

                  // More Options
                  const Text('More', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  _buildProfileOption(
                    Icons.help,
                    'Aide & Support',
                    '',
                    context,
                    onTap: () => ComingSoon(context),
                  ),
                  _buildProfileOption(
                    Icons.info_outline,
                    'à propos de l\'app',
                    '',
                    context,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PropsAppPage()),
                      );
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, String subtitle, BuildContext context, {bool switchOption = false, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: tPrimaryColor),
      title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
      trailing: switchOption ? Switch(value: false, onChanged: (value) {}) : null,
      onTap: onTap,
    );
  }
}
