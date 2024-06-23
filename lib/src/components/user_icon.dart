import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../views/profil/profil_page.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(FontAwesomeIcons.userCircle, size: 30.0),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ProfilePage()),
        );
      },
    );
  }
}
