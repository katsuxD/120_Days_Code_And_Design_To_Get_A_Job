import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  final GlobalController globalController = Get.put(
    GlobalController(),
    permanent: true,
  );
  String city = "";
  String ward = "";

  String date = DateFormat("yMd").format(DateTime.now());

  @override
  void initState() {
    getAddress(globalController.getLattitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      city = place.subAdministrativeArea!;
      print(place);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 10,
            right: 55,
          ),
          child: Text(
            city,
            style: const TextStyle(
              fontSize: 35,
              height: 2,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 105),
          child: Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
            ),
            alignment: Alignment.topLeft,
            child: Text(
              date,
              style: const TextStyle(
                fontSize: 14,
                height: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
