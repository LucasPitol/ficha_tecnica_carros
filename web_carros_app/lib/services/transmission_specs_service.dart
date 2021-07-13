
import 'package:web_carros_app/models/transmission_specs.dart';
import 'package:web_carros_app/db/transmission_dao.dart';

class TransmissionSpecsService {
  TransmissionSpecsDao _dao;

  TransmissionSpecsService() {
    this._dao = TransmissionSpecsDao();
  }

  Future<TransmissionSpecs> getTransmissionSpecsByAutoId(String autoId) async {

    TransmissionSpecs ps = await this._dao.getTransmissionSpecsByAutoId(autoId);

    return ps;
  }
}