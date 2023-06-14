import 'package:flutter/material.dart';
import '../config/app_color.dart';

class SelengkapnyaButton extends StatelessWidget {
  final void Function() onPressed;
  const SelengkapnyaButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: const ButtonStyle(
          fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 40))),
      onPressed: onPressed,
      child: const Text(
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.fontsecondary,
          ),
          "Selengkapnya"),
    );
  }
}
