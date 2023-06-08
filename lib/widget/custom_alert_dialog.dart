import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../config/colors.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;

  final String icon;
  const CustomAlertDialog({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.primary,
      child: Container(
        height: 190,
        child: Padding(
          padding: EdgeInsets.fromLTRB(24, 20, 24, 20),
          child: Center(
              child: Column(
            children: [
              SizedBox(height: 20),
              ImageIcon(color: Colors.yellow, size: 49, AssetImage(icon)),
              SizedBox(
                height: 16,
              ),
              Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
