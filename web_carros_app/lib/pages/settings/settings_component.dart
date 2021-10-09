import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:web_carros_app/pages/shared/loading_block.dart';
import 'package:web_carros_app/utils/constants.dart';
import 'package:web_carros_app/utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';

import 'settings_menu_item_widget.dart';

class SettingsComponent extends StatefulWidget {
  @override
  _SettingsComponentState createState() => _SettingsComponentState();
}

class _SettingsComponentState extends State<SettingsComponent> {
  bool loading = false;

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

  _goToInstagram() async {
    var url = Constants.instagramUrl;

    if (await canLaunch(url)) {
      await launch(
        url,
        universalLinksOnly: true,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao abrir instagram'),
        ),
      );
    }
  }

  _openAboutModal() async {
    setState(() {
      this.loading = true;
    });

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String appVersion = packageInfo.version;

    setState(() {
      this.loading = false;
    });

    showAboutDialog(
      context: context,
      applicationName: appName,
      applicationVersion: appVersion,
      // applicationIcon: Container(
      //   child: Image.asset(
      //     'assets/ic_launcher.png',
      //     width: 50,
      //   ),
      // ),
      children: [
        Container(
          child: Text(
            'Apenas consulta de ficha técnica? \nNovidades em breve.',
            style: TextStyle(color: Colors.grey.shade800),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Styles.mainBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  child: _getAppBar(),
                ),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                ),
                SizedBox(
                  child: Column(
                    children: [
                      SettingsMenuItemWidget(
                        icon: FontAwesomeIcons.instagram,
                        label: 'Instagram',
                        handlerFunction: _goToInstagram,
                      ),
                      SettingsMenuItemWidget(
                        icon: FontAwesomeIcons.infoCircle,
                        label: 'Sobre',
                        handlerFunction: _openAboutModal,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            LoadingBlock(this.loading)
          ],
        ),
      ),
    );
  }
}
