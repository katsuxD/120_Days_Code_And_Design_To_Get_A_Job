import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:level3_weather_app_api/controller/global_controller.dart';
import 'package:level3_weather_app_api/utils/custom_color.dart';

import '../models/weather_data_hourly.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyDataWidget({super.key, required this.weatherDataHourly});

  //card index
  RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          alignment: Alignment.topCenter,
          child: const Text(
            "Today",
            style: TextStyle(fontSize: 18),
          ),
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList() {
    return Container(
      height: 160,
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly.hourly.length > 12
            ? 24
            : weatherDataHourly.hourly.length,
        itemBuilder: ((context, index) {
          return Obx((() => GestureDetector(
              onTap: () {
                cardIndex.value = index;
              },
              child: Container(
                width: 90,
                margin: const EdgeInsets.only(left: 20, right: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0.5, 0),
                        blurRadius: 30,
                        spreadRadius: 1,
                        color: CustomsColors.dividerLine.withAlpha(150),
                      )
                    ],
                    gradient: cardIndex.value == index
                        ? const LinearGradient(colors: [
                            CustomsColors.fisrtGradientColor,
                            CustomsColors.secondGradientColor,
                          ])
                        : null),
                //const LinearGradient(colors: [
                //   CustomsColors.fisrtGradientColor,
                //   CustomsColors.secondGradientColor,
                // ])),
                child: HourlyDetails(
                  index: index,
                  cardIndex: cardIndex.toInt(),
                  temp: weatherDataHourly.hourly[index].temp!,
                  timeStamp: weatherDataHourly.hourly[index].dt!,
                  weatherIcon:
                      weatherDataHourly.hourly[index].weather![0].icon!,
                ),
              ))));
        }),
      ),
    );
  }
}

class HourlyDetails extends StatelessWidget {
  int temp;
  int index;
  int timeStamp;
  String weatherIcon;
  int cardIndex;

  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }

  HourlyDetails({
    Key? key,
    required this.temp,
    required this.index,
    required this.timeStamp,
    required this.weatherIcon,
    required this.cardIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            getTime(timeStamp),
            style: TextStyle(
              color: cardIndex == index
                  ? Colors.white
                  : CustomsColors.textColorBlack,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          height: 40,
          width: 40,
          child: Image.asset("assets/weather/$weatherIcon.png"),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: Text(
            "$temp°",
            style: TextStyle(
              color: cardIndex == index
                  ? Colors.white
                  : CustomsColors.textColorBlack,
            ),
          ),
        )
      ],
    );
  }
}
