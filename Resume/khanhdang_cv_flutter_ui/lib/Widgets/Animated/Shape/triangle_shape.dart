import 'dart:math' as math;

import 'package:flutter/material.dart';

class TriagnleShape extends StatefulWidget {
  final double? width;
  final double? height;
  final double? strokeWidth;
  final Color? lineColor;
  final StrokeCap? capStyle;

  const TriagnleShape(
      {super.key,
      this.width,
      this.height,
      this.strokeWidth,
      this.lineColor,
      this.capStyle});

  @override
  State<TriagnleShape> createState() => _TriagnleShapeState();
}

class _TriagnleShapeState extends State<TriagnleShape>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      reverseDuration: const Duration(seconds: 5),
      duration: const Duration(seconds: 5),
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
              painter: TrianglePainter(
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

class TrianglePainter extends CustomPainter {
  final double? strokeWidth;
  final Color? lineColor;
  final StrokeCap? capStyle;
  TrianglePainter({
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

    final path = Path();
    path.moveTo(size.width * 1 / 2, size.height * 1 / 4);
    path.lineTo(size.width * 1 / 6, size.height * 3 / 4);
    path.lineTo(size.width * 5 / 6, size.height * 3 / 4);
    path.close();
    // canvas.drawLine(Offset(size.width / 100, size.height * 1 / 2),
    //     Offset(size.width, size.height * 1 / 2), paint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
