import 'package:web_carros_app/models/dimensions_specs.dart';
import 'package:web_carros_app/models/dtos/auto_specs_sto.dart';
import 'package:web_carros_app/models/dtos/filterDto.dart';
import 'package:web_carros_app/models/dtos/response_dto.dart';
import 'package:web_carros_app/models/auto.dart';
import 'package:web_carros_app/models/engine_specs.dart';
import 'package:web_carros_app/models/performace_specs.dart';
import 'package:web_carros_app/models/transmission_specs.dart';

class AutoService {
  Future<ResponseDto> getAutoSpecs(String autoId) async {
    ResponseDto res = ResponseDto();
    AutoSpecsDto autoSpecsDto = AutoSpecsDto();

    PerformanceSpecs performanceSpecs = PerformanceSpecs();

    performanceSpecs.autoId = autoId;
    performanceSpecs.highwayConsumption = 9.1;
    performanceSpecs.urbanConsumption = 6.9;
    performanceSpecs.topSpeed = 330;
    performanceSpecs.weightToPowerRatio = 2.5;
    performanceSpecs.zeroToHundred = 2.7;

    autoSpecsDto.performanceSpecs = performanceSpecs;

    EngineSpecs engineSpecs = EngineSpecs();
    engineSpecs.autoId = autoId;
    engineSpecs.cylinderCapacity = 3745;
    engineSpecs.engineInstalation = 'Instalação traseira';
    engineSpecs.horsePower = 650;
    engineSpecs.horsePowerRPM = 6750;
    engineSpecs.torque = 81.6;
    engineSpecs.torqueRPM = 2500;
    engineSpecs.maxRPM = 7200;

    autoSpecsDto.engineSpecs = engineSpecs;

    TransmissionSpecs transmissionSpecs = TransmissionSpecs();
    transmissionSpecs.autoId = autoId;
    transmissionSpecs.code = 'PDK';
    transmissionSpecs.tranction = 'Tração integral';
    transmissionSpecs.gearbox = 'Automatizado de 8 marchas';
    transmissionSpecs.gearshift = 'Embreagem dupla banhada a óleo';

    autoSpecsDto.transmissionSpecs = transmissionSpecs;

    DimensionsSpecs dimensionsSpecs = DimensionsSpecs();
    dimensionsSpecs.autoId = autoId;
    dimensionsSpecs.fuelCapacity = 68;
    dimensionsSpecs.height = 1303;
    dimensionsSpecs.lenghtBetweenAxis = 2450;
    dimensionsSpecs.length = 4535;
    dimensionsSpecs.width = 1900;
    dimensionsSpecs.weight = 1640;
    dimensionsSpecs.trunkCapacity = 392;

    autoSpecsDto.dimensionsSpecs = dimensionsSpecs;

    await Future.delayed(Duration(milliseconds: 1000), () {
      res.success = true;
      res.data = autoSpecsDto;
    });

    return res;
  }

  Future<ResponseDto> getFilteredAutos(FilterDto filter) async {
    ResponseDto res = ResponseDto();
    List<Auto> autos = [];

    Auto m1 = Auto();
    m1.id = '1';
    m1.brand = 'Porsche';
    m1.model = '911';
    m1.version = '3.7 Turbo';
    m1.autoImagePath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/carImages%2Fporsche-model.webp?alt=media&token=e9470c03-ee7a-4f83-bff6-978a77fba992';
    m1.brandImagePath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FPorsche-Logo.png?alt=media&token=d0d40104-746e-4f01-a3da-17c9e6efc324';
    m1.fipe = 1249000.00;
    m1.year = 2021;
    m1.creationDate = DateTime.now();

    Auto m2 = Auto();
    m2.id = '2';
    m2.brand = 'Porsche';
    m2.model = 'Tycan';
    m2.version = '4S Cross Turismo';
    m2.autoImagePath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/carImages%2Fporsche-tycan-4s-cross-turismo.png?alt=media&token=f26315d7-e047-45cd-845b-a8da761e86cc';
    m2.brandImagePath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FPorsche-Logo.png?alt=media&token=d0d40104-746e-4f01-a3da-17c9e6efc324';
    m2.fipe = 1420000.00;
    m2.year = 2021;
    m2.creationDate = DateTime.now();

    autos.add(m1);
    autos.add(m2);

    await Future.delayed(Duration(milliseconds: 1000), () {
      res.success = true;
      res.data = autos;
    });

    return res;
  }
}
