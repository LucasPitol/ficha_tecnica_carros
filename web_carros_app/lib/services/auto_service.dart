import 'package:web_carros_app/db/auto_dao.dart';
import 'package:web_carros_app/models/dtos/auto_specs_sto.dart';
import 'package:web_carros_app/models/transmission_specs.dart';
import 'package:web_carros_app/models/dtos/response_dto.dart';
import 'package:web_carros_app/models/dimensions_specs.dart';
import 'package:web_carros_app/models/performace_specs.dart';
import 'package:web_carros_app/models/dtos/filterDto.dart';
import 'package:web_carros_app/models/engine_specs.dart';
import 'package:web_carros_app/models/auto.dart';

class AutoService {

  AutoDao _dao;

  AutoService() {
    this._dao = AutoDao();
  }

  Future<ResponseDto> getNews() async {
    ResponseDto res = ResponseDto();
    List<Auto> autos = [];

    Auto m1 = Auto(null);
    m1.id = '1';
    m1.brand = 'Porsche';
    m1.model = '911';
    m1.version = 'Turbo 3.7';
    m1.autoImagePath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/carImages%2Fporsche-model.webp?alt=media&token=e9470c03-ee7a-4f83-bff6-978a77fba992';
    m1.brandImagePath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FPorsche-Logo.png?alt=media&token=d0d40104-746e-4f01-a3da-17c9e6efc324';
    m1.year = 2022;
    m1.generation = '992';

    Auto m2 = Auto(null);
    m2.id = '2';
    m2.brand = 'Porsche';
    m2.model = 'Tycan';
    m2.version = '4S Cross Turismo';
    m2.autoImagePath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/carImages%2Fporsche-tycan-4s-cross-turismo.png?alt=media&token=f26315d7-e047-45cd-845b-a8da761e86cc';
    m2.brandImagePath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FPorsche-Logo.png?alt=media&token=d0d40104-746e-4f01-a3da-17c9e6efc324';
    m2.year = 2021;
    m2.generation = '';

    Auto m3 = Auto(null);
    m3.id = '3';
    m3.brand = 'Porsche';
    m3.model = '718';
    m3.version = 'Boxter';
    m3.autoImagePath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/carImages%2Fporsche-718-boxter-cabriot.png?alt=media&token=3ae5ea4c-20b1-471f-a96e-cf5e9c1b017a';
    m3.brandImagePath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FPorsche-Logo.png?alt=media&token=d0d40104-746e-4f01-a3da-17c9e6efc324';
    m3.fipe = 371545.00;
    m3.creationDate = DateTime.now();
    m3.year = 2021;
    m3.generation = '982';

    Auto m4 = Auto(null);
    m4.id = '4';
    m4.brand = 'Porsche';
    m4.model = '718';
    m4.version = 'Cayman GT4 4.0';
    m4.autoImagePath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/carImages%2Fporsche-718-cayman-gt4.png?alt=media&token=ac64959d-0084-4e97-a772-f0546ddac24d';
    m4.brandImagePath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FPorsche-Logo.png?alt=media&token=d0d40104-746e-4f01-a3da-17c9e6efc324';
    m4.fipe = 619860.00;
    m4.creationDate = DateTime.now();
    m4.year = 2021;
    m4.generation = '982';

    autos.add(m4);
    autos.add(m2);
    autos.add(m1);
    autos.add(m3);

    await Future.delayed(Duration(milliseconds: 2000), () {
      res.success = true;
      res.data = autos;
    });

    return res;
  }

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

    String brandName = filter.brand.name;
    int initYear = filter.initYear;
    int endYear = filter.endYear;

    List<Auto> autos = await this._dao.getAutosByBrandAndYear(brandName, initYear, endYear);

    res.success = true;
    res.data = autos;

    return res;
  }
}
