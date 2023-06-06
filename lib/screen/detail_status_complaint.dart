import 'package:flutter/material.dart';
import 'package:flutter_ecomplaint/config/colors.dart';
import 'package:flutter_ecomplaint/widget/segment_title.dart';

class DetailStatusComplaint extends StatefulWidget {
  const DetailStatusComplaint({super.key});

  @override
  State<DetailStatusComplaint> createState() => _DetailStatusComplaintState();
}

class _DetailStatusComplaintState extends State<DetailStatusComplaint> {
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
              DetailDiproses(),
              SizedBox(height: 160),
              FilledButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(358, 40)),
                    backgroundColor: MaterialStatePropertyAll(AppColors.primary),
                  ),
                  onPressed: () {},
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/logo/stepper-line-vertical.png"),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Image.asset(width: 212, "assets/logo/on-diterima.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Image.asset(width: 212, "assets/logo/on-diterima.png"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
