import 'package:web_carros_app/db/dimensions_specs_dao.dart';
import 'package:web_carros_app/models/dimensions_specs.dart';

class DimensionsSpecsService {
  DimensionsSpecsDao _dao;

  DimensionsSpecsService() {
    this._dao = DimensionsSpecsDao();
  }

  Future<DimensionsSpecs> getDimensionsSpecsByAutoId(String autoId) async {

    DimensionsSpecs ps = await this._dao.getDimensionsSpecsByAutoId(autoId);

    return ps;
  }
}