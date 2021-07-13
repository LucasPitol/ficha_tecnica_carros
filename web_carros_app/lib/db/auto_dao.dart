import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_carros_app/models/auto.dart';

class AutoDao {
  final dbReference = FirebaseFirestore.instance;
  final String brandCollectionName = 'autos';

  Future<List<Auto>> getByIds(List<String> autoIds) async {
    List<Auto> autos = [];

    await dbReference
        .collection(brandCollectionName)
        .where('id', whereIn: autoIds)
        .get()
        .then((snapShot) {
      snapShot.docs.forEach((item) {
        var auto = Auto(item);

        autos.add(auto);
      });
    });

    return autos;
  }

  Future<List<Auto>> getAutosByBrandAndYear(
      String brandName, int initYear, int endYear) async {
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

  Future<List<Auto>> getNews() async {
    List<Auto> autos = [];

    await dbReference
        .collection(brandCollectionName)
        .where('isNews', isEqualTo: true)
        .get()
        .then((snapShot) {
      snapShot.docs.forEach((item) {
        var auto = Auto(item);

        autos.add(auto);
      });
    });

    return autos;
  }

  mockData() async {
    var batch = this.dbReference.batch();

    var creationDate = DateTime.now();

    String performanceSpecsCollectionName = 'performanceSpecs';
    String engineSpecsCollectionName = 'engineSpecs';
    String transmissionSpecsCollectionName = 'transmissionSpecs';
    String dimensionsSpecsCollectionName = 'dimensionsSpecs';
    String aditionalSpecsCollectionName = 'aditionalSpecs';

    String autoId = '8CcxhKjB9GfRRMypscwh';

    ////////////////////////////////////////////////////////////////////

    var performanceSpecsDocRef =
        dbReference.collection(performanceSpecsCollectionName).doc();

    String performanceSpecsId = performanceSpecsDocRef.id;

    batch.set(performanceSpecsDocRef, {
      'id': performanceSpecsId,
      'autoId': autoId,
      'topSpeed': 275,
      'zeroToHundred': 4.9,
      'urbanConsumption': 9,
      'highwayConsumption': 12.2,
      'weightToPowerRatio': 4.6,
      'creationDate': creationDate,
    });

    ////////////////////////////////////////////////////////////////////

    var engineSpecsDocRef =
        dbReference.collection(engineSpecsCollectionName).doc();

    String engineSpecsId = engineSpecsDocRef.id;

    batch.set(engineSpecsDocRef, {
      'id': engineSpecsId,
      'autoId': autoId,
      'horsePower': 300,
      'horsePowerRPM': 6500,
      'torque': 38.7,
      'torqueRPM': 1950,
      'maxRPM': 7500,
      'engineInstalation': 'Instalação traseira',
      'creationDate': creationDate,
    });

    ////////////////////////////////////////////////////////////////////

    var transmissionSpecsDocRef =
        dbReference.collection(transmissionSpecsCollectionName).doc();

    String transmissionSpecsId = transmissionSpecsDocRef.id;

    batch.set(transmissionSpecsDocRef, {
      'id': transmissionSpecsId,
      'autoId': autoId,
      'traction': 'Traseira',
      'code': 'PDK',
      'gearbox': 'Automatizado de 7 marchas',
      'gearShift': 'Embreagem dupla banhada a óleo',
      'creationDate': creationDate,
    });

    ////////////////////////////////////////////////////////////////////

    var dimensionsSpecsDocRef =
        dbReference.collection(dimensionsSpecsCollectionName).doc();

    String dimensionsSpecsId = dimensionsSpecsDocRef.id;

    batch.set(dimensionsSpecsDocRef, {
      'id': dimensionsSpecsId,
      'autoId': autoId,
      'length': 4379,
      'width': 1801,
      'height': 1281,
      'weight': 1365,
      'trunkCapacity': 275,
      'creationDate': creationDate,
    });

    ////////////////////////////////////////////////////////////////////
    
    var aditionalSpecsDocRef =
        dbReference.collection(aditionalSpecsCollectionName).doc();

    String aditionalSpecsId = aditionalSpecsDocRef.id;

    batch.set(aditionalSpecsDocRef, {
      'id': aditionalSpecsId,
      'autoId': autoId,
      'cylinderCapacity': 1988,
      'lengthBetweenAxis': 2475,
      'fuelCapacity': 54,
      'engineCode': '---',
      'generation': '982',
      'creationDate': creationDate,
    });

    ////////////////////////////////////////////////////////////////////

    await batch.commit();
  }
}
