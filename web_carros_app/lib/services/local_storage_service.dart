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
    m1.brandImagePath = 'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FPorsche-Logo.png?alt=media&token=d0d40104-746e-4f01-a3da-17c9e6efc324';
    m1.fipe = 1249000.00;
    m1.creationDate = DateTime.now();

    Auto m2 = Auto();
    m2.id = '2';
    m2.brand = 'Porsche';
    m2.model = 'Tycan';
    m2.version = '4S Cross Turismo';
    m2.autoImagePath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/carImages%2Fporsche-tycan-4s-cross-turismo.png?alt=media&token=f26315d7-e047-45cd-845b-a8da761e86cc';
    m2.brandImagePath = 'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FPorsche-Logo.png?alt=media&token=d0d40104-746e-4f01-a3da-17c9e6efc324';
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

  Future<ResponseDto> getNews() async {
    ResponseDto res = ResponseDto();
    List<Auto> autos = [];

    Auto m1 = Auto();
    m1.id = '1';
    m1.brand = 'Porsche';
    m1.model = '911';
    m1.version = '3.7 Turbo';
    m1.autoImagePath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/carImages%2Fporsche-model.webp?alt=media&token=e9470c03-ee7a-4f83-bff6-978a77fba992';
    m1.brandImagePath = 'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FPorsche-Logo.png?alt=media&token=d0d40104-746e-4f01-a3da-17c9e6efc324';
    m1.fipe = 1249000.00;
    m1.creationDate = DateTime.now();

    Auto m2 = Auto();
    m2.id = '2';
    m2.brand = 'Porsche';
    m2.model = 'Tycan';
    m2.version = '4S Cross Turismo';
    m2.autoImagePath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/carImages%2Fporsche-tycan-4s-cross-turismo.png?alt=media&token=f26315d7-e047-45cd-845b-a8da761e86cc';
    m2.brandImagePath = 'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FPorsche-Logo.png?alt=media&token=d0d40104-746e-4f01-a3da-17c9e6efc324';
    m2.fipe = 1420000.00;
    m2.creationDate = DateTime.now();

    Auto m3 = Auto();
    m3.id = '3';
    m3.brand = 'Porsche';
    m3.model = '718';
    m3.version = 'Boxter';
    m3.autoImagePath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/carImages%2Fporsche-718-boxter-cabriot.png?alt=media&token=3ae5ea4c-20b1-471f-a96e-cf5e9c1b017a';
    m3.brandImagePath = 'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FPorsche-Logo.png?alt=media&token=d0d40104-746e-4f01-a3da-17c9e6efc324';
    m3.fipe = 371545.00;
    m3.creationDate = DateTime.now();

    Auto m4 = Auto();
    m4.id = '4';
    m4.brand = 'Porsche';
    m4.model = '718';
    m4.version = 'Cayman GT4';
    m4.autoImagePath =
        'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/carImages%2Fporsche-718-cayman-gt4.png?alt=media&token=ac64959d-0084-4e97-a772-f0546ddac24d';
    m4.brandImagePath = 'https://firebasestorage.googleapis.com/v0/b/web-carros-3cb2a.appspot.com/o/brandImages%2FPorsche-Logo.png?alt=media&token=d0d40104-746e-4f01-a3da-17c9e6efc324';
    m4.fipe = 619860.00;
    m4.creationDate = DateTime.now();

    autos.add(m4);
    autos.add(m2);
    autos.add(m1);
    autos.add(m3);

    await Future.delayed(Duration(milliseconds: 2000), () {
      res.success = true;
      res.data = autos;
    });

    return res;
  }
}
