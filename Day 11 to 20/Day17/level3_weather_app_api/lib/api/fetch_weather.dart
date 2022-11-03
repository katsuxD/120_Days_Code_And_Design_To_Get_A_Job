import 'dart:convert';

import 'package:level3_weather_app_api/models/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:level3_weather_app_api/models/weather_data_current.dart';
import 'package:level3_weather_app_api/models/weather_data_daily.dart';
import 'package:level3_weather_app_api/models/weather_data_hourly.dart';

import '../utils/api_url.dart';

class FetchWeatherApi {
  WeatherData? weatherData;
  //preocessing the data from response
  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiUrl(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHourly.fromJson(jsonString),
        WeatherDataDaily.fromJson(jsonString));
    return weatherData!;
  }
}
