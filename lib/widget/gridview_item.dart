import 'package:flutter/material.dart';
import 'package:flutter_complainzz_try/config/colors.dart';
import 'package:flutter_complainzz_try/widget/custom_card.dart';

class GridViewItem extends StatelessWidget {
  final String gambar;
  final String title;
  final void Function() onPressed;
  const GridViewItem({Key? key, required this.gambar, required this.title, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      color: AppColors.secondary20,
      child: SizedBox(
        width: 167,
        height: 224,
        child: InkWell(
          onTap: onPressed,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Image.asset(width: 160,height: 150,  gambar),
              ),
              Center(child :Text(
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.font,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      title),
              )

            ]),
        ),
      ),
    );
  }
}