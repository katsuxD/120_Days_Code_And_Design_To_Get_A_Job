import 'package:flutter/material.dart';

class HapticCircle extends StatefulWidget {
  final double radius;
  final Color hapticColor;
  final double height;
  final double width;
  final Color btnColor;
  final IconData iconData;
  const HapticCircle({
    Key? key,
    required this.radius,
    required this.hapticColor,
    required this.height,
    required this.width,
    required this.btnColor,
    required this.iconData,
  }) : super(key: key);

  @override
  State<HapticCircle> createState() => _HapticCircleState();
}

class _HapticCircleState extends State<HapticCircle> {
  double currRadius = 0;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          currRadius = widget.radius;
        });
      },
      onExit: (event) {
        setState(() {
          currRadius = 0;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(),
        alignment: Alignment.center,
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.btnColor,
          boxShadow: [
            BoxShadow(
              color: widget.hapticColor,
              spreadRadius: currRadius,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Icon(
            widget.iconData,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
