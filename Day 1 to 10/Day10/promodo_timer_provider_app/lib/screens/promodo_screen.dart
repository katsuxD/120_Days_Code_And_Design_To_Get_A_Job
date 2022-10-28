import 'package:flutter/material.dart';
import 'package:promodo_timer_provider_app/services/timer_service.dart';
import 'package:promodo_timer_provider_app/util/utils.dart';
import 'package:promodo_timer_provider_app/widgets/time_controller.dart';
import 'package:promodo_timer_provider_app/widgets/timer_card.dart';
import 'package:promodo_timer_provider_app/widgets/timeroptions.dart';
import 'package:provider/provider.dart';

import '../widgets/progress_widget.dart';

class PromodoScreen extends StatelessWidget {
  const PromodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Scaffold(
      backgroundColor: renderColor(provider.currentState),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: renderColor(provider.currentState),
        title: Text(
          "Promodo Timer",
          style: textStyle(
            25,
            Colors.white,
            FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                Provider.of<TimerService>(context, listen: false).reset(),
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            iconSize: 40,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              TimerCard(),
              const SizedBox(
                height: 40,
              ),
              TimerOptions(),
              const SizedBox(
                height: 40,
              ),
              TimeController(),
              const SizedBox(
                height: 30,
              ),
              ProgressWidget()
            ],
          ),
        ),
      ),
    );
  }
}
