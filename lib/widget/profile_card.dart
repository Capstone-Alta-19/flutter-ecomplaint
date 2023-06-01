import 'package:flutter/material.dart';
import '../config/colors.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                child: Image.asset(width: 40, "assets/logo/PP.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                    width: 206,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                            style: TextStyle(
                              color: AppColors.font,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                            "Jane Cooper"),
                        Text(
                            style: TextStyle(
                              color: AppColors.font,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            "@nina_real"),
                      ],
                    )),
              ),
            ],
          ),
          const Text(
              style: TextStyle(
                color: AppColors.font,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              "12/05/2023"),
        ],
      ),
    );
  }
}
