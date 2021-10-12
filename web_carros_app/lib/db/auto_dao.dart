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
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/carImages%2Fporsche-911-carrera-s-991-lado-removebg-preview.png?alt=media&token=a6934971-aa61-4e66-87e6-33e5ca5ea3bb',
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/carImages%2Fporsche-911-carrera-s-991-frente-removebg-preview.png?alt=media&token=f99931c3-2248-42d3-8ad6-a9312604b46a',
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/carImages%2Fporsche-911-carrera-s-991-removebg-preview.png?alt=media&token=e59c00a5-03c3-4ab3-be7f-6677495222aa',
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/carImages%2Fporsche-911-carrera-s-991-tras-removebg-preview.png?alt=media&token=f10c9127-4735-4cbd-81c3-a3deb6a42bd3',
      ],
      'brand': 'Porsche',
      'brandImagePath':
          'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FPorsche-Logo.png?alt=media&token=d0d40104-746e-4f01-a3da-17c9e6efc324',
      'generation': '991',
      'model': '911',
      'version': 'Carrera S',
      'initYear': 2011,
      'endYear': 2019,
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
      'topSpeed': 302,
      'zeroToHundred': 4.3,
      'urbanConsumption': 6.5,
      'highwayConsumption': 9,
      'weightToPowerRatio': 3.5,
      'creationDate': creationDate,
    });

    ////////////////////////////////////////////////////////////////////

    var engineSpecsDocRef =
        dbReference.collection(engineSpecsCollectionName).doc();

    String engineSpecsId = engineSpecsDocRef.id;

    batch.set(engineSpecsDocRef, {
      'id': engineSpecsId,
      'autoId': autoId,
      'description': '6 cilindros 3.8 Aspirado',
      'horsePower': 400,
      'horsePowerRPM': 7400,
      'torque': 44.9,
      'torqueRPM': 5600,
      'maxRPM': 0,
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
      'traction': 'Tração traseira',
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
      'length': 4491,
      'width': 1808,
      'height': 1295,
      'weight': 1415,
      'trunkCapacity': 340,
      'creationDate': creationDate,
    });

    ////////////////////////////////////////////////////////////////////

    var aditionalSpecsDocRef =
        dbReference.collection(aditionalSpecsCollectionName).doc();

    String aditionalSpecsId = aditionalSpecsDocRef.id;

    batch.set(aditionalSpecsDocRef, {
      'id': aditionalSpecsId,
      'autoId': autoId,
      'cylinderCapacity': 3800,
      'lengthBetweenAxis': 2450,
      'fuelCapacity': 64,
      'engineCode': '',
      'generation': '991',
      'creationDate': creationDate,
    });

    ////////////////////////////////////////////////////////////////////

    await batch.commit();
  }
}
