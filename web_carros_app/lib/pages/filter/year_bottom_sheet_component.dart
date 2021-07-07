import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_carros_app/models/tuple.dart';
import 'package:web_carros_app/utils/styles.dart';

class YearBottomSheetComponent extends StatefulWidget {
  final DateTime initDate;
  final DateTime endDate;

  YearBottomSheetComponent(this.initDate, this.endDate);

  @override
  _YearBottomSheetComponentState createState() =>
      _YearBottomSheetComponentState(initDate, endDate);
}

class _YearBottomSheetComponentState extends State<YearBottomSheetComponent> {
  final DateTime initDate;
  final DateTime endDate;
  DateTime newInitDate;
  DateTime newEndDate;
  Tuple<DateTime, DateTime> dateRangeTuple;

  _YearBottomSheetComponentState(this.initDate, this.endDate) {
    this.dateRangeTuple = Tuple(initDate, endDate);
    this.newInitDate = initDate;
    this.newEndDate = endDate;
  }

  _selectInitDate(newDate) {
    this.dateRangeTuple = Tuple(newDate, endDate);
  }

  void _selectDateRange() {
    Navigator.pop(context, dateRangeTuple);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Styles.cardColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: FaIcon(
              FontAwesomeIcons.minus,
              color: Colors.grey.shade800,
              size: 38,
            ),
          ),
          Container(
            height: 150,
            child: YearPicker(
              currentDate: this.initDate,
              firstDate: DateTime(1900, 01, 01),
              initialDate: this.initDate,
              lastDate: DateTime.now(),
              selectedDate: this.newInitDate,
              onChanged: (DateTime newDate) {
                this.newInitDate = newDate;
              },
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  _selectDateRange();
                },
                style: ElevatedButton.styleFrom(
                  primary: Styles.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: Styles.defaultCardBorderRadius,
                  ),
                ),
                child: Text(
                  'Pronto',
                  style: TextStyle(
                    color: Styles.mainBackgroundColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
