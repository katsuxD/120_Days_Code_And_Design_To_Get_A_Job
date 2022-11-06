import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management_practice/controller/tap_controller.dart';
import 'package:getx_state_management_practice/third_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

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
            GestureDetector(
              onTap: () {
                Get.to(() => const ThirdPage());
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
                          "Go to the third page to double X",
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
