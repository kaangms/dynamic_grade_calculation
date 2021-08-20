import 'package:dynamic_grade_calculation/constants/app_my_constants.dart';
import 'package:dynamic_grade_calculation/helper/data_helper.dart';
import 'package:flutter/material.dart';

class CreditDropdownWidget extends StatefulWidget {
  final Function onCreditValue;

  CreditDropdownWidget({Key? key, required this.onCreditValue})
      : super(key: key);

  @override
  _CreditDropdownWidgetState createState() => _CreditDropdownWidgetState();
}

class _CreditDropdownWidgetState extends State<CreditDropdownWidget> {
  double selectCreditValue = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: MyConstants.dropDownPadding,
      decoration: BoxDecoration(
          color: MyConstants.primaryColor.shade100.withOpacity(0.3),
          borderRadius: MyConstants.myBorderRadius),
      child: DropdownButton<double>(
        value: selectCreditValue,
        elevation: 16,
        iconEnabledColor: MyConstants.primaryColor.shade200,
        onChanged: (value) {
          setState(() {
            selectCreditValue = value!;
            widget.onCreditValue(selectCreditValue);
          });
        },
        underline: Container(),
        items: DataHelper.CreditsDropdownMenuItem(),
      ),
    );
  }
}
