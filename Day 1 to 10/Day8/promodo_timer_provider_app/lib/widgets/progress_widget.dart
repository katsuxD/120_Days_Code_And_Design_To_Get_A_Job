import 'package:flutter/material.dart';
import 'package:promodo_timer_provider_app/util/utils.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                "0/4",
                style: textStyle(
                  30,
                  Colors.grey[350],
                  FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                "0/12",
                style: textStyle(
                  30,
                  Colors.grey[350],
                  FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          
          children: [
            const SizedBox(
              width: 110,
            ),
            Text(
              "ROUND",
              style: textStyle(
                25,
                Colors.grey[350],
                FontWeight.bold,
              ),
            ),
            SizedBox(width: 95,),
            Text(
              "GOAL",
              style: textStyle(
                25,
                Colors.grey[350],
                FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}
