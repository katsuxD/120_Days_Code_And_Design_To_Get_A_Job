import 'dart:math' as math;

import 'package:flutter/material.dart';

class CircleShape extends StatefulWidget {
  final double? radius;
  final double? strokeWidth;
  final Color? lineColor;
  final StrokeCap? capStyle;
  final StrokeJoin? strokeJoin;
  final PaintingStyle? paintingStyle;

  const CircleShape(
      {super.key,
      this.strokeWidth,
      this.lineColor,
      this.capStyle,
      this.radius,
      this.strokeJoin,
      this.paintingStyle});

  @override
  State<CircleShape> createState() => _CircleShapeState();
}

class _CircleShapeState extends State<CircleShape>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      reverseDuration: const Duration(seconds: 3),
      duration: const Duration(seconds: 3),
    )..forward();

    animation = Tween<double>(begin: 1, end: 0.5).animate(controller);

    controller.addListener(() {
      if (controller.isCompleted) {
        controller.reverse();
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
        return Transform.scale(
          scaleX: animation.value,
          scaleY: animation.value,
          child: Container(
            height: widget.radius ?? 100,
            width: widget.radius ?? 100,
            child: CustomPaint(
              painter: CirclePainter(
                  radius: widget.radius,
                  capStyle: widget.capStyle,
                  lineColor: widget.lineColor,
                  strokeWidth: widget.strokeWidth),
            ),
          ),
        );
      },
    );
  }
}

class CirclePainter extends CustomPainter {
  final double? radius;
  final double? strokeWidth;
  final Color? lineColor;
  final StrokeCap? capStyle;
  CirclePainter({
    this.radius,
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

    final rect = Rect.fromPoints(Offset(size.width / 100, size.height / 100),
        Offset(size.width, size.height));

    canvas.drawCircle(Offset(size.width, size.height), size.width, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
