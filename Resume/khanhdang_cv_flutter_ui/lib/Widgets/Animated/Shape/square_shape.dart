import 'dart:math' as math;

import 'package:flutter/material.dart';

class SquareShape extends StatefulWidget {
  final double? width;
  final double? height;
  final double? strokeWidth;
  final Color? lineColor;
  final StrokeCap? capStyle;

  const SquareShape(
      {super.key,
      this.width,
      this.height,
      this.strokeWidth,
      this.lineColor,
      this.capStyle});

  @override
  State<SquareShape> createState() => _SquareShapeState();
}

class _SquareShapeState extends State<SquareShape>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      reverseDuration: const Duration(seconds: 7),
      duration: const Duration(seconds: 7),
    )..forward();

    animation =
        Tween<double>(begin: math.pi, end: -math.pi).animate(controller);

    controller.addListener(() {
      if (controller.isCompleted) {
        controller.reset();
      }
      if (controller.isDismissed) {
        controller.forward();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: animation.value,
          child: Container(
            height: widget.height,
            width: widget.width,
            child: CustomPaint(
              painter: RectanglePainter(
                  capStyle: widget.capStyle,
                  strokeWidth: widget.strokeWidth,
                  lineColor: widget.lineColor),
            ),
          ),
        );
      },
    );
  }
}

class RectanglePainter extends CustomPainter {
  final double? strokeWidth;
  final Color? lineColor;
  final StrokeCap? capStyle;
  RectanglePainter({
    this.strokeWidth,
    this.lineColor,
    this.capStyle,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = strokeWidth ?? 10
      ..color = lineColor ?? Colors.red
      ..strokeCap = capStyle ?? StrokeCap.round
      ..style = PaintingStyle.stroke;

    final a = Offset(size.width * 1 / 4, size.height * 1 / 4);
    final b = Offset(size.width * 3 / 4, size.height * 3 / 4);

    final rect = Rect.fromPoints(a, b);

    // canvas.drawLine(Offset(size.width / 100, size.height * 1 / 2),
    //     Offset(size.width, size.height * 1 / 2), paint);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
