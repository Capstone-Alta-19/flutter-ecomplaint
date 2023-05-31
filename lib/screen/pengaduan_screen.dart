import 'package:complainz/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';

class PengaduanPage extends StatefulWidget {
  const PengaduanPage({super.key});

  @override
  State<PengaduanPage> createState() => _PengaduanPageState();
}

class _PengaduanPageState extends State<PengaduanPage> {
  String? gender;

  int tag = 1;
  List<String> tags = [];

  List<String> options = [
    'Dosen',
    'Akademik',
    'Sarana dan Prasarana',
    'Organisasi Mahasiswa',
    'Mahasiswa',
    'Lainnya'
  ];
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
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Stack(
                children: [
                  Container(
                    child: TextFormField(
                      maxLines: null,
                      minLines: 6,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Ketik disini',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 1,
                    child: Container(
                      width: 88.8,
                      height: 36.4,
                      decoration: const BoxDecoration(
                        color: AppColor.font,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
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
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 170,
              width: 358,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: ChipsChoice.single(
                    value: tag,
                    onChanged: (val) => setState(() => tag = val),
                    choiceItems: C2Choice.listFrom(
                      source: options,
                      value: (i, v) => i,
                      label: (i, v) => v,
                    ),
                    choiceActiveStyle: const C2ChoiceStyle(
                      color: Color(0XFF36A8F4),
                      borderColor: Color(0XFF36A8F4),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    choiceStyle: const C2ChoiceStyle(
                      color: Color(0XFF1C1C1C),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    wrapped: true,
                  ),
                ),
              ),
            ),
            SizedBox(height: 31.18),
            Column(
              children: [
                Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 14)),
                    Text(
                      'Jenis Laporan',
                      style: GoogleFonts.poppins(
                        color: AppColor.font,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text("Terbuka"),
                  value: "terbuka",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("Rahasia"),
                  value: "rahasia",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
              ],
            ),
            //SizedBox(height: 152.89),
            SizedBox(height: 10),
            Column(
              children: [
                //Padding(padding: EdgeInsets.only(left: 16, right: 16)),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: FilledButton.tonal(
                    onPressed: () {},
                    child: Text(
                      'Daftar',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(358, 40),
                      backgroundColor: AppColor.font,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
