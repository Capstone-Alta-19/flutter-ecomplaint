import 'package:flutter/material.dart';
import 'package:flutter_ecomplaint/screens/about_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Hello World',
      theme: ThemeData(),
      home: const AboutUsPage(),
    );
  }
}
