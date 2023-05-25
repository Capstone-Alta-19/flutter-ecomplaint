import 'package:flutter/material.dart';
import 'package:flutter_ecomplaint/screen/login_page.dart';

import 'package:flutter_ecomplaint/screen/splash_screen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        // primarySwatch: AppColors.primarySwatch,
        useMaterial3: true,
        // colorSchemeSeed: AppColors.primary,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff3C486B),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
