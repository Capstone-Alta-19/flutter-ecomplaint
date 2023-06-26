import 'package:flutter/material.dart';
import '../config/app_color.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;

  final Widget icon;
  const CustomAlertDialog({super.key, required this.title, required this.icon});

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
              const SizedBox(height: 20),
              SizedBox(
                child: icon,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary20,
                  ),
                  title),
            ],
          )),
        ),
      ),
    );
  }
}

class CustomLoadingDialog extends StatelessWidget {
  final String title;

  const CustomLoadingDialog({
    super.key,
    required this.title,
  });

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
              const SizedBox(height: 20),
              const CircularProgressIndicator(),
              const SizedBox(
                height: 16,
              ),
              Text(
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary20,
                  ),
                  title),
            ],
          )),
        ),
      ),
    );
  }
}
