import 'package:flutter/material.dart';
import 'package:promodo_timer_provider_app/util/utils.dart';

class TimerOptions extends StatelessWidget {
  double selectedTime = 1500;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 113),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: selectableTimes.map((time) {
          return Container(
            margin: const EdgeInsets.only(left: 10),
            width: 70,
            height: 50,
            decoration: int.parse(time) == selectedTime
                ? BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(5),
                  )
                : BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.white30,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
            child: Center(
              child: Text(
                (int.parse(time) ~/ 60).toString(),
                style: textStyle(
                  25,
                   int.parse(time) == selectedTime ?
                  Colors.purpleAccent : Colors.white,
                  FontWeight.w700,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
