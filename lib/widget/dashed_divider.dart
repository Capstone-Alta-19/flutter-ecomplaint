import 'package:flutter/material.dart';

class DashedDivider extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  final double gapWidth;
  final double height;

  const DashedDivider({
    super.key,
    this.color = Colors.black,
    this.strokeWidth = 1.0,
    this.gapWidth = 4.0,
    this.height = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedDividerPainter(
        color: color,
        strokeWidth: strokeWidth,
        gapWidth: gapWidth,
        height: height,
      ),
      child: Container(
        height: height,
      ),
    );
  }
}

class _DashedDividerPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gapWidth;
  final double height;

  _DashedDividerPainter({
    required this.color,
    required this.strokeWidth,
    required this.gapWidth,
    required this.height,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    const dashWidth = 4.0; // Panjang garis putus-putus
    final dashSpace = gapWidth; // Jarak antar garis putus-putus

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, height / 2),
        Offset(startX + dashWidth, height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
