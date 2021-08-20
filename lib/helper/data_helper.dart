import 'package:dynamic_grade_calculation/model/lesson.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static List<String> _lessonLetters() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FD', 'FF'];
  }

  static double _letterConvertNote(String letter) {
    switch (letter) {
      case 'AA':
        return 4.0;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3.0;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2.0;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1.0;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0.0;
      default:
        return 0;
    }
  }

  static List<DropdownMenuItem<double>> allLesson() {
    return _lessonLetters()
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: _letterConvertNote(e),
            ))
        .toList();
  }

  static List<int> _credits() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> CreditsDropdownMenuItem() {
    return _credits()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e.toDouble(),
            ))
        .toList();
  }

  static List<Lesson> lessonList = [];
  static addLesson(Lesson lesson) {
    lessonList.add(lesson);
  }

  static double averageCalculation() {
    double totalNote = 0;
    double totalCredit = 0;

    lessonList.forEach((element) {
      totalNote = totalNote + (element.credit * element.letterNote);
      totalCredit += element.credit;
    });

    return totalNote / totalCredit;
  }
}
