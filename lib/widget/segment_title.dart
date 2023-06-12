import 'package:flutter/material.dart';

import '../config/colors.dart';

class SegmentTitle extends StatelessWidget {
  final String title;
  const SegmentTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: const ImageIcon(AssetImage("assets/icons/arrow-back.png")),
              onPressed: () {
                Navigator.pop(context);
              }),
          SizedBox(
            width: 300,
            child: Text(
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: AppColors.font,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                title),
          ),

          // Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
        ],
      ),
    );
  }
}

class SegmentTitleTwoLine extends StatelessWidget {
  final String title;
  const SegmentTitleTwoLine({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              icon: const ImageIcon(AssetImage("assets/icons/arrow-back.png")),
              onPressed: () {
                Navigator.pop(context);
              }),
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

          // Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
        ],
      ),
    );
  }
}
