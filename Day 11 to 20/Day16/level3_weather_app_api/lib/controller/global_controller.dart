import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  //rx means reactive state
  final RxBool _isLoading = true.obs;
  final RxDouble _latitidue = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  //instance for them to be called

  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _latitidue;
  RxDouble getLongitude() => _longitude;

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
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
      _isLoading.value = false;
      print(_latitidue.value);
      print(_longitude.value);
    });
  }
}
