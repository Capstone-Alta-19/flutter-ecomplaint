import 'package:flutter/material.dart';
import 'package:flutter_ecomplaint/config/colors.dart';
import 'package:flutter_ecomplaint/widget/long_laporan_item.dart';

class BeritaLaporanPage extends StatefulWidget {
  const BeritaLaporanPage({Key? key}) : super(key: key);

  @override
  _BeritaLaporanPageState createState() => _BeritaLaporanPageState();
}

class _BeritaLaporanPageState extends State<BeritaLaporanPage> {
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: const ImageIcon(AssetImage("assets/icons/arrow-back.png")),
                          onPressed: () {
                            // Navigator.pop(context);
                          }),
                      const Text(
                          style: TextStyle(
                            color: AppColors.font,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                          "Laporan"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 87.0,
                ),
                LongLaporanItem(gambar: "assets/logo/gambar-dosen.png", title: "Dosen dan Staff Akademik", onPressed: () {}),
                const SizedBox(height: 24),
                LongLaporanItem(gambar: "assets/logo/gambar-sarana-prasarana.png", title: "Sarana dan Prasarana", onPressed: () {}),
                const SizedBox(height: 24),
                LongLaporanItem(gambar: "assets/logo/gambar-sistem-perkuliahan.png", title: "Sistem Perkuliahan", onPressed: () {}),
                const SizedBox(height: 24),
                LongLaporanItem(gambar: "assets/logo/gambar-ormawa.png", title: "Organisasi Mahasiswa", onPressed: () {}),
                const SizedBox(height: 24),
                LongLaporanItem(gambar: "assets/logo/gambar-sesam-mahasiswa.png", title: "Sesama Mahasiswa", onPressed: () {}),
                const SizedBox(height: 24),
                LongLaporanItem(
                  gambar: "assets/logo/gambar-lainnya.png",
                  title: "Lainnya",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
