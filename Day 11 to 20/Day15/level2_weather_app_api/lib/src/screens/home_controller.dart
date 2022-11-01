// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls, depend_on_referenced_packages, unused_import, unnecessary_overrides, override_on_non_overriding_member, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:level2_weather_app_api/src/model/current_weather_data.dart';
import 'package:level2_weather_app_api/src/services/weather_service.dart';
import 'package:level2_weather_app_api/src/model/five_days_data.dart';

class HomeController extends GetxController {
  String? city;
  String? searchText;

  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<CurrentWeatherData> dataList = [];
  List<FiveDayData> fiveDaysData = [];

  HomeController({required this.city});

  @override
  void onInit() {
    initState();
    getTopFiveCities();
    super.onInit();
  }

  void initState() {
    getCurrentWeatherData();
    getFiveDaysData();
  }

  void updateWeather() {
    initState();
  }
  void getCurrentWeatherData() {
    WeatherService(city: '$city').getCurrentWeatherData(
        onSuccess: (data) {
          currentWeatherData = data;
          update();
        },
        onError: (error) => {
              print(error),
              update(),
            });
  }

  void getTopFiveCities() {
    List<String> cities = ['London', 'New York', 'Paris', 'Moscow', 'Tokyo'];
    cities.forEach((c) {
      WeatherService(city: '$c').getCurrentWeatherData(onSuccess: (data) {
        dataList.add(data);
        update();
      }, onError: (error) {
        print(error);
        update();
      });
    });
  }

  void getFiveDaysData() {
    WeatherService(city: '$city').getFiveDaysThreeHoursForcastData(
        onSuccess: (data) {
      fiveDaysData = data;
      update();
    }, onError: (error) {
      print(error);
      update();
    });
  }
}
