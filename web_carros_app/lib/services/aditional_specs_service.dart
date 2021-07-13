import 'package:web_carros_app/db/aditional_specs_dao.dart';
import 'package:web_carros_app/models/aditional_specs.dart';

class AditionalSpecsService {
  AditionalSpecsDao _dao;

  AditionalSpecsService() {
    this._dao = AditionalSpecsDao();
  }

  Future<AditionalSpecs> getAditionalSpecsByAutoId(String autoId) async {

    AditionalSpecs ps = await this._dao.getAditionalSpecsByAutoId(autoId);

    return ps;
  }
}