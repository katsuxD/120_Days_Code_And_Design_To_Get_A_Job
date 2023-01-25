import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedShapedContainer extends StatefulWidget {
  const AnimatedShapedContainer({super.key});

  @override
  State<AnimatedShapedContainer> createState() =>
      _AnimatedShapedContainerState();
}

class _AnimatedShapedContainerState extends State<AnimatedShapedContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
      reverseDuration: const Duration(seconds: 10),
    )..forward();

    animation = Tween<double>(begin: -math.pi / 4, end: -math.pi / 3)
        .animate(controller);

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
        return Transform.rotate(
          angle: animation.value,
          child: Container(
            height: 500,
            width: 300,
            color: Colors.yellow,
          ),
        );
      },
    );
  }
}
