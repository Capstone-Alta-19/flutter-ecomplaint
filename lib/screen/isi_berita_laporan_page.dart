import 'package:flutter/material.dart';
import 'package:flutter_ecomplaint/config/colors.dart';
import 'package:flutter_ecomplaint/widget/custom_card.dart';
import 'package:flutter_ecomplaint/widget/segment_title.dart';

class IsiBeritaLaporanPage extends StatefulWidget {
  const IsiBeritaLaporanPage({super.key});

  @override
  State<IsiBeritaLaporanPage> createState() => _IsiBeritaLaporanPageState();
}

class _IsiBeritaLaporanPageState extends State<IsiBeritaLaporanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: [
              const SegmentTitle(title: "Laporan"),
              const SizedBox(
                height: 87.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: CustomCard(
                    child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16.5,
                    right: 10.5,
                    top: 20.5,
                    bottom: 12.5,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(width: 40, "assets/logo/PP.png"),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: SizedBox(
                                width: 198,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                        style: TextStyle(
                                          color: AppColors.font,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        "Adita Surya Putra"),
                                    Text(
                                        style: TextStyle(
                                          color: AppColors.font,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        "@nina_real"),
                                  ],
                                )),
                          ),
                          const Text(
                              style: TextStyle(
                                color: AppColors.font,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              "12/05/2023"),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: AppColors.secondary100,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                )),
                            width: 330,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [const Text("Lapooran")],
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                )),
                            width: 330,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [const Text("sasdadad")],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
