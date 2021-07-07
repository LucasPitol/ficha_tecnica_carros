import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_carros_app/models/brand.dart';

class BrandDao {
  final dbReference = FirebaseFirestore.instance;
  final String brandCollectionName = 'brands';

  Future<List<Brand>> getBrands() async {
    List<Brand> brandList = [];

    await dbReference
        .collection(brandCollectionName)
        .orderBy('name')
        .get()
        .then((snapShot) {
      snapShot.docs.forEach((item) {
        var brand = Brand(item);

        brandList.add(brand);
      });
    });

    return brandList;
  }
}