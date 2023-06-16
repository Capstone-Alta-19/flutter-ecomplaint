import 'package:flutter/material.dart';
import '../config/app_color.dart';

class SelengkapnyaButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  const SelengkapnyaButton({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: const ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 40))),
      onPressed: onPressed,
      child: Text(
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.fontsecondary,
          ),
          title),
    );
  }
}
