import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management_practice/controller/tap_controller.dart';
import 'package:getx_state_management_practice/first_page.dart';
import 'package:getx_state_management_practice/second_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TapController controller = Get.put(TapController());
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        // width: double.maxFinite,
        // height: double.maxFinite,
        children: [
          GetBuilder<TapController>(
            builder: (_) {
              return Container(
                margin: const EdgeInsets.all(20.0),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 111, 127, 125),
                ),
                child: Center(
                  child: Text(
                    "x value: " + controller.x.toString(),
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              );
            },
          ),
          Obx(
            () => Container(
              margin: const EdgeInsets.all(20.0),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 111, 127, 125),
              ),
              child: Center(
                child: Text(
                  "y value: " + controller.y.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
              onTap: () {
                controller.increaseX();
              },
              child: buttonTest(
                "+ Increase the X",
              )),
          GestureDetector(
              onTap: () {
                Get.to(() => FirstPage());
              },
              child: buttonTest(
                "Go to the first page",
              )),
          GestureDetector(
              onTap: () {
                Get.to(() => SecondPage());
              },
              child: buttonTest(
                "Go to the second page",
              )),
          GestureDetector(
              onTap: () {
                controller.increaseY();
              },
              child: buttonTest(
                "+ Increase the Y",
              )),
          GestureDetector(
              onTap: () {
                controller.increaseY();
              },
              child: buttonTest(
                "- Decrease the Y",
              )),
          // buttonTest(),
        ],
      ),
    );
  }

  Widget buttonTest(String x) {
    String value = x;
    return Container(
      margin: const EdgeInsets.all(20.0),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF89dad0),
      ),
      child: Center(
        child: Text(
          value,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
