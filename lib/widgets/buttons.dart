import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:complainz/config/app_color.dart';

class ButtonPrimary extends StatelessWidget {
  final String btnText;
  final void Function()? onPressed;

  const ButtonPrimary(
      {super.key, required this.btnText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: onPressed,
      child: Text(
        btnText,
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.secondary100),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(358, 40),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}


 /* FilledButton.tonal(
        onPressed: _isFormFilled ? _submitForm : null,
        child: Text(
                  'Daftar',
                      style: GoogleFonts.poppins(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(358, 40),
                                backgroundColor: AppColor.font,
                              ),
                            ), */