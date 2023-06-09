import 'package:complainz/Provider/get_all_news_provider.dart';
import 'package:complainz/Provider/get_complaint_category_provider.dart';
import 'package:complainz/Provider/get_complaint_id_provider.dart';
import 'package:complainz/Provider/register_provider.dart';
import 'package:complainz/screen/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/create_aspirasi_provider.dart';
import 'Provider/create_complaint_provider.dart';
import 'package:complainz/Provider/get_complaint_status_provider.dart';
import 'Provider/delete_complaint_id_provider.dart';
import 'Provider/get_news_id_provider.dart';
import 'Provider/login_provider.dart';
import 'config/app_color.dart';
import 'Provider/bottom_navbar_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<BottomNavigationBarProvider>(
              create: (_) => BottomNavigationBarProvider()),
          ChangeNotifierProvider<CreateRegisterViewModel>(
              create: (_) => CreateRegisterViewModel()),
          ChangeNotifierProvider<GetComplaintCategoryViewModel>(
              create: (_) => GetComplaintCategoryViewModel()),
          ChangeNotifierProvider<GetComplaintIdViewModel>(
              create: (_) => GetComplaintIdViewModel()),
          ChangeNotifierProvider<CreateComplaintViewModel>(
              create: (_) => CreateComplaintViewModel()),
          ChangeNotifierProvider<CreateAspirasiViewModel>(
              create: (_) => CreateAspirasiViewModel()),
          ChangeNotifierProvider<GetComplaintStatusViewModel>(
              create: (_) => GetComplaintStatusViewModel()),
          ChangeNotifierProvider<DeleteComplaintIdViewModel>(
              create: (_) => DeleteComplaintIdViewModel()),
          ChangeNotifierProvider<GetAllNewsViewModel>(
              create: (_) => GetAllNewsViewModel()),
          ChangeNotifierProvider<GetNewsIdViewModel>(
              create: (_) => GetNewsIdViewModel()),
          ChangeNotifierProvider<LoginViewModel>(
              create: (_) => LoginViewModel()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              useMaterial3: true,
              fontFamily: 'Poppins',
              colorScheme: ColorScheme.fromSeed(
                background: AppColors.secondary100,
                seedColor: const Color(0xff3C486B),
              ),
              appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.secondary100,
                surfaceTintColor: Colors.transparent,
              )),
          home: const SplashScreen(),
        ));
  }
}
