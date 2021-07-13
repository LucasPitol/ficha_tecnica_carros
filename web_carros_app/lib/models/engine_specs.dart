import 'package:cloud_firestore/cloud_firestore.dart';

import 'abstract_model.dart';

class EngineSpecs extends AbstractModel {
  String autoId;
  String description;
  double horsePower;
  double horsePowerRPM;
  double torque;
  double torqueRPM;
  double maxRPM;
  String engineInstalation;

  EngineSpecs(DocumentSnapshot doc) {
    if (doc != null) {
      Map<String, dynamic> objMapp = doc.data();

      Timestamp creationDateTimestamp = objMapp['creationDate'];

      this.id = doc.id;
      this.autoId = objMapp['autoId'];
      this.horsePower = objMapp['horsePower'].toDouble();
      this.horsePowerRPM = objMapp['horsePowerRPM'].toDouble();
      this.torque = objMapp['torque'].toDouble();
      this.torqueRPM = objMapp['torqueRPM'].toDouble();
      this.maxRPM = objMapp['maxRPM'].toDouble();
      this.engineInstalation = objMapp['engineInstalation'];
      this.description = objMapp['description'];
      this.creationDate = creationDateTimestamp.toDate();
    }
  }
}