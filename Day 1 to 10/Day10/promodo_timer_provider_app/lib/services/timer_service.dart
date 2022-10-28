import 'dart:async';

import "package:flutter/material.dart";

class TimerService extends ChangeNotifier {
  Timer? timer;
  // double currentDuration = 1500;
  // double selectedTime = 1500;
  //for testing
  double currentDuration = 10;
  double selectedTime = 10;
  bool timerPLaying = false;
  int rounds = 0;
  int goal = 0;
  String currentState = "FOCUS";

  void start() {
    timerPLaying = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentDuration == 0) {
        handleNextRound();
      } else {
        currentDuration--;
        notifyListeners();
      }
    });
  }

  void pause() {
    timer?.cancel();
    timerPLaying = false;
    notifyListeners();
  }

  void reset() {
    timer?.cancel();
    currentState = "FOCUS";
    currentDuration = selectedTime = 1500;
    rounds = goal = 0;
    timerPLaying = false;
    notifyListeners();
  }

  void selectTime(double seconds) {
    selectedTime = seconds;
    currentDuration = seconds;
    notifyListeners();
  }

  // void handleNextRound() {
  //   if (currentState == "FOCUS" && rounds !=3) {
  //     currentState = "BREAK";
  //     currentDuration = 300;
  //     selectedTime = 300;
  //     rounds++;
  //     goal++;
  //   } else if (currentState == "BREAK") {
  //     currentState = "FOCUS";
  //     currentDuration = 1500;
  //     selectedTime = 1500;
  //   } else if (currentState == "FOCUS" && rounds == 3) {
  //     currentState = "LONGBREAK";
  //     currentDuration = 1500;
  //     selectedTime = 1500;
  //     rounds++;
  //     goal++;
  //   } else if (currentState == "LONGBREAK") {
  //     currentState = "FOCUS";
  //     currentDuration = 1500;
  //     selectedTime = 1500;
  //     rounds = 0;
  //   }
  //   notifyListeners();
  // }
  //for testing
  void handleNextRound() {
    if (currentState == "FOCUS" && rounds != 3) {
      currentState = "BREAK";
      currentDuration = 5;
      selectedTime = 5;
      rounds++;
      goal++;
    } else if (currentState == "BREAK") {
      currentState = "FOCUS";
      currentDuration = 10;
      selectedTime = 10;
    } else if (currentState == "FOCUS" && rounds == 3) {
      currentState = "LONGBREAK";
      currentDuration = 10;
      selectedTime = 10;
      rounds++;
      goal++;
    } else if (currentState == "LONGBREAK") {
      currentState = "FOCUS";
      currentDuration = 10;
      selectedTime = 10;
      rounds = 0;
    }
    notifyListeners();
  }
}
