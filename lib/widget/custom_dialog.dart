import 'package:flutter/material.dart';
import '../config/app_color.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String confirm;
  final String icon;
  final void Function() onPressed;
  const CustomDialog(
      {super.key,
      required this.title,
      required this.confirm,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.primary,
      child: SizedBox(
        height: 190,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
          child: Center(
              child: Column(
            children: [
              ImageIcon(color: Colors.yellow, size: 46, AssetImage(icon)),
              const SizedBox(
                height: 8,
              ),
              Text(
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary20,
                  ),
                  title),
              const SizedBox(
                height: 2,
              ),
              SizedBox(
                width: 274,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: onPressed,
                        child: Text(
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.secondary100,
                            ),
                            confirm)),
                    FilledButton(
                        style: const ButtonStyle(
                            minimumSize: MaterialStatePropertyAll(Size(83, 40)),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.yellow)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                            "Tidak"))
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
