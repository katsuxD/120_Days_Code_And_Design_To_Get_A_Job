import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management_practice/controller/tap_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TapController controller =Get.put(TapController());
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buttonTest(),
            buttonTest(),
            buttonTest(),
            buttonTest(),
          ],
        ),
      ),
    );
  }

  Widget buttonTest() {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF89dad0),
        ),
        child: const Center(
          child: Text(
            "Hi there",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
