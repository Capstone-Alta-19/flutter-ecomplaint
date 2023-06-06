import 'package:flutter/material.dart';
import 'package:flutter_ecomplaint/config/colors.dart';
import 'package:flutter_ecomplaint/screen/detail_status_complaint.dart';
import 'package:flutter_ecomplaint/screen/splash_screen_page.dart';
import 'package:flutter_ecomplaint/screen/status_complaint_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'Poppins',
          // primarySwatch: AppColors.primarySwatch,
          useMaterial3: true,
          // colorSchemeSeed: AppColors.primary,
          colorScheme: ColorScheme.fromSeed(
            background: AppColors.secondary100,
            seedColor: const Color(0xff3C486B),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.secondary100,
            surfaceTintColor: Colors.transparent,
          )),
      home: const DetailStatusComplaint(),
    );
  }
}
