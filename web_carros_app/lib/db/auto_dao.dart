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

  Future<List<Auto>> getAutosByBodywork(List<int> bodyworkList) async {
    List<Auto> autos = [];

    await dbReference
        .collection(autosCollectionName)
        .where('bodywork', whereIn: bodyworkList)
        .get()
        .then((snapShot) {
      snapShot.docs.forEach((item) {
        var auto = Auto(item);

        autos.add(auto);
      });
    });

    return autos;
  }

  Future<List<Auto>> getAutosByBrand(
      String brandName, List<int> bodyworkList) async {
    List<Auto> autos = [];

    await dbReference
        .collection(autosCollectionName)
        .where('bodywork', whereIn: bodyworkList)
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
          'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/carImages%2Fporsche-macan-gtsthumbnail.png?alt=media&token=05d20f63-8281-4c3f-9c17-d2a907b83265',
      'brand': 'Porsche',
      'brandImagePath':
          'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FPorsche-Logo.png?alt=media&token=d0d40104-746e-4f01-a3da-17c9e6efc324',
      'generation': '95B',
      'model': 'Macan',
      'version': 'GTS 2.9',
      'initYear': 2021,
      'bodywork': 'SUV',
      'creationDate': creationDate,
    });

    ////////////////////////////////////////////////////////////////////

    var performanceSpecsDocRef =
        dbReference.collection(performanceSpecsCollectionName).doc();

    String performanceSpecsId = performanceSpecsDocRef.id;

    batch.set(performanceSpecsDocRef, {
      'id': performanceSpecsId,
      'autoId': autoId,
      'topSpeed': 261,
      'zeroToHundred': 4.7,
      'urbanConsumption': 7,
      'highwayConsumption': 9,
      'weightToPowerRatio': 5.0,
      'creationDate': creationDate,
    });

    ////////////////////////////////////////////////////////////////////

    var engineSpecsDocRef =
        dbReference.collection(engineSpecsCollectionName).doc();

    String engineSpecsId = engineSpecsDocRef.id;

    batch.set(engineSpecsDocRef, {
      'id': engineSpecsId,
      'autoId': autoId,
      'description': 'V6 2.9 turbo',
      'horsePower': 380,
      'horsePowerRPM': 5200,
      'torque': 53,
      'torqueRPM': 1750,
      'maxRPM': 6800,
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
      'traction': 'Tração integral',
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
      'length': 4686,
      'width': 1926,
      'height': 1609,
      'weight': 1910,
      'trunkCapacity': 488,
      'creationDate': creationDate,
    });

    ////////////////////////////////////////////////////////////////////

    var aditionalSpecsDocRef =
        dbReference.collection(aditionalSpecsCollectionName).doc();

    String aditionalSpecsId = aditionalSpecsDocRef.id;

    batch.set(aditionalSpecsDocRef, {
      'id': aditionalSpecsId,
      'autoId': autoId,
      'cylinderCapacity': 2894,
      'lengthBetweenAxis': 2807,
      'fuelCapacity': 65,
      'engineCode': '',
      'generation': '95B',
      'creationDate': creationDate,
    });

    ////////////////////////////////////////////////////////////////////

    await batch.commit();
  }
}
