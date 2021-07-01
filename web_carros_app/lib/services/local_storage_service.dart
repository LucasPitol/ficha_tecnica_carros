import 'package:web_carros_app/models/dtos/response_dto.dart';
import 'package:web_carros_app/models/auto.dart';

class LocalStorageService {
  Future<ResponseDto> getFavoriteAutos() async {
    ResponseDto res = ResponseDto();
    List<Auto> autos = [];

    Auto m1 = Auto();
    m1.id = '1';
    m1.brand = 'Porsche';
    m1.model = '911';
    m1.version = '3.7 Turbo';
    m1.autoImagePath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/carImages%2Fporsche-model.webp?alt=media&token=e9470c03-ee7a-4f83-bff6-978a77fba992';
    m1.brandImagePath = '';
    m1.fipe = 1249000.00;
    m1.creationDate = DateTime.now();

    Auto m2 = Auto();
    m2.id = '2';
    m2.brand = 'Porsche';
    m2.model = 'Tycan';
    m2.version = '4S Cross Turismo';
    m2.autoImagePath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/carImages%2Fporsche-tycan-4s-cross-turismo.png?alt=media&token=f26315d7-e047-45cd-845b-a8da761e86cc';
    m2.brandImagePath = '';
    m2.fipe = 1420000.00;
    m2.creationDate = DateTime.now();

    autos.add(m1);
    autos.add(m2);

    await Future.delayed(Duration(milliseconds: 1000), () {
      res.success = true;
      res.data = autos;
    });

    return res;
  }
}
