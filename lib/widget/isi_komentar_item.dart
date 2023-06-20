import 'package:flutter/material.dart';
import '../config/app_color.dart';

class IsiKomentarItem extends StatelessWidget {
  final String laporan;
  const IsiKomentarItem({super.key, required this.laporan});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          /*  decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ), */
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.font), laporan),
                // "Dosen Matakuliah salah memasukan nilai"
              ],
            ),
          ),
        ),
      ],
    );
  }
}
