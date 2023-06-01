import 'package:flutter/material.dart';

import '../config/colors.dart';

class IsiLaporanItem extends StatelessWidget {
  const IsiLaporanItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: AppColors.secondary100,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.font), "Laporan"),
                Text(style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.font), "Dosen Matakuliah salah memasukan nilai"),
              ],
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.secondary100),
                  textAlign: TextAlign.right,
                  "Tindak Lanjut",
                ),
                Text(
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.secondary100),
                  maxLines: 2,
                  textAlign: TextAlign.right,
                  "Terimakasih telah menyuarakan melalui Complainz. Tim terkait sudah melakukan penyelidikan pada Dosen yang Bersangkutan",
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
