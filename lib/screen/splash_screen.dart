import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecomplaint/config/colors.dart';
import 'package:flutter_ecomplaint/screen/homepage.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:introduction_screen/introduction_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String token = "";
  int splashtime = 5;
  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      if (token.isEmpty) {
        Navigator.pushReplacement(context, MaterialPageRoute(
            //pushReplacement = replacing the route so that
            //splash screen won't show on back button press
            //navigation to Home page.
            builder: (context) {
          return OnBoardingPage();
        }));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(
            //pushReplacement = replacing the route so that
            //splash screen won't show on back button press
            //navigation to Home page.
            builder: (context) {
          return Homepage();
        }));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: (MediaQuery.of(context).size.height),
        width: (MediaQuery.of(context).size.width),
        child: Center(
          child: Image.asset('assets/logo/icon-logo.png'),
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

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      rawPages: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(child: Image.asset('assets/logo/logo-splash-screen.png')),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: SizedBox(
              width: 307,
              child: Text(textAlign: TextAlign.center, "Tidak perlu repot-repot lagi menghubungi layanan pelanggan yang memakan waktu lama dan membingungkan. Dengan Complainz, kamu bisa membuat keluhan dengan mudah dan cepat lewat aplikasi."),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(child: Image.asset('assets/logo/logo-splash-screen.png')),
        ),
      ],

      onDone: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const Homepage()),
      ),
      onSkip: () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const Homepage()),
      ),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Icon(Icons.arrow_forward),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb ? const EdgeInsets.all(12.0) : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
