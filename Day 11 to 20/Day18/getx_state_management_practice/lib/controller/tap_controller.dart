import 'package:get/get.dart';

class TapController extends GetxController {
  int _x = 0;
  int get x => _x;

  void increaseX() {
    _x++;
  }
}
