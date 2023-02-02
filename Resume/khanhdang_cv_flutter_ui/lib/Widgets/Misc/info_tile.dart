import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../Text/poppins.dart';

class InfoTile extends StatelessWidget {
  final String title;
  final String subTitle;
  const InfoTile({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Poppins(
          text: title,
          color: Colors.white.withOpacity(0.85),
          fontSize: 16,
        ),
        const SizedBox(
          height: 3,
        ),
         Poppins(
          text: subTitle,
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(
          height: 3,
        ),
        const DottedLine(
          direction: Axis.horizontal,
          lineLength: double.infinity,
          lineThickness: 1.0,
          dashLength: 4.0,
          dashColor: Colors.white,
          dashGapColor: Colors.transparent,
        ),
      ],
    );
  }
}
