import 'package:complainz/screen/laporan/isi_berita_laporan_page.dart';
import 'package:flutter/material.dart';

import '../../widget/long_laporan_item.dart';
import '../../widget/segment_title.dart';

class BeritaLaporanPage extends StatefulWidget {
  const BeritaLaporanPage({Key? key}) : super(key: key);

  @override
  State<BeritaLaporanPage> createState() => _BeritaLaporanPageState();
}

class _BeritaLaporanPageState extends State<BeritaLaporanPage> {
  @override
  Widget build(BuildContext context) {
    GlobalKey segmenTitle = GlobalKey();
    GlobalKey laporanItemSarana = GlobalKey();
    GlobalKey laporanItemDosen = GlobalKey();
    GlobalKey laporanItemKuliah = GlobalKey();
    GlobalKey laporanItemOrmawa = GlobalKey();
    GlobalKey laporanItemMahasiswa = GlobalKey();
    GlobalKey laporanItemLainnya = GlobalKey();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SegmentTitle(
                  key: segmenTitle,
                  title: "Laporan",
                ),
                const SizedBox(
                  height: 87.0,
                ),
                LongLaporanItem(
                  key: laporanItemDosen,
                  gambar: "assets/logo/gambar-dosen.png",
                  title: "Dosen dan Staff Akademik",
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return const IsiBeritaLaporanPage();
                          },
                          transitionDuration: const Duration(milliseconds: 300),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            final tween = Tween(
                              begin: const Offset(2, 0),
                              end: Offset.zero,
                            );
                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          }),
                    );
                  },
                ),
                const SizedBox(height: 24),
                LongLaporanItem(
                  key: laporanItemSarana,
                  gambar: "assets/logo/gambar-sarana-prasarana.png",
                  title: "Sarana dan Prasarana",
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return const IsiBeritaLaporanPage();
                          },
                          transitionDuration: const Duration(milliseconds: 300),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            final tween = Tween(
                              begin: const Offset(2, 0),
                              end: Offset.zero,
                            );
                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          }),
                    );
                  },
                ),
                const SizedBox(height: 24),
                LongLaporanItem(
                  key: laporanItemKuliah,
                  gambar: "assets/logo/gambar-sistem-perkuliahan.png",
                  title: "Sistem Perkuliahan",
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return const IsiBeritaLaporanPage();
                          },
                          transitionDuration: const Duration(milliseconds: 300),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            final tween = Tween(
                              begin: const Offset(2, 0),
                              end: Offset.zero,
                            );
                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          }),
                    );
                  },
                ),
                const SizedBox(height: 24),
                LongLaporanItem(
                  key: laporanItemOrmawa,
                  gambar: "assets/logo/gambar-ormawa.png",
                  title: "Organisasi Mahasiswa",
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return const IsiBeritaLaporanPage();
                          },
                          transitionDuration: const Duration(milliseconds: 300),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            final tween = Tween(
                              begin: const Offset(2, 0),
                              end: Offset.zero,
                            );
                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          }),
                    );
                  },
                ),
                const SizedBox(height: 24),
                LongLaporanItem(
                  key: laporanItemMahasiswa,
                  gambar: "assets/logo/gambar-sesam-mahasiswa.png",
                  title: "Sesama Mahasiswa",
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return const IsiBeritaLaporanPage();
                          },
                          transitionDuration: const Duration(milliseconds: 300),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            final tween = Tween(
                              begin: const Offset(2, 0),
                              end: Offset.zero,
                            );
                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          }),
                    );
                  },
                ),
                const SizedBox(height: 24),
                LongLaporanItem(
                  key: laporanItemLainnya,
                  gambar: "assets/logo/gambar-lainnya.png",
                  title: "Lainnya",
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return const IsiBeritaLaporanPage();
                          },
                          transitionDuration: const Duration(milliseconds: 300),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            final tween = Tween(
                              begin: const Offset(2, 0),
                              end: Offset.zero,
                            );
                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          }),
                    );
                  },
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
