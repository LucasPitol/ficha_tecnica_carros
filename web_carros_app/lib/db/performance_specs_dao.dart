import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_carros_app/models/performace_specs.dart';

class PerformanceSpecsDao {
  final dbReference = FirebaseFirestore.instance;
  final String performanceSpecsCollectionName = 'performanceSpecs';

  Future<PerformanceSpecs> getPerformanceSpecsByAutoId(String autoId) async {
    PerformanceSpecs performanceSpecs;

    await dbReference
        .collection(performanceSpecsCollectionName)
        .where('autoId', isEqualTo: autoId)
        .get()
        .then((snapShot) {
      snapShot.docs.forEach((item) {
        performanceSpecs = PerformanceSpecs(item);
      });
    });

    return performanceSpecs;
  }
}
