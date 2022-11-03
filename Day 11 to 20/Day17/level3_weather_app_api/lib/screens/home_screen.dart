import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:level3_weather_app_api/controller/global_controller.dart';
import 'package:level3_weather_app_api/models/weather/current.dart';
import 'package:level3_weather_app_api/utils/custom_color.dart';
import 'package:level3_weather_app_api/widgets/comfort_level.dart';
import 'package:level3_weather_app_api/widgets/current_weather_widget.dart';
import 'package:level3_weather_app_api/widgets/daily_data_forecast.dart';
import 'package:level3_weather_app_api/widgets/header_widget.dart';
import 'package:level3_weather_app_api/widgets/hourly_data_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //call getxcontroller
  final GlobalController globalController = Get.put(
    GlobalController(),
    permanent: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const HeaderWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      CurrentWeatherWidget(
                          weatherDataCurrent:
                              globalController.getData().getCurrentWeather()),
                      const SizedBox(
                        height: 20,
                      ),
                      //for current temp ('current')
                      HourlyDataWidget(
                          weatherDataHourly:
                              globalController.getData().getHourlyWeather()),
                      DailyDataForecast(
                          weatherDataDaily:
                              globalController.getData().getDailyWeather()),
                      Container(
                        height: 1,
                        color: CustomsColors.dividerLine,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ComfortLevel(
                        weatherDataCurrent:
                            globalController.getData().getCurrentWeather(),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
