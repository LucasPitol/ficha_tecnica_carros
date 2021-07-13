import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_carros_app/models/dimensions_specs.dart';
import 'package:web_carros_app/models/performace_specs.dart';
import 'package:web_carros_app/models/engine_specs.dart';
import 'package:web_carros_app/models/transmission_specs.dart';

import 'abstract_model.dart';
import 'aditional_specs.dart';

class Auto extends AbstractModel{
  String id;
  String brand;
  String model;
  String version;
  String autoImagePath;
  String brandImagePath;
  double fipe;
  int year;
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
      this.autoImagePath = objMapp['autoImagePath'];
      this.brandImagePath = objMapp['brandImagePath'];
      this.year = objMapp['year'];
      this.generation = objMapp['generation'];
      this.creationDate = creationDateTimestamp.toDate();
    }

    this.dimensionsSpecs = DimensionsSpecs();
  }

  // Auto(DocumentSnapshot doc) {
  //   Map<String, dynamic> objMapp = doc.data();

  //   Timestamp creationDateTimestamp = objMapp['creationDate'];

  //   this.id = doc.id;
  //   this.name = objMapp['name'];
  //   this.country = objMapp['country'];
  //   this.creationDate = creationDateTimestamp.toDate();
  // }
}
