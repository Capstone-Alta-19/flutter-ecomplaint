import 'package:flutter/material.dart';
import 'package:flutter_ecomplaint/config/colors.dart';
import 'package:flutter_ecomplaint/screen/detail_status_complaint.dart';
import 'package:flutter_ecomplaint/screen/isi_berita_laporan_page.dart';
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
      home: DetailStatusComplaint(
        idComplaint: 1,
        statusComplaint: status.dijawab,
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// import 'package:im_stepper/stepper.dart';

// void main() {
//   runApp(IconStepperDemo());
// }

// class IconStepperDemo extends StatefulWidget {
//   @override
//   _IconStepperDemo createState() => _IconStepperDemo();
// }

// class _IconStepperDemo extends State<IconStepperDemo> {
//   // THE FOLLOWING TWO VARIABLES ARE REQUIRED TO CONTROL THE STEPPER.
//   int activeStep = 0; // Initial step set to 5.

//   int upperBound = 6; // upperBound MUST BE total number of icons minus 1.

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('IconStepper Example'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               // IconStepper(
//               //   icons: [
//               //     Icon(Icons.supervised_user_circle),
//               //     Icon(Icons.flag),
//               //     Icon(Icons.access_alarm),
//               //     Icon(Icons.supervised_user_circle),
//               //     Icon(Icons.flag),
//               //     Icon(Icons.access_alarm),
//               //     Icon(Icons.supervised_user_circle),
//               //   ],

//               //   // activeStep property set to activeStep variable defined above.
//               //   activeStep: activeStep,

//               //   // This ensures step-tapping updates the activeStep.
//               //   onStepReached: (index) {
//               //     setState(() {
//               //       activeStep = index;
//               //     });
//               //   },
//               // ),
//               DotStepper(
//                 direction: Axis.vertical,
//                 dotCount: 3,
//                 indicator: Indicator.slide,
//                 fixedDotDecoration: FixedDotDecoration(color: AppColors.primary20),
//                 spacing: 138,
//                 dotRadius: 16,
//                 lineConnectorsEnabled: true,
//                 lineConnectorDecoration: LineConnectorDecoration(color: AppColors.primary20, strokeWidth: 6),
//                 indicatorDecoration: IndicatorDecoration(color: Colors.yellow, strokeColor: Colors.yellow),
//                 activeStep: activeStep,
//               ),

//               // header(),
//               // Expanded(
//               //   child: FittedBox(
//               //     child: Center(
//               //       child: Text('$activeStep'),
//               //     ),
//               //   ),
//               // ),
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //   children: [
//               //     previousButton(),
//               //     nextButton(),
//               //   ],
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
