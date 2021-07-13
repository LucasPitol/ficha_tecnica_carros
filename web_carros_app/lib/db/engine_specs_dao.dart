
import 'package:web_carros_app/models/engine_specs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EngineSpecsDao {
  final dbReference = FirebaseFirestore.instance;
  final String engineSpecsCollectionName = 'engineSpecs';

  Future<EngineSpecs> getEngineSpecsByAutoId(String autoId) async {
    EngineSpecs engineSpecs;

    await dbReference
        .collection(engineSpecsCollectionName)
        .where('autoId', isEqualTo: autoId)
        .get()
        .then((snapShot) {
      snapShot.docs.forEach((item) {
        engineSpecs = EngineSpecs(item);
      });
    });

    return engineSpecs;
  }
}
