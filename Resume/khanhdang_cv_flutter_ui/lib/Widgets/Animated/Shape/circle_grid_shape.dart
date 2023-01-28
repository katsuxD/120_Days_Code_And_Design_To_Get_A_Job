import 'package:flutter/material.dart';

class CircleGridShape extends StatefulWidget {
  final double? width;
  final double? height;
  final Color? color;
  final int? crossAxisCount;
  final int? itemCount;
  final bool? isAnimatedHorizontal;
  final double? gap;
  const CircleGridShape(
      {super.key,
      this.width,
      this.height,
      this.color,
      this.crossAxisCount,
      this.itemCount,
      this.isAnimatedHorizontal,
      this.gap});

  @override
  State<CircleGridShape> createState() => _CircleGridShapeState();
}

class _CircleGridShapeState extends State<CircleGridShape>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      reverseDuration: const Duration(seconds: 10),
      duration: const Duration(seconds: 10),
    )..forward();

    animation = Tween<double>(begin: 0, end: -100).animate(controller);

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
        return Transform.translate(
          offset: widget.isAnimatedHorizontal ?? true
              ? Offset(animation.value, 0)
              : Offset(0, animation.value),
          child: Container(
            height: widget.height,
            width: widget.width,
            child: GridView.builder(
              itemCount: widget.itemCount ?? 12,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.crossAxisCount ?? 3),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(widget.gap ?? 2.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.color ?? Colors.blue,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
