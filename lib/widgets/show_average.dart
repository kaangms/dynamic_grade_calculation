import 'package:dynamic_grade_calculation/constants/app_my_constants.dart';
import 'package:flutter/material.dart';

class Show_Average extends StatelessWidget {
  final double average;
  final int numberOfLessons;

  const Show_Average(
      {Key? key, required this.numberOfLessons, required this.average})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          numberOfLessons > 0
              ? '$numberOfLessons lesson entry'
              : 'cohoose lesson',
          style: MyConstants.averageShowBodyStyle,
        ),
        Text(
          average >= 0 ? '${average.toStringAsFixed(2)}' : '0',
          style: MyConstants.averageStyle,
        ),
        Text(
          'ortalama',
          style: MyConstants.averageShowBodyStyle,
        ),
      ],
    );
  }
}
