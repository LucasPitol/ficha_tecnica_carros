import 'package:web_carros_app/models/aditional_specs.dart';
import 'package:flutter/material.dart';
import 'package:web_carros_app/utils/styles.dart';

class AditionalInfoBoxWidget extends StatelessWidget {
  final AditionalSpecs aditionalSpecs;

  String cylinderCapacityStr;
  String lengthBetweenAxisStr;
  String fuelCapacityStr;

  AditionalInfoBoxWidget(this.aditionalSpecs) {
    this.cylinderCapacityStr =
        (aditionalSpecs.cylinderCapacity.toStringAsFixed(0) + ' cm³');
    this.lengthBetweenAxisStr =
        (aditionalSpecs.lengthBetweenAxis.toStringAsFixed(0) + ' mm');
    this.fuelCapacityStr =
        (aditionalSpecs.fuelCapacity.toStringAsFixed(0) + ' l');
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
              'Informações adicionais',
              style: Styles.montTextTitle,
            ),
          ),
          _getRowInfo('Geração', this.aditionalSpecs.generation),
          _getRowInfo('Motor', this.aditionalSpecs.engineCode),
          _getRowInfo('Tanque', this.fuelCapacityStr),
          _getRowInfo('Cilindrada', this.cylinderCapacityStr),
          _getRowInfo('Entre eixos', this.lengthBetweenAxisStr),
        ],
      ),
    );
  }
}
