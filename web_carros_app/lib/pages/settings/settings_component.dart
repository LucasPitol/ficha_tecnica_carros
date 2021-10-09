import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_carros_app/utils/styles.dart';

class SettingsComponent extends StatefulWidget {
  @override
  _SettingsComponentState createState() => _SettingsComponentState();
}

class _SettingsComponentState extends State<SettingsComponent> {
  Widget _getAppBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Styles.appTitleMainColor,
          ),
          Container(
            alignment: Alignment.topRight,
            child: InkWell(
              borderRadius: Styles.circularBorderRadius,
              onTap: () {
                this._goBack();
              },
              child: Container(
                child: FaIcon(
                  FontAwesomeIcons.times,
                  size: 22,
                  color: Styles.mainTextColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Styles.mainBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              child: _getAppBar(),
            ),
          ],
        ),
      ),
    );
  }
}
