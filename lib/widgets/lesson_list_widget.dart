import 'package:dynamic_grade_calculation/constants/app_my_constants.dart';
import 'package:dynamic_grade_calculation/helper/data_helper.dart';
import 'package:dynamic_grade_calculation/model/lesson.dart';
import 'package:flutter/material.dart';

class LessonList extends StatelessWidget {
  final Function onDismiss;

  const LessonList({required this.onDismiss, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Lesson> lessonList = DataHelper.lessonList;
    return lessonList.length > 0
        ? ListView.builder(
            itemCount: lessonList.length,
            itemBuilder: (context, index) {
              var totalCredit =
                  lessonList[index].credit * lessonList[index].letterNote;
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onDismiss(index);
                  //DataHelper.lessonList.removeAt(index);
                  // setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(lessonList[index].name),
                      leading: CircleAvatar(
                        backgroundColor: MyConstants.primaryColor,
                        child: Text(totalCredit.toStringAsFixed(0)),
                      ),
                      subtitle: Text(
                          '${lessonList[index].letterNote} Not Değeri, ${lessonList[index].credit} Kredi'),
                    ),
                  ),
                ),
              );
            })
        : Container(
            child: Center(
                child: Text(
              'Lütfen Ders Ekleyin',
              style: MyConstants.headerStyle,
            )),
          );
  }
}
