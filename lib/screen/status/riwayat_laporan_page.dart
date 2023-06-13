import 'package:flutter/material.dart';

import '../../config/app_color.dart';
import '../../widget/dashed_divider.dart';
import '../../widget/segment_title.dart';

class RiwayatLaporanPage extends StatefulWidget {
  const RiwayatLaporanPage({super.key});

  @override
  State<RiwayatLaporanPage> createState() => _RiwayatLaporanPageState();
}

class _RiwayatLaporanPageState extends State<RiwayatLaporanPage> {
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
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SegmentTitleTwoLine(title: "Riwayat Laporan"),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    constraints: const BoxConstraints(minHeight: 584),
                    width: double.infinity,
                    child: Column(children: [
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                            "Laporan Saya"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const DashedDivider(
                        color: AppColors.primary,
                        strokeWidth: 2,
                        gapWidth: 8,
                      ),
                      const SizedBox(
                        height: 36.5,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: 185,
                                    child: Text(
                                      style: const TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.w500),
                                      maxLines: 1,
                                      textAlign: TextAlign.left,
                                      "${index + 1}. Mata Kuliah Banyak Tugas",
                                    )),
                                FilledButton(
                                    style: const ButtonStyle(
                                        backgroundColor: MaterialStatePropertyAll(AppColors.primary),
                                        minimumSize: MaterialStatePropertyAll(
                                          Size(91, 40),
                                        )),
                                    onPressed: () async {},
                                    child: const Text(
                                      style: TextStyle(color: AppColors.secondary100),
                                      "Detail",
                                    )),
                              ],
                            ),
                          );
                        },
                      )
                    ]),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
