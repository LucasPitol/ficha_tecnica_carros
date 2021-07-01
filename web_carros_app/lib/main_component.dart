import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'pages/home/home_component.dart';
import 'utils/styles.dart';

class MainComponent extends StatefulWidget {
  @override
  _MainComponentState createState() => _MainComponentState();
}

class _MainComponentState extends State<MainComponent> {
  final List<Widget> _widgetOptions = <Widget>[
    HomeComponent(),
  ];

  int _selectedIndex = 0;

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

  _openFilter() {
    print('Filter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Styles.mainBackgroundColor,
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
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
