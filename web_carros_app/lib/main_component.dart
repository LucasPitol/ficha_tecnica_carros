import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'models/dtos/filterDto.dart';
import 'pages/filter/filter_component.dart';
import 'pages/home/home_component.dart';
import 'pages/list_autos/list_autos_component.dart';
import 'utils/constants.dart';
import 'utils/styles.dart';

class MainComponent extends StatefulWidget {

  @override
  MainComponentState createState() => MainComponentState();
}

class MainComponentState extends State<MainComponent> {

  int _selectedIndex = Constants.home_page_index;

  FilterDto filter;

  MainComponentState() {
    this.filter = FilterDto();
  }

  @override
  void initState() {
    super.initState();
    this.updateAppBar();
  }

  updateAppBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Styles.mainBackgroundColor,
      statusBarIconBrightness: Brightness.light,
    ));
  }

  _openFilter() async {
    FilterDto filtersTemp = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FilterComponent(filter)),
    );

    if (filtersTemp != null) {
      setState(() {
        this._selectedIndex = Constants.list_page_index;
      });
    }
  }

  _getScreenOption() {
    switch (this._selectedIndex) {
      case 0:
        return HomeComponent();
        break;

      case 1:
      return ListAutosComponent(this.filter, this.clearFilters);
      break;

      default:
    }
  }

  clearFilters() {
    this.filter = FilterDto();

    setState(() {
      this._selectedIndex = Constants.home_page_index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Styles.mainBackgroundColor,
      body: SafeArea(
        child: _getScreenOption(),//_widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openFilter();
        },
        child: FaIcon(
          FontAwesomeIcons.filter,
          size: 20,
        ),
      ),
    );
  }
}
