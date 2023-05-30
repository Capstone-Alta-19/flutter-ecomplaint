import 'package:complainz/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PengaduanPage extends StatefulWidget {
  const PengaduanPage({super.key});

  @override
  State<PengaduanPage> createState() => _PengaduanPageState();
}

class _PengaduanPageState extends State<PengaduanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 111)),
                Text(
                  'Pengaduan',
                  style: GoogleFonts.poppins(
                    color: AppColor.font,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 36),
            Column(
              children: [
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 16)),
                    Text(
                      'Masukkan Pesan Anda',
                      style: GoogleFonts.poppins(
                        color: AppColor.font,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  child: TextFormField(
                    maxLines: null,
                    minLines: 6,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Ketik disini',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 2,
                  left: 0,
                  child: Container(
                    width: 79,
                    height: 26,
                    decoration: BoxDecoration(
                      color: AppColor.font,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        /*  IconButton(onPressed: () {}, icon: Icon(Icons.image, color: Colors.amber)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.file_copy, color: Colors.amber)), */
                        Icon(Icons.image, color: Colors.amber),
                        Icon(Icons.file_copy, color: Colors.amber),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 38.6),
            Column(
              children: [
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 14)),
                    Text(
                      'Pilih Kategori',
                      style: GoogleFonts.poppins(
                        color: AppColor.font,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
