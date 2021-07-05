import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_carros_app/utils/styles.dart';

class HeaderInfoSpecItem extends StatelessWidget {
  final IconData icon;
  final String value;

  HeaderInfoSpecItem(this.icon, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FaIcon(
            icon,
            size: 22,
            color: Colors.grey.shade400,
          ),
          Text(
            value,
            style: Styles.montTextLittle,
          ),
        ],
      ),
    );
  }
}
