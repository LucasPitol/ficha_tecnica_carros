import 'package:web_carros_app/models/brand.dart';
import 'package:web_carros_app/models/dtos/response_dto.dart';
import 'package:web_carros_app/models/model.dart';

class BrandService {
  Future<ResponseDto> getModelsByBrandId(String brandId) async {
    ResponseDto res = ResponseDto();
    List<Model> models = [];

    res.data = models;

    return res;
  }

  Future<ResponseDto> getBrands() async {
    ResponseDto res = ResponseDto();
    List<Brand> brands = [];

    Brand b1 = Brand();
    b1.id = 'PORSCHE';
    b1.name = 'Porsche';
    b1.brandImgPath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FPorsche-Logo.png?alt=media&token=d0d40104-746e-4f01-a3da-17c9e6efc324';

    Brand b2 = Brand();
    b2.id = 'MERCEDES_BENZ';
    b2.name = 'Mercedes Benz';
    b2.brandImgPath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FMercedes-Benz-Logo.png?alt=media&token=24a6bd78-26f0-4b20-b825-371cdc297c7a';

    Brand b3 = Brand();
    b3.id = 'BMW';
    b3.name = 'BMW';
    b3.brandImgPath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FBMW-Logo.png?alt=media&token=b1d7016d-9583-4cc0-b1cb-7dd0f3be23ab';

    Brand b4 = Brand();
    b4.id = 'JAGUAR';
    b4.name = 'Jaguar';
    b4.brandImgPath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FJaguar-Logo.png?alt=media&token=272be69f-c2fb-449a-9b2f-c3db1d7207a7';

    Brand b5 = Brand();
    b5.id = 'AUDI';
    b5.name = 'Audi';
    b5.brandImgPath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FAudi-Logo.png?alt=media&token=aa52242c-9c4d-4e47-8932-3198244239bb';

    Brand b6 = Brand();
    b6.id = 'LAMBORGHINI';
    b6.name = 'Lamborghini';
    b6.brandImgPath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FLamborghini-Logo.png?alt=media&token=8a80bd34-9f62-4c5a-bc00-9e8dc0066ffa';

    Brand b7 = Brand();
    b7.id = 'VOLKSWAGEN';
    b7.name = 'Volkswagen';
    b7.brandImgPath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FVolkswagen-Logo.png?alt=media&token=9ed25c0b-ee5a-4bf7-acd8-2e874ddb0975';

    Brand b8 = Brand();
    b8.id = 'FERRARI';
    b8.name = 'Ferrari';
    b8.brandImgPath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FFerrari-Logo.png?alt=media&token=34547e5d-8422-406f-8d0a-0aedf0504690';

    Brand b9 = Brand();
    b9.id = 'TESLA';
    b9.name = 'Tesla';
    b9.brandImgPath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FTesla-Logo.png?alt=media&token=4ae2e72c-7253-4e10-83b6-e954ea38ac1b';

    Brand b10 = Brand();
    b10.id = 'ROLLS_ROYCE';
    b10.name = 'Rolls Royce';
    b10.brandImgPath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FRolls-Royce-Logo.png?alt=media&token=83c96bc8-8440-4f0f-b667-a9412bc292a7';

    Brand b11 = Brand();
    b11.id = 'HONDA';
    b11.name = 'Honda';
    b11.brandImgPath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FHonda-Logo.png?alt=media&token=d3264ef8-26ca-4350-8a61-c8253b1df374';

    Brand b12 = Brand();
    b12.id = 'TOYOTA';
    b12.name = 'Toyota';
    b12.brandImgPath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FToyota-Logo.png?alt=media&token=e51364c1-0a4b-4573-a199-d7876b8590d5';

    Brand b13 = Brand();
    b13.id = 'NISSAN';
    b13.name = 'Nissan';
    b13.brandImgPath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FNissan-Logo.png?alt=media&token=b0ca24b5-cb6b-40ab-a775-cb2b7376f9ba';

    Brand b14 = Brand();
    b14.id = 'MINI';
    b14.name = 'Mini';
    b14.brandImgPath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FMini-Logo.png?alt=media&token=05c33128-4ff4-4bea-876f-f1a81d7cf661';

    Brand b15 = Brand();
    b15.id = 'ASTON_MARTIN';
    b15.name = 'Aston Martin';
    b15.brandImgPath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FAston-Martin-Logo.png?alt=media&token=d738ddb0-31be-48f7-b42f-3ab03a411574';

    brands.add(b1);
    brands.add(b2);
    brands.add(b3);
    brands.add(b4);
    brands.add(b5);
    brands.add(b6);
    brands.add(b7);
    brands.add(b8);
    brands.add(b9);
    brands.add(b10);
    brands.add(b11);
    brands.add(b12);
    brands.add(b13);
    brands.add(b14);
    brands.add(b15);

    brands.sort((a, b) => a.name.compareTo(b.name));

    await Future.delayed(Duration(milliseconds: 1000), () {
      res.success = true;
      res.data = brands;
    });

    return res;
  }
}
