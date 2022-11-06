import 'package:get/get.dart';

class TapController extends GetxController {
  int _x = 0;
  int get x => _x;

  RxInt _y = 0.obs;
  RxInt get y => _y;

  //x
  void increaseX() {
    _x++;
    update();
    print("x:$_x");
  }

  void decreaseX() {
    _x--;
    update();
    print("x:$_x");
  }

  void doubleX() {
    _x = _x * 2;
    update();
    print("x:$_x");
  }

  //y
  void increaseY() {
    _y.value++;
    print("y:$_y");
  }

  void decreaseY() {
    _y.value--;
    print("y:$_y");
  }

  void doubley() {
    _y.value = _y.value * 2;
    print("y:$_y");
  }
}
