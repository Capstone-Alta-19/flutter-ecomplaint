import 'package:flutter/material.dart';
import 'package:flutter_ecomplaint/config/colors.dart';
import 'package:flutter_ecomplaint/widget/custom_card.dart';
import 'package:flutter_ecomplaint/widget/interaction_card.dart';
import 'package:flutter_ecomplaint/widget/isi_laporan_item.dart';
import 'package:flutter_ecomplaint/widget/profile_card.dart';
import 'package:flutter_ecomplaint/widget/segment_title.dart';
import 'package:flutter_ecomplaint/widget/selengkapnya_button.dart';
import 'package:like_button/like_button.dart';

List<String> list = <String>['Urutkan Berdasarkan', 'Terbaru', 'Terlama'];

class IsiBeritaLaporanPage extends StatefulWidget {
  const IsiBeritaLaporanPage({super.key});

  @override
  State<IsiBeritaLaporanPage> createState() => _IsiBeritaLaporanPageState();
}

class _IsiBeritaLaporanPageState extends State<IsiBeritaLaporanPage> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              children: [
                const SegmentTitle(title: "Laporan"),
                const SizedBox(
                  height: 87.0,
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Flex(
                    mainAxisAlignment: MainAxisAlignment.end,
                    direction: Axis.horizontal,
                    children: [
                      Container(
                        decoration: BoxDecoration(border: Border.all(width: 1, color: AppColors.primary), borderRadius: BorderRadius.circular(8)),
                        width: 184,
                        height: 32,
                        child: Center(
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(color: AppColors.primary, Icons.expand_more),
                            elevation: 16,
                            style: const TextStyle(color: AppColors.font, fontSize: 14, fontWeight: FontWeight.w500),
                            // underline: Container(
                            //   height: 2,
                            //   color: AppColors.primary,
                            // ),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                dropdownValue = value!;
                              });
                            },
                            items: list.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 26.0,
                ),
                //Isi berita laporan
                Column(
                  children: [
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
                            const ProfileCard(
                              avatar: "assets/logo/PP.png",
                              name: "Jane Cooper",
                              username: "@nina_real",
                              tanggal: "12/05/2023",
                            ),
                            const SizedBox(height: 8),
                            const IsiLaporanItem(
                              laporan: "Dosen Matakuliah salah memasukan nilai",
                              tanggapan: null,
                            ),
                            const SizedBox(height: 8),
                            SelengkapnyaButton(onPressed: () {}),
                          ],
                        ),
                      )),
                    ),
                    const SizedBox(height: 13.0),
                    InteractionCard(),
                    const SizedBox(height: 22.5),
                  ],
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
                        ProfileCard(avatar: "assets/logo/PP.png", name: "Jane Cooper", username: "@nina_real", tanggal: "12/05/2023"),
                        const SizedBox(height: 8),
                        const IsiLaporanItem(
                          laporan: "Dosen Matakuliah salah memasukan nilai",
                          tanggapan: "Terimakasih telah menyuarakan melalui Complainz. Tim terkait sudah melakukan penyelidikan pada Dosen yang Bersangkutan",
                        ),
                        const SizedBox(height: 8),
                        SelengkapnyaButton(onPressed: () {}),
                      ],
                    ),
                  )),
                ),
                const SizedBox(height: 13.0),
                InteractionCard(),
                const SizedBox(height: 22.5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
