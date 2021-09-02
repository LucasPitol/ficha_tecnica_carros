import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_carros_app/models/auto.dart';

class AutoDao {
  final dbReference = FirebaseFirestore.instance;
  final String autosCollectionName = 'autos';

  Future<List<Auto>> getByIds(List<String> autoIds) async {
    List<Auto> autos = [];

    await dbReference
        .collection(autosCollectionName)
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
        .collection(autosCollectionName)
        .where('brand', isEqualTo: brandName)
        // .where('initYear', isGreaterThanOrEqualTo: initYear)
        // .where('endYear', isLessThanOrEqualTo: endYear)
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
        .collection(autosCollectionName)
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

    var autoSpecsDocRef = dbReference.collection(autosCollectionName).doc();

    String autoId = autoSpecsDocRef.id;

    batch.set(autoSpecsDocRef, {
      'id': autoId,
      'autoImagePath':
          'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/carImages%2F2021%20(1).png?alt=media&token=5bd5e5cd-9405-4b09-91d0-2ca153dc03f0',
      'brand': 'Audi',
      'brandImagePath':
          'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FAudi-Logo.png?alt=media&token=aa52242c-9c4d-4e47-8932-3198244239bb',
      'generation': '8Y',
      'model': 'A3',
      'version': 'Prestige 1.4 sedan',
      'initYear': 2020,
      'bodywork': 'Sedan',
      'creationDate': creationDate,
    });

    ////////////////////////////////////////////////////////////////////

    var performanceSpecsDocRef =
        dbReference.collection(performanceSpecsCollectionName).doc();

    String performanceSpecsId = performanceSpecsDocRef.id;

    batch.set(performanceSpecsDocRef, {
      'id': performanceSpecsId,
      'autoId': autoId,
      'topSpeed': 227,
      'zeroToHundred': 8.8,
      'urbanConsumption': 11.7,
      'highwayConsumption': 14.2,
      'weightToPowerRatio': 3.7,
      'creationDate': creationDate,
    });

    ////////////////////////////////////////////////////////////////////

    var engineSpecsDocRef =
        dbReference.collection(engineSpecsCollectionName).doc();

    String engineSpecsId = engineSpecsDocRef.id;

    batch.set(engineSpecsDocRef, {
      'id': engineSpecsId,
      'autoId': autoId,
      'description': '4 cilindros 1.4 turbo TFSI',
      'horsePower': 150,
      'horsePowerRPM': 6750,
      'torque': 25.5,
      'torqueRPM': 5000,
      'maxRPM': 0,
      'engineInstalation': 'Instalação dianteira',
      'creationDate': creationDate,
    });

    ////////////////////////////////////////////////////////////////////

    var transmissionSpecsDocRef =
        dbReference.collection(transmissionSpecsCollectionName).doc();

    String transmissionSpecsId = transmissionSpecsDocRef.id;

    batch.set(transmissionSpecsDocRef, {
      'id': transmissionSpecsId,
      'autoId': autoId,
      'traction': 'Tração dianteira',
      'code': 'Tiptronic',
      'gearbox': 'Automatizado de 6 marchas',
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
      'length': 4456,
      'width': 1796,
      'height': 1416,
      'weight': 1240,
      'trunkCapacity': 425,
      'creationDate': creationDate,
    });

    ////////////////////////////////////////////////////////////////////

    var aditionalSpecsDocRef =
        dbReference.collection(aditionalSpecsCollectionName).doc();

    String aditionalSpecsId = aditionalSpecsDocRef.id;

    batch.set(aditionalSpecsDocRef, {
      'id': aditionalSpecsId,
      'autoId': autoId,
      'cylinderCapacity': 1395,
      'lengthBetweenAxis': 2729,
      'fuelCapacity': 50,
      'engineCode': 'M139',
      'generation': '8Y',
      'creationDate': creationDate,
    });

    ////////////////////////////////////////////////////////////////////

    await batch.commit();
  }
}
