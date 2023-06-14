import 'package:flutter/material.dart';
import '../../config/app_color.dart';
import '../../widget/buttons.dart';

class LaporanRahasia extends StatefulWidget {
  const LaporanRahasia({super.key});

  @override
  State<LaporanRahasia> createState() => _LaporanRahasiaState();
}

class _LaporanRahasiaState extends State<LaporanRahasia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {},
          child: const ImageIcon(
              size: 50,
              AssetImage(
                'assets/icons/BACK.png',
              )),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 100), //top: 246.59
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/icons/LockClosedOutline.png',
                width: 170.76,
              ),
            ),
            const Text(
              'Selesai, Laporan Terkirim \n Jenis Laporan Rahasia',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 224.92),
            ButtonPrimary(
              onPressed: () {},
              btnText: 'Lihat Laporan',
            ),
          ],
        ),
      ),
    );
  }
}
