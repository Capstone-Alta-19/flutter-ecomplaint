import 'package:complainz/config/app_color.dart';
import 'package:complainz/widgets/isi_laporan_item.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_card.dart';
import '../widgets/isi_komentar_item.dart';
import '../widgets/profile_card.dart';

class KomentarScreen extends StatefulWidget {
  const KomentarScreen({super.key});

  @override
  State<KomentarScreen> createState() => _KomentarScreenState();
}

class _KomentarScreenState extends State<KomentarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {},
            child: const ImageIcon(
              size: 50,
              AssetImage('assets/icons/BACK.png'),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Text(
                          'Komentar',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 33),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: CustomCard(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 16.5,
                              right: 20,
                              top: 20.5,
                              bottom: 12.5,
                            ),
                            child: Column(
                              children: const [
                                ProfileCard(
                                  avatar: 'assets/images/Profile.png',
                                  name: 'Jane Cooper',
                                  username: '@nina_real',
                                  tanggal: '2022',
                                ),
                                SizedBox(height: 8),
                                IsiLaporanItem(
                                  laporan:
                                      "Dosen Matakuliah salah memasukan nilai",
                                  tanggapan:
                                      "Terimakasih telah menyuarakan melalui Complainz. Tim terkait sudah melakukan penyelidikan pada Dosen yang Bersangkutan",
                                ),
                              ],
                            ),
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
                                ProfileCard(
                                  avatar: 'assets/images/Profile.png',
                                  name: 'Albert Flores',
                                  username: '2h',
                                  tanggal: '2022',
                                ),
                                SizedBox(height: 8),
                                IsiKomentarItem(
                                  laporan:
                                      "Dosen Matakuliah salah memasukan nilai",
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
                                ProfileCard(
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
                    child:
                        ImageIcon(AssetImage('assets/icons/ButtonComment.png')),
                  )),
            ],
          ),
        ));
  }
}
