import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_carros_app/models/auto.dart';
import 'package:flutter/material.dart';
import 'package:web_carros_app/pages/shared/loading_widget.dart';
import 'package:web_carros_app/utils/styles.dart';

class OverviewComponent extends StatefulWidget {
  final Auto auto;

  OverviewComponent(this.auto);

  @override
  _OverviewComponentState createState() => _OverviewComponentState(auto);
}

class _OverviewComponentState extends State<OverviewComponent> {
  Auto auto;
  bool specsLoading;

  _OverviewComponentState(this.auto) {
    specsLoading = true;
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
          );
  }

  _getAutoImgLayout() {
    return Container(
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
