import 'package:flutter/material.dart';
import 'package:flutter_ecomplaint/config/colors.dart';
import 'package:flutter_ecomplaint/screen/berita/berita_terkini_page.dart';
import 'package:flutter_ecomplaint/screen/home_page.dart';
import 'package:flutter_ecomplaint/screen/splash_screen_page.dart';

import 'model/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Complaintz',
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
      home: BeritaTerkiniPage(
          // idComplaint: 1,
          // statusComplaint: status.dijawab,
          ),
    );
  }
}

class percobaanlogin extends StatefulWidget {
  const percobaanlogin({super.key});

  @override
  State<percobaanlogin> createState() => _percobaanloginState();
}

class _percobaanloginState extends State<percobaanlogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        child: Center(
          child: ElevatedButton(
              onPressed: () async {
                await login("halim", "12345678").then((value) {
                  print(value);
                });
              },
              child: Text("Login")),
        ),
      ),
    );
  }
}
