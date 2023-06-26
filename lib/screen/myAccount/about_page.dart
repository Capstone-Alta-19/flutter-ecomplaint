import 'package:complainz/widget/segment_title.dart';
import 'package:flutter/material.dart';

import '../../config/app_color.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SegmentTitleTwoLine(title: "Tentang Kami"),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/logo/hd-icon-logo.png',
                      width: 200,
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      child: Text(
                        "Complainz adalah sebuah aplikasi yang dirancang untuk memudahkan mahasiswa dalam memberikan laporan dan aspirasi terkait dengan keadaan di kampus. Dengan menggunakan aplikasi ini, pengguna dapat dengan mudah membuat laporan terkait masalah kampus seperti fasilitas yang rusak, kurangnya fasilitas, perilaku tidak etis dari staf atau dosen, atau hal-hal lainnya yang mempengaruhi kualitas hidup mahasiswa di kampus. \n  \nAplikasi Complainz juga menyediakan fitur untuk memberikan aspirasi atau saran terkait dengan pembangunan kampus dan program-program yang diadakan di kampus. Mahasiswa dapat memberikan masukan terkait dengan hal-hal yang dianggap perlu diperbaiki atau diadakan di kampus. Dalam aplikasi ini, setiap laporan atau aspirasi akan disimpan secara rapih dan dilengkapi dengan data waktu dan lokasi yang terdeteksi oleh perangkat pengguna. Hal ini akan memudahkan pihak kampus dalam mengidentifikasi dan menyelesaikan masalah yang dilaporkan oleh mahasiswa.\n  \nComplainz juga memiliki fitur untuk melacak status laporan atau aspirasi yang telah diajukan oleh pengguna. Dengan demikian, pengguna dapat mengetahui apakah laporan atau aspirasinya telah diproses oleh pihak kampus atau belum. \n  \nSecara keseluruhan, Complainz adalah aplikasi yang sangat berguna bagi mahasiswa untuk memberikan masukan dan melaporkan masalah di kampus secara efektif dan efisien.",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.primary),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
