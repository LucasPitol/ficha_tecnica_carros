import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_carros_app/utils/styles.dart';

class SettingsMenuItemWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function handlerFunction;

  SettingsMenuItemWidget({this.icon, this.label, this.handlerFunction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await this.handlerFunction();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FaIcon(
              icon,
              size: 22,
              color: Styles.mainTextColor,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              this.label,
              style: Styles.montText,
            ),
          ],
        ),
      ),
    );
  }
}
