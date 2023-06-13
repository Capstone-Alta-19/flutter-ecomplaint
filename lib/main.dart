import 'package:complainz/screen/bottom.dart';
import 'package:complainz/screen/register_screen.dart';
import 'package:complainz/screen/laporkan_screen.dart';
import 'package:complainz/screen/pengaduan_screen.dart';
import 'package:complainz/screen/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/app_color.dart';
import 'screen/cobaan.dart';
import 'screen/komentar_screen.dart';
import 'screen/laporan_terbuka.dart';
import 'screen/my_account_screen.dart';

/* Future<void> main() async {
  runApp(MultiProvider(
    providers: [
      /* ChangeNotifierProvider(
        create: (context) => PostNotifier(),
      ), */
    ],
    child: MyApp(),
  ));
} */

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  State createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        /* home: const HomeScreen(
          key: ValueKey('Home Screen'), title: 'Flutter Demo Home Page'), */
        home: SplashScreen()
        /* routes: {
        "/add_post": (context) => AddPostScreen(),
      }, */
        );
  }
}

/* 
Future<void> main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => PostNotifier(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  State createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
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
      home: const DetailBerita(
          // idComplaint: 1,
          // statusComplaint: status.dijawab,
          ),
        primarySwatch: Colors.blue,
      ),
      home: const RegisterPage(),
      /*  routes: {
        "/register": (context) => const RegisterPage(),
      }, */
    );
  }
}
 */

/* void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => post_store.PostNotifier(),
        )
      ],
      child: const MyApp(),
    ),
    );
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegisterPage(),
    );
}
} */



