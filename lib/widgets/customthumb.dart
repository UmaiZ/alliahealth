import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CustomThumbShape extends SliderComponentShape {
  final ui.Image? thumbImage;

  CustomThumbShape(this.thumbImage);

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(40, 40);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;

    if (thumbImage != null) {
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(90 * 3.14159 / 180); // Rotate 90 degrees
      final imageRect =
          Rect.fromCenter(center: Offset(0, 0), width: 40, height: 40);
      canvas.drawImageRect(
        thumbImage!,
        Rect.fromLTWH(
            0, 0, thumbImage!.width.toDouble(), thumbImage!.height.toDouble()),
        imageRect,
        Paint(),
      );
      canvas.restore();
    } else {
      final paint = Paint()..color = Colors.teal;
      canvas.drawCircle(center, 20, paint);
    }
  }
}
