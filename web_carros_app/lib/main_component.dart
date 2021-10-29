import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:web_carros_app/pages/shared/loading_widget.dart';

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

GlobalKey<ListAutosComponentState> listAutosComponentGlobalKey = GlobalKey();

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

    if (_hasActiveFilters(filtersTemp)) {
      this.filter = filtersTemp;

      if (this._selectedIndex == Constants.list_page_index) {
        listAutosComponentGlobalKey.currentState.getFilteredAutos();
      } else {
        setState(() {
          this._selectedIndex = Constants.list_page_index;
        });
      }
    }
  }

  _hasActiveFilters(FilterDto filterTemp) {
    bool active = false;

    if (filterTemp != null) {
      if (filterTemp.bodywork != null) {
        active = true;
      }

      if (filterTemp.brand != null && filterTemp.brand.name.isNotEmpty) {
        active = true;
      }
    }
    return active;
  }

  _getScreenOption() {
    switch (this._selectedIndex) {
      case 0:
        return HomeComponent();
        break;

      case 1:
        return ListAutosComponent(
          key: listAutosComponentGlobalKey,
          filterDto: this.filter,
          clearFilterHandler: this.clearFilters,
        );
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

  // Future<InitializationStatus> _initGoogleMobileAds() {
  //   return MobileAds.instance.initialize();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Styles.mainBackgroundColor,
      // body: FutureBuilder(
      //   future: _initGoogleMobileAds(),
      //   builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
      //     if (snapshot.hasData) {
      //       //////
      //       List<String> testDeviceIds = ['3C1D1E219E8F3888FFE1E04B63476530'];
      //       RequestConfiguration configuration =
      //           RequestConfiguration(testDeviceIds: testDeviceIds);
      //       MobileAds.instance.updateRequestConfiguration(configuration);
      //       //////

      //       return SafeArea(
      //         child: _getScreenOption(),
      //       );
      //     } else if (snapshot.hasError) {
      //       return Icon(
      //         Icons.error_outline,
      //         color: Colors.red,
      //         size: 60,
      //       );
      //     } else {
      //       return SizedBox(
      //         child: LoadingWidget(),
      //       );
      //     }
      //   },
      // ),
      body: SafeArea(
        child: _getScreenOption(), //_widgetOptions.elementAt(_selectedIndex),
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
