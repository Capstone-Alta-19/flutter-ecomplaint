import 'package:flutter/material.dart';
import 'package:flutter_ecomplaint/screen/dashboard.dart';
import 'package:flutter_ecomplaint/screen/detail-berita.dart';
import 'package:flutter_ecomplaint/screen/detail-berita.dart';
void main() {
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        // primarySwatch: AppColors.primarySwatch,
        useMaterial3: true,
        // colorSchemeSeed: AppColors.primary,
         colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff3C486B),
         )
      ),
      debugShowCheckedModeBanner: false,
      home: const DetailBerita(),
    );
  }
} 