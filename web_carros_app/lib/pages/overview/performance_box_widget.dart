import 'package:flutter/material.dart';
import 'package:web_carros_app/models/performace_specs.dart';
import 'package:web_carros_app/utils/styles.dart';

class PerformanceBoxWidget extends StatelessWidget {
  final PerformanceSpecs performanceSpecs;
  String topSpeedStr;
  String zeroToHundredSpeedStr;
  String highwayConsumptionStr;
  String urbanConsumptionStr;
  String weightToPowerRatioStr;

  PerformanceBoxWidget(this.performanceSpecs) {
    this.topSpeedStr = (performanceSpecs.topSpeed.toStringAsFixed(0) + ' Km/h');
    this.zeroToHundredSpeedStr =
        (performanceSpecs.zeroToHundred.toStringAsFixed(1) + ' s');
    this.highwayConsumptionStr =
        (performanceSpecs.highwayConsumption.toStringAsFixed(1) + ' Km/l');
    this.urbanConsumptionStr =
        (performanceSpecs.urbanConsumption.toStringAsFixed(1) + ' Km/l');
    this.weightToPowerRatioStr =
        (performanceSpecs.weightToPowerRatio.toStringAsFixed(1) + ' Kg/cv');
  }

  _getRowInfo(String title, String value) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Styles.montText,
          ),
          Text(
            value,
            style: Styles.montText,
          ),
        ],
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
              'Desempenho',
              style: Styles.montTextTitle,
            ),
          ),
          _getRowInfo('Máxima', this.topSpeedStr),
          _getRowInfo('0 à 100', this.zeroToHundredSpeedStr),
          _getRowInfo('Urbano', this.urbanConsumptionStr),
          _getRowInfo('Rodovia', this.highwayConsumptionStr),
          _getRowInfo('Peso/potência', this.weightToPowerRatioStr),
        ],
      ),
    );
  }
}
