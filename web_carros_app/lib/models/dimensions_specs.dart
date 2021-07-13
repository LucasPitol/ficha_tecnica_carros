import 'package:cloud_firestore/cloud_firestore.dart';

import 'abstract_model.dart';

class DimensionsSpecs extends AbstractModel {
  String autoId;
  double length;
  double width;
  double height;
  double weight;
  double trunkCapacity;

  DimensionsSpecs(DocumentSnapshot doc) {
    if (doc != null) {
      Map<String, dynamic> objMapp = doc.data();

      Timestamp creationDateTimestamp = objMapp['creationDate'];

      this.id = doc.id;
      this.autoId = objMapp['autoId'];
      this.length = objMapp['length'].toDouble();
      this.width = objMapp['width'].toDouble();
      this.height = objMapp['height'].toDouble();
      this.weight = objMapp['weight'].toDouble();
      this.trunkCapacity = objMapp['trunkCapacity'].toDouble();
      this.creationDate = creationDateTimestamp.toDate();
    }
  }
}
