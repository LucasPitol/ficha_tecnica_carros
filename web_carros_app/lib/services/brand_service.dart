import 'package:web_carros_app/models/dtos/response_dto.dart';
import 'package:web_carros_app/models/brand.dart';
import 'package:web_carros_app/models/model.dart';
import 'package:web_carros_app/db/brand_dao.dart';

class BrandService {
  BrandDao _brandDao;

  BrandService() {
    this._brandDao = BrandDao();
  }

  Future<ResponseDto> getModelsByBrandId(String brandId) async {
    ResponseDto res = ResponseDto();
    List<Model> models = [];

    res.data = models;

    return res;
  }

  Future<ResponseDto> getBrands() async {
    ResponseDto res = ResponseDto();

    List<Brand> brands = await this._brandDao.getBrands();

    brands.sort((a, b) => a.name.compareTo(b.name));

    res.success = true;
    res.data = brands;

    return res;
  }
}
