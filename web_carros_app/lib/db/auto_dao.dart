
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_carros_app/models/auto.dart';

class AutoDao {
  final dbReference = FirebaseFirestore.instance;
  final String brandCollectionName = 'autos';

  Future<List<Auto>> getAutosByBrandAndYear(String brandName, int initYear, int endYear) async {
    List<Auto> autos = [];

    await dbReference
        .collection(brandCollectionName)
        .where('brand', isEqualTo: brandName)
        .where('year', isGreaterThanOrEqualTo: initYear)
        .where('year', isLessThanOrEqualTo: endYear)
        .get()
        .then((snapShot) {
      snapShot.docs.forEach((item) {
        var auto = Auto(item);

        autos.add(auto);
      });
    });

    return autos;
  }
}