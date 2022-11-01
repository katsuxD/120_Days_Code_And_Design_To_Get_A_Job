// ignore_for_file: unnecessary_string_interpolations, avoid_print

import 'package:level2_weather_app_api/src/api/api_repository.dart';
import 'package:level2_weather_app_api/src/model/current_weather_data.dart';

import '../model/five_days_data.dart';

class WeatherService {
  final String city;
  String baseUrl = 'http://api.openweathermap.org/data/2.5';
  String apiKey = 'appid=5ec7f685c21d9e075e1f5ee283d3f0b7';
  WeatherService({
    required this.city,
  });

  void getCurrentWeatherData({
    Function()? beforSend,
    Function(CurrentWeatherData currentWeatherData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = '$baseUrl/weather?q=$city&lang=en&$apiKey';
    //print(url);
    ApiRepository(url: '$url', payload: null).get(
        beforeSend: () => {
              if (beforSend != null)
                {
                  beforSend(),
                },
            },
        onSuccess: (data) => {
              onSuccess!(CurrentWeatherData.fromJson(data)),
            },
        onError: (error) => {
              if (onError != null)
                {
                  print(error),
                  onError(error),
                }
            });
  }

  void getFiveDaysThreeHoursForcastData({
    Function()? beforSend,
    Function(List<FiveDayData> fiveDayData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = '$baseUrl/forecast?q=$city&lang=en&$apiKey';
    print(url);
    ApiRepository(url: '$url', payload: null).get(
        beforeSend: () => {},
        onSuccess: (data) => {
              onSuccess!((data['list'] as List)
                      .map((t) => FiveDayData.fromJson(t))
                      .toList()),
            },
        onError: (error) => {
              print(error),
            });
  }
  // void getCurrentWeatherData({
  //   Function()? beforSend,
  //   Function(CurrentWeatherData currentWeatherData)? onSuccess,
  //   Function(dynamic error)? onError,
  // }) {
  //   final url = '$baseUrl/weather?q=$city&lang=en&$apiKey';
  //   //print(url);
  //   ApiRepository(url: '$url', payload: null).get(
  //       beforeSend: () => {
  //             if (beforSend != null)
  //               {
  //                 beforSend(),
  //               },
  //           },
  //       onSuccess: (data) => {
  //             onSuccess!(CurrentWeatherData.fromJson(data)),
  //           },
  //       onError: (error) => {
  //             if (onError != null)
  //               {
  //                 print(error),
  //                 onError(error),
  //               }
  //           });
  // }

  // void getFiveDaysThreeHoursForcastData({
  //   Function()? beforSend,
  //   Function(List<FiveDayData> fiveDayData)? onSuccess,
  //   Function(dynamic error)? onError,
  // }) {
  //   final url = '$baseUrl/forecast?q=$city&lang=en&$apiKey';
  //   print(url);
  //   ApiRepository(url: '$url', payload: null).get(
  //       beforeSend: () => {},
  //       onSuccess: (data) => {
  //             onSuccess!((data['list'] as List)
  //                     .map((t) => FiveDayData.fromJson(t))
  //                     .toList()),
  //           },
  //       onError: (error) => {
  //             print(error),
  //             onError!(error),
  //           });
  // }
}
