import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:level3_weather_app_api/controller/global_controller.dart';
import 'package:level3_weather_app_api/widgets/header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //call getxcontroller
  final GlobalController globalController = Get.put(
    GlobalController(),
    permanent: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    HeaderWidget()
                  ],
                ),
        ),
      ),
    );
  }
}
