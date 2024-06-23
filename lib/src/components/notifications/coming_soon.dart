import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class ComingSoon {
  ComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: const EdgeInsets.only(top: 10, bottom: 70),
        elevation: 0,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Oh non!',
          message: "Cette fonctionnalité sera disponible dans la prochaine version de l'application",
          contentType: ContentType.warning,
        ),
      ),
    );
  }
}
