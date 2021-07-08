import '../brand.dart';

class FilterDto {
  Brand brand;
  String model;
  int initYear;
  int endYear;

  FilterDto() {
    this.initYear = 1900;
    this.endYear = (DateTime.now().year) + 1;
  }
}
