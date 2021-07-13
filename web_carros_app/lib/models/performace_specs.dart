import 'package:cloud_firestore/cloud_firestore.dart';

import 'abstract_model.dart';

class PerformanceSpecs extends AbstractModel {
  String autoId;
  double topSpeed;
  double zeroToHundred;
  double urbanConsumption;
  double highwayConsumption;
  double weightToPowerRatio;

  PerformanceSpecs(DocumentSnapshot doc) {
    if (doc != null) {
      Map<String, dynamic> objMapp = doc.data();

      Timestamp creationDateTimestamp = objMapp['creationDate'];

      this.id = doc.id;
      this.topSpeed = objMapp['topSpeed'].toDouble();
      this.zeroToHundred = objMapp['zeroToHundred'].toDouble();
      this.urbanConsumption = objMapp['urbanConsumption'].toDouble();
      this.highwayConsumption = objMapp['highwayConsumption'].toDouble();
      this.weightToPowerRatio = objMapp['weightToPowerRatio'].toDouble();
      this.creationDate = creationDateTimestamp.toDate();
    }
  }
}
