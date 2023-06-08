import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_ecomplaint/config/colors.dart';
import 'package:flutter_ecomplaint/widget/isi_laporan_item.dart';
import 'package:flutter_ecomplaint/widget/segment_title.dart';

import '../widget/dashed_divider.dart';

class RiwayatLaporanPage extends StatefulWidget {
  const RiwayatLaporanPage({super.key});

  @override
  State<RiwayatLaporanPage> createState() => _RiwayatLaporanPageState();
}

class _RiwayatLaporanPageState extends State<RiwayatLaporanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SegmentTitle(title: "Riwayat Laporan"),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    )),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Container(
                    width: double.infinity,
                    child: Column(children: [
                      SizedBox(
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
                      SizedBox(
                        height: 20,
                      ),
                      DashedDivider(
                        color: AppColors.primary,
                        strokeWidth: 2,
                        gapWidth: 8,
                      ),
                      SizedBox(
                        height: 36.5,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 185, child: Text(style: TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.w500), maxLines: 1, textAlign: TextAlign.left, "${index + 1}. Mata Kuliah Banyak Tugas")),
                                FilledButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColors.primary), minimumSize: MaterialStatePropertyAll(Size(91, 40))), onPressed: () {}, child: Text(style: TextStyle(color: AppColors.secondary100), "Detail")),
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
