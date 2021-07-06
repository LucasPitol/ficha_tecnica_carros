import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:web_carros_app/models/auto.dart';
import 'package:flutter/material.dart';
import 'package:web_carros_app/pages/shared/loading_widget.dart';
import 'package:web_carros_app/services/auto_service.dart';
import 'package:web_carros_app/utils/constants.dart';
import 'package:web_carros_app/utils/styles.dart';

import 'dimensions_box_widget.dart';
import 'engine_box_widget.dart';
import 'gear_box_widget.dart';
import 'header_info_spec_item.dart';
import 'performance_box_widget.dart';

class OverviewComponent extends StatefulWidget {
  final Auto auto;

  OverviewComponent(this.auto);

  @override
  _OverviewComponentState createState() => _OverviewComponentState(auto);
}

class _OverviewComponentState extends State<OverviewComponent> {
  final _pageViewController = PageController(
    initialPage: 0,
  );

  Auto auto;
  AutoService _autoService;
  bool specsLoading;
  String horsePowerStr;
  String zeroToHundredStr;
  String fipeStr;
  String weightStr;

  _OverviewComponentState(this.auto) {
    this._autoService = AutoService();
    specsLoading = true;
    horsePowerStr = Constants.empty_string;
    zeroToHundredStr = Constants.empty_string;
    fipeStr = Constants.empty_string;
    weightStr = Constants.empty_string;
  }

  @override
  void initState() {
    super.initState();
    this._getAutoSpecs();
  }

  _goBack() {
    Navigator.pop(context);
  }

  _saveAuto() {
    print('save auto');
    // this._autoService.mock();
  }

  Widget _getAutoSpecsLayout() {
    double boxHeight = 500;

    return specsLoading
        ? Container(
            height: boxHeight,
            child: LoadingWidget(),
          )
        : Container(
            height: boxHeight,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HeaderInfoSpecItem(
                        FontAwesomeIcons.horseHead,
                        this.horsePowerStr,
                      ),
                      HeaderInfoSpecItem(
                        FontAwesomeIcons.tachometerAlt,
                        this.zeroToHundredStr,
                      ),
                      HeaderInfoSpecItem(
                        FontAwesomeIcons.dollarSign,
                        this.fipeStr,
                      ),
                      HeaderInfoSpecItem(
                        FontAwesomeIcons.weightHanging,
                        this.weightStr,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  height: 300,
                  child: PageView(
                    controller: this._pageViewController,
                    scrollDirection: Axis.horizontal,
                    children: [
                      PerformanceBoxWidget(this.auto.performanceSpecs),
                      EngineBoxWidget(this.auto.engineSpecs, this.auto.version),
                      GearBoxWidget(this.auto.transmissionSpecs),
                      DimensionsBoxWidget(this.auto.dimensionsSpecs),
                    ],
                  ),
                ),
                Container(
                  child: SmoothPageIndicator(
                    controller: _pageViewController,
                    count: 4,
                    axisDirection: Axis.horizontal,
                    onDotClicked: (i) {
                      _pageViewController.animateToPage(
                        i,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    effect: WormEffect(
                      // expansionFactor: 2,
                      spacing: 8,
                      radius: 16,
                      dotWidth: 12,
                      dotHeight: 12,
                      // dotColor: Color(0xFF1A1A1B),
                      dotColor: Colors.grey.shade900,
                      activeDotColor: Styles.primaryColor,
                      paintStyle: PaintingStyle.fill,
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  _getAutoImgLayout() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Image.network(
              auto.autoImagePath,
              fit: BoxFit.cover,
              // width: 80,
            ),
          ),
          Container(
            child: Text(
              auto.brand,
              style: Styles.tileTitleTextStyle,
            ),
          ),
          Container(
            child: Text(
              auto.model,
              style: Styles.montText,
            ),
          ),
          Container(
            child: Text(
              auto.version,
              style: Styles.montTextGrey,
            ),
          ),
        ],
      ),
    );
  }

  _getAppBar() {
    return Container(
      width: double.infinity,
      height: 60,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(10),
                child: InkWell(
                  borderRadius: Styles.circularBorderRadius,
                  onTap: () {
                    this._goBack();
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: FaIcon(
                      FontAwesomeIcons.chevronLeft,
                      size: 22,
                      color: Styles.mainTextColor,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.all(10),
                child: InkWell(
                  borderRadius: Styles.circularBorderRadius,
                  onTap: () {
                    this._saveAuto();
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: FaIcon(
                      FontAwesomeIcons.bookmark,
                      size: 22,
                      color: Styles.mainTextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            // margin: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Image.network(
              auto.brandImagePath,
              fit: BoxFit.cover,
              width: 80,
            ),
          ),
        ],
      ),
    );
  }

  _getAutoSpecs() {
    setState(() {
      this.specsLoading = true;
    });

    String autoId = this.auto.id;

    this._autoService.getAutoSpecs(autoId).then((value) {
      if (value == null) {
        // tratar server erro
      } else {
        if (value.success) {
          var autoSpecsDto = value.data;
          this.auto.performanceSpecs = autoSpecsDto.performanceSpecs;
          this.auto.engineSpecs = autoSpecsDto.engineSpecs;
          this.auto.transmissionSpecs = autoSpecsDto.transmissionSpecs;
          this.auto.dimensionsSpecs = autoSpecsDto.dimensionsSpecs;

          this.horsePowerStr =
              autoSpecsDto.engineSpecs.horsePower.toStringAsFixed(0);
          this.zeroToHundredStr =
              autoSpecsDto.performanceSpecs.zeroToHundred.toString();
          this.weightStr =
              autoSpecsDto.dimensionsSpecs.weight.toStringAsFixed(0);
        } else {
          // tratar erro
        }
      }

      setState(() {
        this.specsLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Styles.mainBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _getAppBar(),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _getAutoImgLayout(),
                    _getAutoSpecsLayout(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
