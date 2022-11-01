// ignore_for_file: depend_on_referenced_packages

import 'package:get/instance_manager.dart';
import 'package:level2_weather_app_api/src/screens/home_controller.dart';
class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(city: '京都市'));
  }
}
