import 'package:flutter/material.dart';
import 'package:promodo_timer_provider_app/services/timer_service.dart';
import 'package:promodo_timer_provider_app/util/utils.dart';
import 'package:provider/provider.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Column(
      children: [
        Text(
          provider.currentState,
          style: textStyle(35, Colors.white, FontWeight.w700),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  (provider.currentDuration ~/ 60).toString(),
                  style: textStyle(
                    70,
                    Colors.purpleAccent,
                    FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              ":",
              style: textStyle(
                60,
                Colors.purple[200],
                FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  (provider.currentDuration % 60) == 0 ? "${(provider.currentDuration % 60).round()}0":
                  (provider.currentDuration % 60).round().toString(),
                  style: textStyle(
                    70,
                    Colors.purpleAccent,
                    FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
