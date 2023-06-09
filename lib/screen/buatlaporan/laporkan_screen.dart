import 'package:complainz/config/app_color.dart';
import 'package:complainz/screen/buatlaporan/pengaduan_screen.dart';
import 'package:complainz/widget/cards.dart';
import 'package:flutter/material.dart';

class LaporkanPage extends StatefulWidget {
  const LaporkanPage({super.key});

  @override
  State<LaporkanPage> createState() => _LaporkanPageState();
}

class _LaporkanPageState extends State<LaporkanPage> {
  int _selectedIndex = 0;
  int selectedPos = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 33),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 111, right: 16),
                child: Text(
                  'Pengaduan!',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 69.35),
              Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Cards(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PengaduanPage()));
                    },
                    assets: Image.asset(
                      'assets/images/pengaduan.png',
                      fit: BoxFit.cover,
                    ),
                    flex1: 1,
                    flex2: 2,
                    cardText: 'Pengaduan',
                    paddingImage: const EdgeInsets.only(left: 10),
                    paddingText: const EdgeInsets.only(left: 24, right: 10),
                  )),
              const SizedBox(height: 16),
              Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: CustomCards(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AspirasiPage()));
                    },
                    flexText: 2,
                    flexImage: 1,
                    assets: Image.asset(
                      'assets/images/aspirasi.png',
                      fit: BoxFit.cover,
                    ),
                  )),
              const SizedBox(height: 99.5),
              const Text(
                'Pilih Kategori \n Laporan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
