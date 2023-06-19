import 'package:flutter/material.dart';
import 'package:flutter_ecomplaint/config/colors.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: AppColors.font,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Tentang Kami',
            style: TextStyle(
              color: AppColors.font,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/logo/icon-logo.png',
                  width: 150,
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Complainz adalah sebuah aplikasi yang dirancang untuk memudahkan mahasiswa dalam memberikan laporan dan aspirasi terkait dengan keadaan di kampus. Dengan menggunakan aplikasi ini, pengguna dapat dengan mudah membuat laporan terkait masalah kampus seperti fasilitas yang rusak, kurangnya fasilitas, perilaku tidak etis dari staf atau dosen, atau hal-hal lainnya yang mempengaruhi kualitas hidup mahasiswa di kampus.  Aplikasi Complainz juga menyediakan fitur untuk memberikan aspirasi atau saran terkait dengan pembangunan kampus dan program-program yang diadakan di kampus. Mahasiswa dapat memberikan masukan terkait dengan hal-hal yang dianggap perlu diperbaiki atau diadakan di kampus. Dalam aplikasi ini, setiap laporan atau aspirasi akan disimpan secara rapih dan dilengkapi dengan data waktu dan lokasi yang terdeteksi oleh perangkat pengguna. Hal ini akan memudahkan pihak kampus dalam mengidentifikasi dan menyelesaikan masalah yang dilaporkan oleh mahasiswa. Complainz juga memiliki fitur untuk melacak status laporan atau aspirasi yang telah diajukan oleh pengguna. Dengan demikian, pengguna dapat mengetahui apakah laporan atau aspirasinya',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
