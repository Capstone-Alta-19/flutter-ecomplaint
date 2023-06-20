import 'package:complainz/widget/segment_title.dart';
import 'package:flutter/material.dart';
import '../../config/app_color.dart';
import 'detail_status_complaint.dart';

class StatusComplaint extends StatefulWidget {
  final String status;
  const StatusComplaint({super.key, required this.status});

  @override
  State<StatusComplaint> createState() => _StatusComplaintState();
}

class _StatusComplaintState extends State<StatusComplaint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              children: [
                SegmentTitleTwoLine(
                    title: "Status Complaint",
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {});
                    }),
                const SizedBox(height: 30),
                const Text(
                    style: TextStyle(
                      color: AppColors.font,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    "Click untuk melihat detail"),
                const SizedBox(height: 13),
                if (widget.status == "Pending")
                  ComplaintDiterima(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailStatusComplaint(
                                    status: type.diterma,
                                  )));
                    },
                  ),
                if (widget.status == "Proccess")
                  ComplaintDiproses(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailStatusComplaint(
                                    status: type.diproses,
                                  )));
                    },
                  ),
                if (widget.status == "Resolved")
                  ComplaintDijawab(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailStatusComplaint(
                                    status: type.dijawab,
                                  )));
                    },
                  ),
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
        padding: const EdgeInsets.only(left: 34, right: 34),
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
        padding: const EdgeInsets.only(left: 34, right: 34),
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
        padding: const EdgeInsets.only(left: 34, right: 34),
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
