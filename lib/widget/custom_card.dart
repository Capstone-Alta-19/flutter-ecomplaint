import 'package:flutter/material.dart';
import 'package:flutter_complainzz_try/config/colors.dart';

class CardDashboard extends StatelessWidget {
  final String gambar;
  final String title;
  const CardDashboard({super.key, required this.gambar, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      color: AppColors.font,
      child: SizedBox(
        width: 349.71,
        height: 192,
        child: InkWell(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Image.asset(width: 160,height: 150,  gambar),
              ),
              Center(child :Text(
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.secondary100,
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