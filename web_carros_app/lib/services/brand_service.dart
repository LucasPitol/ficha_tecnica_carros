import 'package:web_carros_app/models/brand.dart';
import 'package:web_carros_app/models/dtos/response_dto.dart';

class BrandService {

  Future<ResponseDto> getBrands() async {
    ResponseDto res = ResponseDto();
    List<Brand> brands = [];

    Brand b1 = Brand();
    b1.id = 'PORSCHE';
    b1.name = 'Porsche';

    Brand b2 = Brand();
    b2.id = 'MERCEDES_BENZ';
    b2.name = 'Mercedes Benz';

    Brand b3 = Brand();
    b3.id = 'BMW';
    b3.name = 'BMW';

    Brand b4 = Brand();
    b4.id = 'JAGUAR';
    b4.name = 'Jaguar';

    Brand b5 = Brand();
    b5.id = 'AUDI';
    b5.name = 'Audi';

    Brand b6 = Brand();
    b6.id = 'VOLKSWAGEN';
    b6.name = 'Volkswagen';

    brands.add(b1);
    brands.add(b2);
    brands.add(b3);
    brands.add(b4);
    brands.add(b5);
    brands.add(b6);

    await Future.delayed(Duration(milliseconds: 1000), () {
      res.success = true;
      res.data = brands;
    });

    return res;
  }
}
