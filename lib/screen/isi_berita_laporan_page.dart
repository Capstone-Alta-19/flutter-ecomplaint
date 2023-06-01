import 'package:flutter/material.dart';
import 'package:flutter_ecomplaint/widget/custom_card.dart';
import 'package:flutter_ecomplaint/widget/isi_laporan_item.dart';
import 'package:flutter_ecomplaint/widget/profile_card.dart';
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
      body: SingleChildScrollView(
        child: SizedBox(
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
                      children: const [
                        ProfileCard(),
                        SizedBox(height: 8),
                        IsiLaporanItem(),
                        SizedBox(height: 8),
                      ],
                    ),
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
