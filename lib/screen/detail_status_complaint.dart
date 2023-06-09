import 'package:flutter/material.dart';
import 'package:flutter_ecomplaint/config/colors.dart';
import 'package:flutter_ecomplaint/screen/status_complaint_page.dart';
import 'package:flutter_ecomplaint/widget/custom_dialog.dart';
import 'package:flutter_ecomplaint/widget/segment_title.dart';

import '../widget/custom_alert_dialog.dart';

enum status { diterma, diproses, dijawab }

class DetailStatusComplaint extends StatefulWidget {
  final status statusComplaint;
  final idComplaint;

  DetailStatusComplaint({super.key, required this.statusComplaint, required this.idComplaint});

  @override
  State<DetailStatusComplaint> createState() => _DetailStatusComplaintState();
}

class _DetailStatusComplaintState extends State<DetailStatusComplaint> {
  final damn = "terima";
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
              const SegmentTitle(title: "Detail Status"),
              SizedBox(
                height: 37,
              ),
              if (damn == "jawab") DetailDijawab(),
              if (damn == "proses") DetailDiproses(),
              if (damn == "terima") DetailDijawab(),
              SizedBox(height: 160),
              FilledButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(358, 40)),
                    backgroundColor: MaterialStatePropertyAll(AppColors.primary),
                  ),
                  onPressed: () {
                    showDialog(
                        barrierDismissible: false,
                        barrierColor: null,
                        context: context,
                        builder: (BuildContext context) => CustomDialog(
                              onPressed: () {
                                Navigator.pop(context);
                                showDialog(
                                    barrierColor: null,
                                    context: context,
                                    builder: (BuildContext context) => CustomAlertDialog(
                                          title: "Laporan Terhapus",
                                          icon: "assets/icons/Trash.png",
                                        ));
                              },
                              confirm: "Ya, Hapus",
                              icon: "assets/icons/Trash.png",
                              title: "Kamu Yakin Untuk Mencabut Laporan?",
                            ));
                  },
                  child: Text(style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.secondary100), "Edit laporan")),
            ],
          )),
        ),
      ),
    );
  }
}

class DetailDiterima extends StatelessWidget {
  const DetailDiterima({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 39.0),
      child: Row(
        children: [
          Image.asset("assets/logo/stepper-line-vertical.png"),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Image.asset(width: 212, "assets/logo/on-diterima.png"),
              ),
              SizedBox(
                height: 300,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DetailDiproses extends StatelessWidget {
  const DetailDiproses({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 39.0),
      child: Row(
        children: [
          Image.asset("assets/logo/stepper-line-vertical2.png"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Image.asset(width: 212, "assets/logo/off-diterima.png"),
              ),
              SizedBox(height: 110),
              Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Image.asset(width: 212, "assets/logo/on-diproses.png"),
              ),
              SizedBox(height: 150),
            ],
          )
        ],
      ),
    );
  }
}

class DetailDijawab extends StatelessWidget {
  const DetailDijawab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 39.0),
      child: Row(
        children: [
          Column(
            children: [
              Image.asset("assets/logo/stepper-line-vertical3.png"),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Image.asset(width: 212, "assets/logo/off-diterima.png"),
              ),
              SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Image.asset(width: 212, "assets/logo/off-diproses.png"),
              ),
              SizedBox(height: 90),
              Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Image.asset(width: 212, "assets/logo/on-dijawab.png"),
              ),
            ],
          )
        ],
      ),
    );
  }
}