import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_carros_app/models/dimensions_specs.dart';
import 'package:web_carros_app/models/performace_specs.dart';
import 'package:web_carros_app/models/engine_specs.dart';
import 'package:web_carros_app/models/transmission_specs.dart';

import 'abstract_model.dart';
import 'aditional_specs.dart';

class Auto extends AbstractModel {
  String id;
  String brand;
  String model;
  String version;
  List<dynamic> autoImagePathList;
  String brandImagePath;
  int bodywork;
  double fipe;
  int initYear;
  int endYear;
  String generation;
  DateTime creationDate;

  PerformanceSpecs performanceSpecs;
  EngineSpecs engineSpecs;
  TransmissionSpecs transmissionSpecs;
  DimensionsSpecs dimensionsSpecs;
  AditionalSpecs aditionalSpecs;

  Auto(DocumentSnapshot doc) {
    if (doc != null) {
      Map<String, dynamic> objMapp = doc.data();

      Timestamp creationDateTimestamp = objMapp['creationDate'];

      this.id = doc.id;
      this.brand = objMapp['brand'];
      this.model = objMapp['model'];
      this.version = objMapp['version'];
      this.autoImagePathList = objMapp['autoImagePathList'];
      this.brandImagePath = objMapp['brandImagePath'];
      this.initYear = objMapp['initYear'];
      this.endYear = objMapp['endYear'];
      this.generation = objMapp['generation'];
      this.bodywork = objMapp['bodywork'];
      this.creationDate = creationDateTimestamp.toDate();
    }
  }
}
