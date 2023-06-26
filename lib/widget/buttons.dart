import 'package:flutter/material.dart';
import 'package:complainz/config/app_color.dart';

class ButtonPrimary extends StatelessWidget {
  final String btnText;
  final void Function()? onPressed;

  const ButtonPrimary({super.key, required this.btnText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(358, 40),
        backgroundColor: AppColors.primary,
      ),
      child: Text(
        btnText,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.secondary100),
      ),
    );
  }
}

class ButtonDelete extends StatelessWidget {
  final String btnText;
  final void Function()? onPressed;

  const ButtonDelete({super.key, required this.btnText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: FilledButton.tonal(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(358, 40),
          backgroundColor: const Color(0XFFF45050),
        ),
        child: Text(
          btnText,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.secondary100),
        ),
      ),
    );
  }
}

class ButtonLogout extends StatelessWidget {
  final String btnText;
  final void Function()? onPressed;

  const ButtonLogout({super.key, required this.btnText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: FilledButton.tonal(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Color(0XFF79747E),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(100)),
            minimumSize: const Size(358, 40),
            backgroundColor: Colors.transparent),
        child: Text(
          btnText,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.primary),
        ),
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