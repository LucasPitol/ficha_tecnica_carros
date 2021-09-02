import 'package:flutter/material.dart';
import 'package:web_carros_app/models/engine_specs.dart';
import 'package:web_carros_app/utils/styles.dart';

class EngineBoxWidget extends StatelessWidget {
  final EngineSpecs engineSpecs;
  String horsePowerStr;
  String torqueStr;
  String maxRPMStr;

  EngineBoxWidget(this.engineSpecs) {
    this.horsePowerStr = (engineSpecs.horsePower.toStringAsFixed(0) +
        ' cv a ' +
        engineSpecs.horsePowerRPM.toStringAsFixed(0) +
        ' rpm');

    this.torqueStr = (engineSpecs.torque.toStringAsFixed(1) +
        ' kgfm a ' +
        engineSpecs.torqueRPM.toStringAsFixed(0) +
        ' rpm');

    this.maxRPMStr =
        (engineSpecs.maxRPM.toStringAsFixed(0) + ' rotação máxima');
  }

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
              'Motor',
              style: Styles.montTextTitle,
            ),
          ),
          _getRowInfo(this.engineSpecs.description),
          _getRowInfo(this.horsePowerStr),
          _getRowInfo(this.torqueStr),
          _getRowInfo(this.maxRPMStr),
          _getRowInfo(this.engineSpecs.engineInstalation),
        ],
      ),
    );
  }
}
