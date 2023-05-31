import 'package:flutter/material.dart';

import '../config/colors.dart';

class LongLaporanItem extends StatelessWidget {
  final String gambar;
  final String title;
  final void Function() onPressed;
  const LongLaporanItem({Key? key, required this.gambar, required this.title, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 19),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.secondary20,
          boxShadow: [
            const BoxShadow(
              blurRadius: 8,
              blurStyle: BlurStyle.outer,
              color: Color.fromRGBO(0, 0, 0, 0.25),
            ),
          ],
        ),
        // color: AppColors.secondary20,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onPressed,
          child: Row(
            children: [
              Image.asset(width: 94, height: 124, gambar),
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 0, 0, 0),
                child: SizedBox(
                  width: 198,
                  child: Text(
                      style: const TextStyle(
                        color: AppColors.font,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      title),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
