import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:level3_weather_app_api/api/fetch_weather.dart';

import '../models/weather_data.dart';

class GlobalController extends GetxController {
  //rx means reactive state
  final RxBool _isLoading = true.obs;
  final RxDouble _latitidue = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _currentIndex = 0.obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _latitidue;
  RxDouble getLongitude() => _longitude;

  //instance for them to be called
  final weatherData = WeatherData().obs;
  WeatherData getData() {
    return weatherData.value;
  }

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    } else {
      getIndex();
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    //return if service is not enable
    if (!isServiceEnabled) {
      return Future.error("Location not enalble");
    }

    //Status of permission
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission is denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      // request permission
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location is denied");
      }
    }

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      //update our lattitude and longitude
      _latitidue.value = value.latitude;
      _longitude.value = value.longitude;
      //calling our weather api
      print(_latitidue.value);
      print(_longitude.value);
      return FetchWeatherApi()
          .processData(_latitidue.value, _longitude.value)
          .then((value) {
        weatherData.value = value;
        _isLoading.value = false;
      });
    });
  }

  RxInt getIndex() {
    return _currentIndex;
  }
}
