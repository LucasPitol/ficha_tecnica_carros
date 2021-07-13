import 'package:web_carros_app/db/performance_specs_dao.dart';
import 'package:web_carros_app/models/performace_specs.dart';

class PerformanceSpecsService {
  PerformanceSpecsDao _dao;

  PerformanceSpecsService() {
    this._dao = PerformanceSpecsDao();
  }

  Future<PerformanceSpecs> getPerformanceSpecsByAutoId(String autoId) async {

    PerformanceSpecs ps = await this._dao.getPerformanceSpecsByAutoId(autoId);

    return ps;
  }
}
