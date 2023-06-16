import 'package:complainz/config/app_color.dart';
import 'package:complainz/widget/isi_laporan_item_komen.dart';
import 'package:complainz/widget/segment_title.dart';
import 'package:flutter/material.dart';

import '../../widget/custom_card.dart';
import '../../widget/isi_komentar_item.dart';
import '../../widget/profile_card_komen.dart';

class KomentarPage extends StatefulWidget {
  const KomentarPage({super.key});

  @override
  State<KomentarPage> createState() => _KomentarPageState();
}

class _KomentarPageState extends State<KomentarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(),
        ),
        body: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SegmentTitle(title: "Komentar"),
                  SizedBox(height: 33),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: CustomCard(
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 16.5,
                                  right: 20,
                                  top: 20.5,
                                ),
                                child: ProfileCardKomen(
                                  avatar: 'assets/images/Profile.png',
                                  name: 'Jane Cooper',
                                  username: '@nina_real',
                                  tanggal: '20/03/2022',
                                ),
                              ),
                              SizedBox(height: 8),
                              IsiLaporanItemKomen(
                                laporan: "Dosen Matakuliah salah memasukan nilai",
                                tanggapan: "Terimakasih telah menyuarakan melalui Complainz. Tim terkait sudah melakukan penyelidikan pada Dosen yang Bersangkutan",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: CustomComentar(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 16.5,
                              right: 20,
                              top: 20.5,
                              bottom: 12.5,
                            ),
                            child: Column(
                              children: const [
                                ProfileCardKomen(
                                  avatar: 'assets/images/Profile.png',
                                  name: 'Albert Flores',
                                  username: '2h',
                                  tanggal: '2022',
                                ),
                                SizedBox(height: 8),
                                IsiKomentarItem(
                                  laporan: "Dosen Matakuliah salah memasukan nilai",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: CustomComentar(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 16.5,
                              right: 20,
                              top: 20.5,
                              bottom: 12.5,
                            ),
                            child: Column(
                              children: const [
                                ProfileCardKomen(
                                  avatar: 'assets/images/Profile.png',
                                  name: 'Savannah Nguyen',
                                  username: '2h',
                                  tanggal: '2022',
                                ),
                                SizedBox(height: 8),
                                IsiKomentarItem(
                                  laporan: "samaa bangett..",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.yellow, // Warna kuning
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Tambahkan Komentar...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: ImageIcon(AssetImage('assets/icons/ButtonComment.png')),
                  )),
            ],
          ),
        ));
  }
}
