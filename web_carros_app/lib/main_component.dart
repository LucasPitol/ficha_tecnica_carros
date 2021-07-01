import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'models/brand.dart';
import 'models/dtos/filterDto.dart';
import 'pages/filter/filter_component.dart';
import 'pages/home/home_component.dart';
import 'services/brand_service.dart';
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

  FilterDto filter;
  List<Brand> brandList;
  BrandService _brandService;

  _MainComponentState() {
    this._brandService = BrandService();
    this.brandList = [];
  }

  @override
  void initState() {
    super.initState();
    this.updateAppBar();
    this._getBrands();
  }

  _getBrands() {
    this._brandService.getBrands().then((value) {
      if (value.success) {
        this.brandList = value.data;
      }
    });
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
      MaterialPageRoute(
          builder: (context) => FilterComponent(filter, brandList)),
    );

    if (filtersTemp != null) {
      print('filter');
    }
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
