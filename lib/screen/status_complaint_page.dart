import 'package:flutter/material.dart';
import 'package:flutter_ecomplaint/config/colors.dart';
import 'package:flutter_ecomplaint/widget/segment_title_without_back.dart';

class StatusComplaint extends StatefulWidget {
  const StatusComplaint({super.key});

  @override
  State<StatusComplaint> createState() => _StatusComplaintState();
}

class _StatusComplaintState extends State<StatusComplaint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              children: [
                SegmentTitleWithoutBack(title: "Status Complaint"),
                SizedBox(height: 30),
                Text(
                    style: TextStyle(
                      color: AppColors.font,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    "Click untuk melihat detail"),
                SizedBox(height: 13),
                ComplaintDijawab(
                  onPressed: () {},
                ),
                SizedBox(height: 13),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ComplaintDiterima extends StatelessWidget {
  final void Function() onPressed;
  const ComplaintDiterima({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 34, right: 34),
        child: Column(
          children: [
            InkWell(
              onTap: onPressed,
              child: Image.asset(width: 322, height: 100, "assets/logo/Complain Diterima.png"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Image.asset("assets/logo/Stepper Line.png"),
            ),
            InkWell(
              child: Image.asset(width: 322, height: 100, "assets/logo/Complain Diproses (1).png"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Image.asset("assets/logo/Stepper Line (1).png"),
            ),
            InkWell(
              child: Image.asset(width: 322, height: 100, "assets/logo/Complain Dijawab (1).png"),
            ),
          ],
        ));
  }
}

class ComplaintDiproses extends StatelessWidget {
  final void Function() onPressed;
  const ComplaintDiproses({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 34, right: 34),
        child: Column(
          children: [
            InkWell(
              onTap: onPressed,
              child: Image.asset(width: 322, height: 100, "assets/logo/Complain Diterima.png"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Image.asset("assets/logo/Stepper Line (2).png"),
            ),
            InkWell(
              onTap: onPressed,
              child: Image.asset(width: 322, height: 100, "assets/logo/Complain Diproses.png"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Image.asset("assets/logo/Stepper Line.png"),
            ),
            InkWell(
              child: Image.asset(width: 322, height: 100, "assets/logo/Complain Dijawab (1).png"),
            ),
          ],
        ));
  }
}

class ComplaintDijawab extends StatelessWidget {
  final void Function() onPressed;
  const ComplaintDijawab({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 34, right: 34),
        child: Column(
          children: [
            InkWell(
              child: Image.asset(width: 322, height: 100, "assets/logo/Complain Diterima.png"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Image.asset("assets/logo/Stepper Line (2).png"),
            ),
            InkWell(
              child: Image.asset(width: 322, height: 100, "assets/logo/Complain Diproses.png"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Image.asset("assets/logo/Stepper Line (2).png"),
            ),
            InkWell(
              onTap: onPressed,
              child: Image.asset(width: 322, height: 100, "assets/logo/Complain Dijawab.png"),
            ),
          ],
        ));
  }
}
