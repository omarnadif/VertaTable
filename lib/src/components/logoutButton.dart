import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vertatable/src/services/api_logout.dart';
import 'package:vertatable/src/views/authentication/login_page.dart';

class LogoutButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _logout(context),
      child: Container(
        width: 30,
        height: 30,
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(
            FontAwesomeIcons.powerOff,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
