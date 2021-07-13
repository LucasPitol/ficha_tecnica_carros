import 'package:flutter/material.dart';
import 'package:web_carros_app/models/transmission_specs.dart';
import 'package:web_carros_app/utils/styles.dart';

class GearBoxWidget extends StatelessWidget {
  final TransmissionSpecs transmissionSpecs;

  GearBoxWidget(this.transmissionSpecs);

  _getRowInfo(String value) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        value,
        style: Styles.montText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: Styles.specsBoxDecoration,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Transmissão',
              style: Styles.montTextTitle,
            ),
          ),
          _getRowInfo(this.transmissionSpecs.code),
          _getRowInfo(this.transmissionSpecs.traction),
          _getRowInfo(this.transmissionSpecs.gearbox),
          _getRowInfo(this.transmissionSpecs.gearShift),
        ],
      ),
    );
  }
}
