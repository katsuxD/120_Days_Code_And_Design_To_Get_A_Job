import '../api/api_key.dart';

String apiUrl(var lat, var lon) {
  String url;
  url =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&exclude={part}&appid=$apiKey&units=metric&exclude=hourly&lang=vi";
  return url;
}
