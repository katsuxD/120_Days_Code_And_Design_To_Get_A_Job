import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management_practice/controller/tap_controller.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    TapController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_sharp,
          color: Colors.black,
        ),
        onPressed: () {
          Get.back();
        },
      )),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          children: [
            GetBuilder<TapController>(
              builder: (_) {
                return Container(
                  margin: const EdgeInsets.all(20.0),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 111, 127, 125),
                  ),
                  child: Center(
                    child: Text(
                      controller.x.toString(),
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: () {
                controller.decreaseX();
              },
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFF89dad0),
                      ),
                      child: const Center(
                        child: Text(
                          "- Decrease the X",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
