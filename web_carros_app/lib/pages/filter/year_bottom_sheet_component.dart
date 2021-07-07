import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_carros_app/models/tuple.dart';
import 'package:web_carros_app/utils/constants.dart';
import 'package:web_carros_app/utils/styles.dart';
import 'package:flutter/material.dart';

class YearBottomSheetComponent extends StatefulWidget {
  final int initYear;
  final int endYear;

  YearBottomSheetComponent(this.initYear, this.endYear);

  @override
  _YearBottomSheetComponentState createState() =>
      _YearBottomSheetComponentState(initYear, endYear);
}

class _YearBottomSheetComponentState extends State<YearBottomSheetComponent> {
  final int initYear;
  final int endYear;
  int newInitYear;
  int newEndYear;
  Tuple<int, int> dateRangeTuple;
  List<int> years;

  _YearBottomSheetComponentState(this.initYear, this.endYear) {
    this.newInitYear = initYear;
    this.newEndYear = endYear;
    this._buildTuple();
    this.years = Constants.getYears();
  }

  @override
  void initState() {
    super.initState();
  }

  void _selectDateRange() {
    Navigator.pop(context, dateRangeTuple);
  }

  _buildTuple() {
    this.dateRangeTuple = Tuple(newInitYear, newEndYear);
  }

  _selectInitDate(int newValue) {
    setState(() {
      this.newInitYear = newValue;
    });

    this._buildTuple();
  }

  _selectEndDate(int newValue) {
    this.newEndYear = newValue;

    this._buildTuple();
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
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ano inicio',
                      style: Styles.montText,
                    ),
                    DropdownButton<int>(
                      dropdownColor: Styles.mainBackgroundColor,
                      value: newInitYear,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        // color: Colors.grey,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade100,
                          fontSize: 14,
                        ),
                      ),
                      underline: Container(
                        height: 1,
                        color: Colors.grey.shade800,
                      ),
                      onChanged: (int newValue) {
                        _selectInitDate(newValue);
                      },
                      items: years.map<DropdownMenuItem<int>>((int item) {
                        return DropdownMenuItem<int>(
                          value: item,
                          child: Text(
                            item.toString(),
                            style: Styles.montTextLittle,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ano fim',
                      style: Styles.montText,
                    ),
                    DropdownButton<int>(
                      dropdownColor: Styles.mainBackgroundColor,
                      value: newEndYear,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        // color: Colors.grey,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade100,
                          fontSize: 14,
                        ),
                      ),
                      underline: Container(
                        height: 1,
                        color: Colors.grey.shade800,
                      ),
                      onChanged: (int newValue) {
                        _selectEndDate(newValue);
                      },
                      items: years.map<DropdownMenuItem<int>>((int item) {
                        return DropdownMenuItem<int>(
                          value: item,
                          child: Text(
                            item.toString(),
                            style: Styles.montTextLittle,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
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
