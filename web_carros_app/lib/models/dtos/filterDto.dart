import '../brand.dart';

class FilterDto {
  Brand brand;
  int bodywork;
  String model;
  int initYear;
  int endYear;

  FilterDto() {
    this.bodywork = null;
    this.initYear = 1900;
    this.endYear = (DateTime.now().year) + 1;
  }
}
