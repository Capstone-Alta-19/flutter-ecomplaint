import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {
  final int? maxLine;
  final int minLine;
  final TextInputType typeKeyboard;
  final String hinText;
  final InputBorder border;
  final double positionBottom;
  final double positionLeft;
  final Color globalColor;
  final BorderRadius borderRadius;
  final InkWell icons1;
  final InkWell icons2;

  const TextArea({
    super.key,
    required this.maxLine,
    required this.minLine,
    required this.typeKeyboard,
    required this.hinText,
    required this.border,
    required this.positionBottom,
    required this.positionLeft,
    required this.globalColor,
    required this.borderRadius,
    required this.icons1,
    required this.icons2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Stack(
        children: [
          TextFormField(
            maxLines: maxLine,
            minLines: minLine,
            keyboardType: typeKeyboard,
            decoration: InputDecoration(
              hintText: hinText,
              border: border,
            ),
          ),
          Positioned(
            bottom: positionBottom,
            left: positionLeft,
            child: Container(
              width: 88.8,
              height: 36.4,
              decoration: BoxDecoration(
                color: globalColor,
                borderRadius: borderRadius,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  icons1,
                  icons2,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Stack(
        children: [
          TextFormField(
            maxLines: null,
            minLines: 6,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: 'Ketik disini',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 1,
            child: Container(
              width: 88.8,
              height: 36.4,
              decoration: const BoxDecoration(
                color: AppColor.font,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.image, color: Colors.amber),
                  Icon(Icons.file_copy, color: Colors.amber),
                ],
              ),
            ),
          ),
        ],
      ),
    ); */
