import 'package:flutter/material.dart';
import '../config/colors.dart';

class ProfileCard extends StatelessWidget {
  final String avatar;
  final String username;
  final String name;
  final String tanggal;

  const ProfileCard({super.key, required this.avatar, required this.username, required this.name, required this.tanggal});

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
                child: Image.asset(width: 40, avatar),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                    width: 206,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            username),
                      ],
                    )),
              ),
            ],
          ),
          Text(
              style: const TextStyle(
                color: AppColors.font,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              tanggal),
        ],
      ),
    );
  }
}
