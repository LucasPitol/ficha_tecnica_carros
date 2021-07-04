import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_carros_app/models/dtos/filterDto.dart';
import 'package:web_carros_app/utils/styles.dart';
import 'package:flutter/material.dart';

class ListAutosComponent extends StatefulWidget {
  final FilterDto filterDto;
  final Function clearFilterHandler;

  ListAutosComponent(this.filterDto, this.clearFilterHandler);

  @override
  _ListAutosComponentState createState() =>
      _ListAutosComponentState(filterDto, clearFilterHandler);
}

class _ListAutosComponentState extends State<ListAutosComponent> {
  final FilterDto filterDto;
  final Function clearFilterHandler;
  bool listLoading;

  _ListAutosComponentState(this.filterDto, this.clearFilterHandler) {
    this.listLoading = false;
  }

  @override
  void initState() {
    super.initState();
    this._getFilteredAutos();
  }

  _goToSettings() {
    print('settings');
  }

  _getFilteredAutos() {}

  _getAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Styles.appTitle,
        ),
        Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.all(10),
          child: InkWell(
            borderRadius: Styles.circularBorderRadius,
            onTap: () {
              this._goToSettings();
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: FaIcon(
                FontAwesomeIcons.bars,
                size: 22,
                color: Styles.mainTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _clearFilters() {
    this.clearFilterHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _getAppBar(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.topRight,
            child: TextButton(
              style: Styles.textButtonStyle,
              onPressed: () {
                _clearFilters();
              },
              child: Text('Limpar filtros'),
            ),
          ),
        ],
      ),
    );
  }
}
