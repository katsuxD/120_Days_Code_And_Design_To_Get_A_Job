import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayListScreen extends StatelessWidget {
  const PlayListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Open shopping cart',
          onPressed: () {
            Get.back();
          },
        ),
      ]),
      body: const Text("Playlist Test"),
    );
  }
}
