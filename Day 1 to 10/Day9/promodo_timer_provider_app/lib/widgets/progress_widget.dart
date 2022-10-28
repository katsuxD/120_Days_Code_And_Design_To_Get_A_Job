import 'package:flutter/material.dart';
import 'package:promodo_timer_provider_app/services/timer_service.dart';
import 'package:promodo_timer_provider_app/util/utils.dart';
import 'package:provider/provider.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                "${provider.rounds}/4",
                style: textStyle(
                  30,
                  Colors.grey[350],
                  FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                "${provider.goal}/12",
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
                Colors.white,
                FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 95,
            ),
            Text(
              "GOAL",
              style: textStyle(
                25,
                Colors.white,
                FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}
