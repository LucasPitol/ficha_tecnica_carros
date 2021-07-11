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

    List<Auto> autos = await this._dao.getNews();

    autos.sort((a, b) => b.creationDate.compareTo(a.creationDate));

    res.success = true;
    res.data = autos;

    return res;
  }

  Future<ResponseDto> getByIds(List<String> autoIds) async {
    ResponseDto res = ResponseDto();

    List<Auto> autos = await this._dao.getByIds(autoIds);

    res.success = true;
    res.data = autos;

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

    List<Auto> autos =
        await this._dao.getAutosByBrandAndYear(brandName, initYear, endYear);

    autos.sort((a, b) => b.year.compareTo(a.year));

    res.success = true;
    res.data = autos;

    return res;
  }
}
