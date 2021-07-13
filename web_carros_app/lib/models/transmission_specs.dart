import 'package:cloud_firestore/cloud_firestore.dart';

import 'abstract_model.dart';

class TransmissionSpecs extends AbstractModel {
  String autoId;
  String traction;
  String code;
  String gearbox;
  String gearShift;

  TransmissionSpecs(DocumentSnapshot doc) {
    if (doc != null) {
      Map<String, dynamic> objMapp = doc.data();

      Timestamp creationDateTimestamp = objMapp['creationDate'];

      this.id = doc.id;
      this.autoId = objMapp['autoId'];
      this.traction = objMapp['traction'];
      this.code = objMapp['code'];
      this.gearbox = objMapp['gearbox'];
      this.gearShift = objMapp['gearShift'];
      this.creationDate = creationDateTimestamp.toDate();
    }
  }
}
