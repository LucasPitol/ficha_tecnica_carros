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
      'autoImagePathList': [
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/carImages%2Fm8-2020-side-removebg-preview.png?alt=media&token=65f76d2d-349b-403c-a9cf-b362e02fb19a',
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/carImages%2Fm8-2020-front-removebg-preview.png?alt=media&token=940a84f4-d875-4c05-8e5a-7f91a717ea55',
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/carImages%2Fm8-2020-intro-removebg-preview.png?alt=media&token=2699ed0a-4f2e-4db3-a5b8-de137e2f88b4',
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/carImages%2Fm8-2020-back-removebg-preview.png?alt=media&token=9437f730-7e3e-4683-b841-cd6e12ea55b1',
      ],
      'brand': 'BMW',
      'brandImagePath':
          'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2Fbmw-m.png?alt=media&token=fae752b2-d7f3-4a09-aa85-682933e2f9c3',
      'generation': 'G16',
      'model': 'M8',
      'version': 'Gran Coupe Competition',
      'initYear': 2018,
      // 'endYear': 2020,
      'bodywork': 2,
      'creationDate': creationDate,
    });

    ////////////////////////////////////////////////////////////////////

    var performanceSpecsDocRef =
        dbReference.collection(performanceSpecsCollectionName).doc();

    String performanceSpecsId = performanceSpecsDocRef.id;

    batch.set(performanceSpecsDocRef, {
      'id': performanceSpecsId,
      'autoId': autoId,
      'topSpeed': 305,
      'zeroToHundred': 3.3,
      'urbanConsumption': 6.6,
      'highwayConsumption': 8.7,
      'weightToPowerRatio': 3.2,
      'creationDate': creationDate,
    });

    ////////////////////////////////////////////////////////////////////

    var engineSpecsDocRef =
        dbReference.collection(engineSpecsCollectionName).doc();

    String engineSpecsId = engineSpecsDocRef.id;

    batch.set(engineSpecsDocRef, {
      'id': engineSpecsId,
      'autoId': autoId,
      'description': 'V8 4.4 Turbo',
      'horsePower': 625,
      'horsePowerRPM': 6000,
      'torque': 76.5,
      'torqueRPM': 1800,
      'maxRPM': 7300,
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
      'code': 'ZF 8HP',
      'gearbox': 'Automático de 8 marchas',
      'gearShift': 'Conversor de torque',
      'creationDate': creationDate,
    });

    ////////////////////////////////////////////////////////////////////

    var dimensionsSpecsDocRef =
        dbReference.collection(dimensionsSpecsCollectionName).doc();

    String dimensionsSpecsId = dimensionsSpecsDocRef.id;

    batch.set(dimensionsSpecsDocRef, {
      'id': dimensionsSpecsId,
      'autoId': autoId,
      'length': 5098,
      'width': 1943,
      'height': 1420,
      'weight': 1980,
      'trunkCapacity': 440,
      'creationDate': creationDate,
    });

    ////////////////////////////////////////////////////////////////////

    var aditionalSpecsDocRef =
        dbReference.collection(aditionalSpecsCollectionName).doc();

    String aditionalSpecsId = aditionalSpecsDocRef.id;

    batch.set(aditionalSpecsDocRef, {
      'id': aditionalSpecsId,
      'autoId': autoId,
      'cylinderCapacity': 4395,
      'lengthBetweenAxis': 3027,
      'fuelCapacity': 68,
      'engineCode': 'S63B44',
      'generation': 'G16',
      'creationDate': creationDate,
    });

    ////////////////////////////////////////////////////////////////////

    await batch.commit();
  }
}
