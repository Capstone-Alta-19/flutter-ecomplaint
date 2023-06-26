import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/app_color.dart';
import 'bottom_navbar.dart';
import 'login/loginregister_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int splashtime = 5;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: splashtime), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool getLoginStatus = prefs.containsKey('token');
      if (!getLoginStatus) {
        Navigator.pushReplacement(context, MaterialPageRoute(
            //pushReplacement = replacing the route so that
            //splash screen won't show on back button press
            //navigation to Home page.
            builder: (context) {
          return const OnBoardingPage();
        }));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(
            //pushReplacement = replacing the route so that
            //splash screen won't show on back button press
            //navigation to Home page.
            builder: (context) {
          return BottomNavigationBrWidget();
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: (MediaQuery.of(context).size.height),
        width: (MediaQuery.of(context).size.width),
        child: Center(
          child: Image.asset(
              width: 200, height: 200, 'assets/logo/hd-icon-logo.png'),
        ),
      ),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: AppColors.secondary100,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      rawPages: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: Image.asset(
                  width: 316.27,
                  height: 65.05,
                  'assets/logo/hd-logo-splash-screen.png')),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Center(
            child: SizedBox(
              width: 307,
              child: Text(
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.font),
                textAlign: TextAlign.center,
                "Tidak perlu repot-repot lagi menghubungi layanan pelanggan yang memakan waktu lama dan membingungkan. Dengan Complainz, kamu bisa membuat keluhan dengan mudah dan cepat lewat aplikasi.",
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: Image.asset(
                  width: 307,
                  height: 133,
                  'assets/logo/hd-logo-mulai-complaint.png')),
        ),
      ],

      onDone: () {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return const LoginregisterPage();
              },
              transitionDuration: const Duration(milliseconds: 300),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                final tween = Tween(
                  begin: const Offset(2, 0),
                  end: Offset.zero,
                );
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              }),
        );
      },
      onSkip: () {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return const LoginregisterPage();
              },
              transitionDuration: const Duration(milliseconds: 300),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                final tween = Tween(
                  begin: const Offset(2, 0),
                  end: Offset.zero,
                );
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              }),
        );
      },
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip',
          style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.font)),
      next: const ImageIcon(AssetImage("assets/icons/splash-arrow.png")),
      done: const ImageIcon(AssetImage("assets/icons/splash-arrow.png")),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
          size: Size(9.0, 9.0),
          color: AppColors.primary20,
          activeSize: Size(24.0, 9.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
          activeColor: AppColors.primary),
      dotsContainerDecorator: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
