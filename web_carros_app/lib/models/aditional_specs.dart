import 'package:cloud_firestore/cloud_firestore.dart';

import 'abstract_model.dart';

class AditionalSpecs extends AbstractModel {
  String autoId;
  double cylinderCapacity;
  double lengthBetweenAxis;
  double fuelCapacity;
  String engineCode;
  String generation;

  AditionalSpecs(DocumentSnapshot doc) {
    if (doc != null) {
      Map<String, dynamic> objMapp = doc.data();

      Timestamp creationDateTimestamp = objMapp['creationDate'];

      this.id = doc.id;
      this.autoId = objMapp['autoId'];
      this.cylinderCapacity = objMapp['cylinderCapacity'].toDouble();
      this.lengthBetweenAxis = objMapp['lengthBetweenAxis'].toDouble();
      this.fuelCapacity = objMapp['fuelCapacity'].toDouble();
      this.engineCode = objMapp['engineCode'];
      this.generation = objMapp['generation'];
      this.creationDate = creationDateTimestamp.toDate();
    }
  }
}