import 'package:dynamic_grade_calculation/constants/app_my_constants.dart';
import 'package:dynamic_grade_calculation/helper/data_helper.dart';
import 'package:dynamic_grade_calculation/model/lesson.dart';
import 'package:dynamic_grade_calculation/widgets/Credit_Dropdown_widget.dart';
import 'package:dynamic_grade_calculation/widgets/lesson_list_widget.dart';
import 'package:dynamic_grade_calculation/widgets/show_average.dart';
import 'package:flutter/material.dart';

import '../letter_dropdown_widget.dart';

class GradeCalculationPage extends StatefulWidget {
  GradeCalculationPage({Key? key}) : super(key: key);

  @override
  _GradeCalculationPageState createState() => _GradeCalculationPageState();
}

class _GradeCalculationPageState extends State<GradeCalculationPage> {
  var formKey = GlobalKey<FormState>();

  String entryLessonName = '';
  @override
  Widget build(BuildContext context) {
    // print('page çalıştı');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          MyConstants.appTitle,
          style: MyConstants.headerStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //form
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                  flex: 1,
                  child: Show_Average(
                    numberOfLessons: DataHelper.lessonList.length,
                    average: DataHelper.averageCalculation(),
                  ))
            ],
          ),

          //liste
          Expanded(
            child: LessonList(
              onDismiss: (index) {
                // print('$index');
                setState(() {
                  DataHelper.lessonList.removeAt(index);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: MyConstants.horizontalPadding8,
            child: _buildTextFormField(),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: MyConstants.horizontalPadding8,
                  child: _buildDropdownNotes(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: MyConstants.horizontalPadding8,
                  child: _buildDropdownCredit(),
                ),
              ),
              Padding(
                padding: MyConstants.horizontalPadding8,
                child: IconButton(
                  onPressed: _lessonAddAndAverageCalculation,
                  icon: Icon(Icons.arrow_forward_ios_sharp),
                  color: MyConstants.primaryColor,
                  iconSize: 30,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (value) {
        entryLessonName = value!;
      },
      validator: (s) {
        if (s!.length <= 0) {
          return 'Lesson name entry ';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: 'Math',
        border: OutlineInputBorder(
            borderRadius: MyConstants.myBorderRadius,
            borderSide: BorderSide.none),
        filled: true,
        fillColor: MyConstants.primaryColor.shade200.withOpacity(0.3),
      ),
    );
  }

  double selectNoteValue = 4;
  _buildDropdownNotes() {
    return LetterDropdownWidget(
      onSelectLetter: (letterValue) {
        selectNoteValue = letterValue;
      },
    );
  }

  double selectCreditValue = 1;
  _buildDropdownCredit() {
    return CreditDropdownWidget(
      onCreditValue: (creditValue) {
        selectCreditValue = creditValue;
      },
    );
  }

  void _lessonAddAndAverageCalculation() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var newLesson = Lesson(
          name: entryLessonName,
          letterNote: selectNoteValue,
          credit: selectCreditValue);
      DataHelper.addLesson(newLesson);
      print(newLesson.CheckValueforPrintf());
      setState(() {});
      print(DataHelper.averageCalculation());
    }
  }
}
