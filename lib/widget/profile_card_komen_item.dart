import 'package:flutter/material.dart';

import '../config/app_color.dart';

class ProfileCardKomenitem extends StatelessWidget {
  final String avatar;
  final String waktu;
  final String name;
  final String username;

  const ProfileCardKomenitem({super.key, required this.avatar, required this.waktu, required this.name, required this.username});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                child: Image.asset(width: 40, avatar),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        style: const TextStyle(
                          color: AppColors.font,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        name),
                    Text(
                        style: const TextStyle(
                          color: AppColors.font,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        waktu),
                  ],
                )),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2, left: 8),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                  style: const TextStyle(
                    color: AppColors.font,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  username),
            ),
          ),
        ],
      ),
    );
  }
}
