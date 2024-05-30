import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vertatable/src/views/intro_app/welcome_page.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'VertaTable',
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
