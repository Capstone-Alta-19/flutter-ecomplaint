import 'package:flutter/material.dart';
import 'package:flutter_ecomplaint/config/colors.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  const CustomCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.secondary20,
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            blurStyle: BlurStyle.outer,
            color: Color.fromRGBO(0, 0, 0, 0.25),
          ),
        ],
      ),
      child: child,
    );
  }
}
