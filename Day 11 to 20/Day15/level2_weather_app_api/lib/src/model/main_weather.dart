class MainWeather {
  final int? temp;
  final double? feelsLike;
  final int? tempMin;
  final int? tempMax;
  final int? pressure;
  final int? humidity;

  MainWeather(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity});

  factory MainWeather.fromJson(dynamic json) {
    if (json == null) {
      return MainWeather();
    }

    return MainWeather(
      //temp: json['temp'],
      temp: (double.parse(json['main']['temp'].toString()) - 273.15).round(),
      feelsLike: double.parse(json['feels_like'].toString()),
      tempMin: (double.parse(json['main']['temp_min'].toString()) - 273.15).round(),
      tempMax: (double.parse(json['main']['temp_max'].toString()) - 273.15).round(),
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
}
