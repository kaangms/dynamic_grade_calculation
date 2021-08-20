import 'package:dynamic_grade_calculation/constants/app_my_constants.dart';
import 'package:dynamic_grade_calculation/helper/data_helper.dart';
import 'package:flutter/material.dart';

class LetterDropdownWidget extends StatefulWidget {
  final Function onSelectLetter;
  LetterDropdownWidget({Key? key, required this.onSelectLetter})
      : super(key: key);

  @override
  _LetterDropdownWidgetState createState() => _LetterDropdownWidgetState();
}

class _LetterDropdownWidgetState extends State<LetterDropdownWidget> {
  double selectNoteValue = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: MyConstants.dropDownPadding,
      decoration: BoxDecoration(
          color: MyConstants.primaryColor.shade100.withOpacity(0.3),
          borderRadius: MyConstants.myBorderRadius),
      child: DropdownButton<double>(
        value: selectNoteValue,
        elevation: 16,
        iconEnabledColor: MyConstants.primaryColor.shade200,
        onChanged: (value) {
          setState(() {
            selectNoteValue = value!;
            widget.onSelectLetter(selectNoteValue);
          });
        },
        underline: Container(),
        items: DataHelper.allLesson(),
        // items: [
        //   DropdownMenuItem(
        //     child: Text('AA'),
        //     value: 4.0,
        //   ),
        //   DropdownMenuItem(
        //     child: Text('BA'),
        //     value: 3.5,
        //   ),
        //   DropdownMenuItem(
        //     child: Text('CC'),
        //     value: 3.0,
        //   ),
        //   DropdownMenuItem(
        //     child: Text('Dc'),
        //     value: 2.5,
        //   ),
        // ],
      ),
    );
  }
}
