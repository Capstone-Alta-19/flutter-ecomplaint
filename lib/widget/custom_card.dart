import 'package:flutter/material.dart';
import '../config/app_color.dart';

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

class CustomComentar extends StatelessWidget {
  final Widget child;
  const CustomComentar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.coment100,
        boxShadow: const [
          /* BoxShadow(
            blurRadius: 8,
            blurStyle: BlurStyle.outer,
            color: Color.fromRGBO(0, 0, 0, 0.25),
          ), */
        ],
      ),
      child: child,
    );
  }
}
