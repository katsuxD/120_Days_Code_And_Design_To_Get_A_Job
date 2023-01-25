import 'package:flutter/material.dart';
import 'package:khanhdang_cv_flutter_ui/Widgets/Cursor/animated-circle_cursor.dart';

class PaddedIcon extends StatelessWidget {
  final IconData icon;
  final double? padding;
  final Color color;
  const PaddedIcon(
      {Key? key, required this.icon, this.padding, required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedCircleCursorMouseRegion(
      child: Padding(
        padding: padding != null
            ? EdgeInsets.all(padding!)
            : const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: color,
          //color: Color(0xff3B5999),
        ),
      ),
    );
  }
}
