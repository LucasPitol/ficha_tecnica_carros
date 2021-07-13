import 'package:web_carros_app/models/transmission_specs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransmissionSpecsDao {
  final dbReference = FirebaseFirestore.instance;
  final String transmissionSpecsCollectionName = 'transmissionSpecs';

  Future<TransmissionSpecs> getTransmissionSpecsByAutoId(String autoId) async {
    TransmissionSpecs transmissionSpecs;

    await dbReference
        .collection(transmissionSpecsCollectionName)
        .where('autoId', isEqualTo: autoId)
        .get()
        .then((snapShot) {
      snapShot.docs.forEach((item) {
        transmissionSpecs = TransmissionSpecs(item);
      });
    });

    return transmissionSpecs;
  }
}
