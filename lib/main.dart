import 'package:dynamic_grade_calculation/constants/app_my_constants.dart';
import 'package:dynamic_grade_calculation/widgets/pages/grade_calculation_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: MyConstants.appTitle,
      theme: ThemeData(
        primarySwatch: MyConstants.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GradeCalculationPage(),
    );
  }
}
