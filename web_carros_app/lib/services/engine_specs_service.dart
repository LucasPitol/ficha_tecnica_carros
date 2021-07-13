import 'package:web_carros_app/db/engine_specs_dao.dart';
import 'package:web_carros_app/models/engine_specs.dart';

class EngineSpecsService {
  EngineSpecsDao _dao;

  EngineSpecsService() {
    this._dao = EngineSpecsDao();
  }

  Future<EngineSpecs> getEngineSpecsByAutoId(String autoId) async {

    EngineSpecs ps = await this._dao.getEngineSpecsByAutoId(autoId);

    return ps;
  }
}