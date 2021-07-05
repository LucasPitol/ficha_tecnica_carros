import 'package:flutter/material.dart';
import 'package:web_carros_app/models/dimensions_specs.dart';
import 'package:web_carros_app/utils/styles.dart';

class DimensionsBoxWidget extends StatelessWidget {
  final DimensionsSpecs dimensionsSpecs;
  String lengthStr;
  String widthStr;
  String heightStr;
  String weightStr;
  String trunkStr;

  DimensionsBoxWidget(this.dimensionsSpecs) {
    this.lengthStr = (dimensionsSpecs.length.toStringAsFixed(1) + ' mm');

    this.widthStr = (dimensionsSpecs.width.toStringAsFixed(1) + ' mm');

    this.heightStr = (dimensionsSpecs.height.toStringAsFixed(1) + ' mm');

    this.weightStr = (dimensionsSpecs.weight.toStringAsFixed(1) + ' kg');

    this.trunkStr = (dimensionsSpecs.trunkCapacity.toStringAsFixed(1) + ' l');
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
      margin: EdgeInsets.only(left: 10, right: 20),
      decoration: Styles.specsBoxDecoration,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Dimensões',
              style: Styles.montTextTitle,
            ),
          ),
          _getRowInfo('Altura', this.heightStr),
          _getRowInfo('Largura', this.widthStr),
          _getRowInfo('Comprimento', this.lengthStr),
          _getRowInfo('Peso', this.weightStr),
          _getRowInfo('Porta malas', this.trunkStr),
        ],
      ),
    );
  }
}
