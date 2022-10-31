// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_rest_api_weather_app/models/weather_model.dart';

String api_key = "YOUR_API_KEY";

class WeatherApiClient {
  Future<Weather>? getCurentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$api_key&units=metric");
    var response = await http.get(endpoint);
    //another way
    //Weather weather =  Weather.fromJson(body);
    var body = jsonDecode(response.body);
    print(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);
  }
}
