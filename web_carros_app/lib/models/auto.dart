import 'package:web_carros_app/models/performace_specs.dart';
import 'package:web_carros_app/models/engine_specs.dart';

class Auto {
  String id;
  String brand;
  String model;
  String version;
  String autoImagePath;
  String brandImagePath;
  double fipe;
  int year;
  DateTime creationDate;

  PerformanceSpecs performanceSpecs;
  EngineSpecs engineSpecs;

  Auto() {
    this.performanceSpecs = PerformanceSpecs();
    this.engineSpecs = EngineSpecs();
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