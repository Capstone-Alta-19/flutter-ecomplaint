import 'package:complainz/config/app_color.dart';
import 'package:complainz/screen/buatlaporan/laporan_rahasia.dart';
import 'package:complainz/widget/segment_title.dart';
import 'package:complainz/widget/textarea.dart';
import 'package:flutter/material.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:provider/provider.dart';
import '../../Provider/create_aspirasi_provider.dart';
import '../../Provider/create_complaint_provider.dart';
import 'laporan_terbuka.dart';

class PengaduanPage extends StatefulWidget {
  const PengaduanPage({super.key});

  @override
  State<PengaduanPage> createState() => _PengaduanPageState();
}

class _PengaduanPageState extends State<PengaduanPage> {
  final controllerPengaduan = TextEditingController();

  bool? jnslaporan = true;
  String type = "Complaint";
  bool isButtonEnabled = false;
  int? tag = null;
  List<String> tags = [];
  List<String> options = [
    'Dosen dan Staff Akademik',
    'Sarana dan Prasarana',
    'Organisasi Mahasiswa',
    'Sistem Perkuliahan',
    'Mahasiswa',
    'Lainnya',
  ];

  @override
  void initState() {
    super.initState();
    jnslaporan = null; // Mengatur nilai awal menjadi null
  }

  @override
  void dispose() {
    controllerPengaduan.dispose();
    super.dispose();
  }

  void _submitForm() async {
    final provider = Provider.of<CreateComplaintViewModel>(context, listen: false);

    // Menampilkan indikator loading
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    await provider.createResultComplaint(
      type: type,
      category_id: tag! + 1,
      photo_url: "",
      video_url: "",
      description: controllerPengaduan.text,
      is_public: jnslaporan!,
    );

    Navigator.pop(context); // Menutup dialog indikator loading

    if (provider.isLoading) {
    } else if (!provider.isCreate) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Complaint Gagal")),
      );
    } else {
      if (jnslaporan == true) {
        // Jika laporan adalah rahasia, arahkan ke halaman utama (Home)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LaporanTerbuka()),
        );
      } else {
        // Jika laporan bukan rahasia, arahkan ke halaman Laporan Terbuka
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LaporanRahasia()),
        );
      }
    }
  }

  void checkButtonStatus() {
    if (controllerPengaduan.text.isNotEmpty && options != null && jnslaporan != null) {
      setState(() {
        isButtonEnabled = true; // Mengaktifkan tombol jika ketiga kondisi terpenuhi
      });
    } else {
      setState(() {
        isButtonEnabled = false; // Menonaktifkan tombol jika salah satu kondisi tidak terpenuhi
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SegmentTitle(title: 'Pengaduan'),
            const SizedBox(height: 30),
            Column(children: [
              Row(
                children: const [
                  Padding(padding: EdgeInsets.only(left: 16)),
                  Text(
                    'Masukkan Pesan Anda',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ]),
            const SizedBox(height: 8),
            TextArea(
              controller: controllerPengaduan,
              maxLine: null,
              minLine: 6,
              typeKeyboard: TextInputType.multiline,
              hinText: 'Ketik disini',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              positionBottom: 0,
              positionLeft: 1,
              globalColor: AppColors.primary,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(0), topRight: Radius.circular(30), bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
              icons1: InkWell(
                onTap: () {},
                child: Image.asset('assets/icons/Img_box.png', width: 20.4),
              ),
              icons2: InkWell(
                onTap: () {},
                child: Image.asset('assets/icons/Video_file.png', width: 20.4),
              ),
              /* icons1: const Icon(Icons.image, color: Colors.amber),
              icons2: const Icon(Icons.file_copy, color: Colors.amber), */
            ),
            const SizedBox(height: 38.6),
            Column(children: [
              Row(
                children: const [
                  Padding(padding: EdgeInsets.only(left: 14)),
                  Text(
                    'Pilih Kategori',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              )
            ]),
            const SizedBox(height: 8),
            SizedBox(
              //height: 128,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ChipsChoice.single(
                    value: tag,
                    onChanged: (val) {
                      setState(() {
                        tag = val;
                        checkButtonStatus();
                      });
                    },
                    choiceItems: C2Choice.listFrom(
                      source: options,
                      value: (i, v) => i,
                      label: (i, v) => v,
                    ),
                    choiceActiveStyle: const C2ChoiceStyle(
                      borderShape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      showCheckmark: false,
                      backgroundColor: AppColors.primary,
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
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
            const SizedBox(height: 31.18),
            Column(
              children: [
                Row(
                  children: const [
                    Padding(padding: EdgeInsets.only(left: 14)),
                    Text(
                      'Jenis Laporan',
                      style: TextStyle(
                        color: AppColors.primary,
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
                  title: const Text("Terbuka"),
                  value: true,
                  groupValue: jnslaporan,
                  onChanged: (value) {
                    setState(() {
                      jnslaporan = value;
                      checkButtonStatus();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Rahasia"),
                  value: false,
                  groupValue: jnslaporan,
                  onChanged: (value) {
                    setState(() {
                      jnslaporan = value;
                      checkButtonStatus();
                    });
                  },
                ),
              ],
            ),
            //SizedBox(height: 152.89),
            const SizedBox(height: 10),
            Column(
              children: [
                //Padding(padding: EdgeInsets.only(left: 16, right: 16)),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: FilledButton.tonal(
                    //onPressed: isButtonEnabled ? () {} : null,
                    onPressed: isButtonEnabled ? _submitForm : null,
                    child: const Text(
                      'Daftar',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(358, 40),
                      backgroundColor: AppColors.primary,
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

//Aspirasi Page
class AspirasiPage extends StatefulWidget {
  const AspirasiPage({super.key});

  @override
  State<AspirasiPage> createState() => _AspirasiPageState();
}

class _AspirasiPageState extends State<AspirasiPage> {
  final controllerAspirasi = TextEditingController();

  bool? jnslaporanaspirasi = true;
  String type = "Aspiration";
  bool isButtonEnabled = false;
  int? tag = null;
  List<String> tags = [];
  List<String> options = [
    'Dosen dan Staff Akademik',
    'Sarana dan Prasarana',
    'Organisasi Mahasiswa',
    'Sistem Perkuliahan',
    'Mahasiswa',
    'Lainnya',
  ];

  @override
  void initState() {
    super.initState();
    jnslaporanaspirasi = null; // Mengatur nilai awal menjadi null
  }

  @override
  void dispose() {
    controllerAspirasi.dispose();
    super.dispose();
  }

  void _submitForm() async {
    final provider = Provider.of<CreateAspirasiViewModel>(context, listen: false);

    // Menampilkan indikator loading
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    await provider.createResultAspirasi(
      type: type,
      category_id: tag! + 1,
      photo_url: "",
      video_url: "",
      description: controllerAspirasi.text,
      is_public: jnslaporanaspirasi!,
    );

    Navigator.pop(context); // Menutup dialog indikator loading

    if (provider.isLoading) {
    } else if (!provider.isCreate) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Complaint Gagal")),
      );
    } else {
      if (jnslaporanaspirasi == true) {
        // Jika laporan adalah rahasia, arahkan ke halaman utama (Home)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LaporanTerbuka()),
        );
      } else {
        // Jika laporan bukan rahasia, arahkan ke halaman Laporan Terbuka
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LaporanRahasia()),
        );
      }
    }
  }

  void checkButtonStatus() {
    if (controllerAspirasi.text.isNotEmpty && options != null && jnslaporanaspirasi != null) {
      setState(() {
        isButtonEnabled = true; // Mengaktifkan tombol jika ketiga kondisi terpenuhi
      });
    } else {
      setState(() {
        isButtonEnabled = false; // Menonaktifkan tombol jika salah satu kondisi tidak terpenuhi
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SegmentTitle(title: "Aspirasi"),
            const SizedBox(height: 30),
            Column(children: [
              Row(
                children: const [
                  Padding(padding: EdgeInsets.only(left: 16)),
                  Text(
                    'Masukkan Pesan Anda',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ]),
            const SizedBox(height: 8),
            TextArea(
              controller: controllerAspirasi,
              maxLine: null,
              minLine: 6,
              typeKeyboard: TextInputType.multiline,
              hinText: 'Ketik disini',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              positionBottom: 0,
              positionLeft: 1,
              globalColor: AppColors.primary,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(0), topRight: Radius.circular(30), bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
              icons1: InkWell(
                onTap: () {},
                child: Image.asset('assets/icons/Img_box.png', width: 20.4),
              ),
              icons2: InkWell(
                onTap: () {},
                child: Image.asset('assets/icons/Video_file.png', width: 20.4),
              ),
              /* icons1: const Icon(Icons.image, color: Colors.amber),
              icons2: const Icon(Icons.file_copy, color: Colors.amber), */
            ),
            const SizedBox(height: 38.6),
            Column(children: [
              Row(
                children: const [
                  Padding(padding: EdgeInsets.only(left: 14)),
                  Text(
                    'Pilih Kategori',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              )
            ]),
            const SizedBox(height: 8),
            SizedBox(
              //height: 128,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ChipsChoice.single(
                    value: tag,
                    onChanged: (val) {
                      setState(() {
                        tag = val;
                        checkButtonStatus();
                      });
                    },
                    choiceItems: C2Choice.listFrom(
                      source: options,
                      value: (i, v) => i,
                      label: (i, v) => v,
                    ),
                    choiceActiveStyle: const C2ChoiceStyle(
                      borderShape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      showCheckmark: false,
                      backgroundColor: AppColors.primary,
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
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
            const SizedBox(height: 31.18),
            Column(
              children: [
                Row(
                  children: const [
                    Padding(padding: EdgeInsets.only(left: 14)),
                    Text(
                      'Jenis Laporan',
                      style: TextStyle(
                        color: AppColors.primary,
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
                  title: const Text("Terbuka"),
                  value: true,
                  groupValue: jnslaporanaspirasi,
                  onChanged: (value) {
                    setState(() {
                      jnslaporanaspirasi = value;
                      checkButtonStatus();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Rahasia"),
                  value: false,
                  groupValue: jnslaporanaspirasi,
                  onChanged: (value) {
                    setState(() {
                      jnslaporanaspirasi = value;
                      checkButtonStatus();
                    });
                  },
                ),
              ],
            ),
            //SizedBox(height: 152.89),
            const SizedBox(height: 10),
            Column(
              children: [
                //Padding(padding: EdgeInsets.only(left: 16, right: 16)),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: FilledButton.tonal(
                    onPressed: isButtonEnabled ? _submitForm : null,
                    child: const Text(
                      'Daftar',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(358, 40),
                      backgroundColor: AppColors.primary,
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
