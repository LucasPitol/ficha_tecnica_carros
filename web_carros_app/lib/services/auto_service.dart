import 'package:web_carros_app/models/dtos/auto_specs_dto.dart';
import 'package:web_carros_app/models/transmission_specs.dart';
import 'package:web_carros_app/models/dtos/response_dto.dart';
import 'package:web_carros_app/models/dimensions_specs.dart';
import 'package:web_carros_app/models/performace_specs.dart';
import 'package:web_carros_app/models/dtos/filterDto.dart';
import 'package:web_carros_app/models/engine_specs.dart';
import 'package:web_carros_app/models/auto.dart';
import 'package:web_carros_app/db/auto_dao.dart';

import 'performance_specs_service.dart';
import 'engine_specs_service.dart';

class AutoService {
  AutoDao _dao;
  PerformanceSpecsService _performanceSpecsService;
  EngineSpecsService _engineSpecsService;

  AutoService() {
    this._dao = AutoDao();
    this._performanceSpecsService = PerformanceSpecsService();
    this._engineSpecsService = EngineSpecsService();
  }

  mockData() {
    // this._dao.mockData();
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

    PerformanceSpecs performanceSpecs = await this._performanceSpecsService.getPerformanceSpecsByAutoId(autoId);

    autoSpecsDto.performanceSpecs = performanceSpecs;

    EngineSpecs engineSpecs = await this._engineSpecsService.getEngineSpecsByAutoId(autoId);

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
    dimensionsSpecs.height = 1303;
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
