import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_carros_app/models/dimensions_specs.dart';

class DimensionsSpecsDao {
  final dbReference = FirebaseFirestore.instance;
  final String dimensionsSpecsCollectionName = 'dimensionsSpecs';

  Future<DimensionsSpecs> getDimensionsSpecsByAutoId(String autoId) async {
    DimensionsSpecs dimensionsSpecs;

    await dbReference
        .collection(dimensionsSpecsCollectionName)
        .where('autoId', isEqualTo: autoId)
        .get()
        .then((snapShot) {
      snapShot.docs.forEach((item) {
        dimensionsSpecs = DimensionsSpecs(item);
      });
    });

    return dimensionsSpecs;
  }
}
