import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_carros_app/models/aditional_specs.dart';

class AditionalSpecsDao {
  final dbReference = FirebaseFirestore.instance;
  final String aditionalSpecsCollectionName = 'aditionalSpecs';

  Future<AditionalSpecs> getAditionalSpecsByAutoId(String autoId) async {
    AditionalSpecs aditionalSpecs;

    await dbReference
        .collection(aditionalSpecsCollectionName)
        .where('autoId', isEqualTo: autoId)
        .get()
        .then((snapShot) {
      snapShot.docs.forEach((item) {
        aditionalSpecs = AditionalSpecs(item);
      });
    });

    return aditionalSpecs;
  }
}
