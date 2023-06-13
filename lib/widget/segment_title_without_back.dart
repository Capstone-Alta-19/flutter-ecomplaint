import 'package:flutter/material.dart';

import '../config/app_color.dart';

class SegmentTitleWithoutBack extends StatelessWidget {
  final String title;
  const SegmentTitleWithoutBack({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 260,
            child: Text(
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: AppColors.font,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                title),
          ),
        ],
      ),
    );
  }
}
