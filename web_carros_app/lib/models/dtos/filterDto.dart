class FilterDto {
  String brand;
  String model;
  DateTime initDate;
  DateTime endDate;

  FilterDto() {
    this.initDate = DateTime(1900, 01, 01);
    this.endDate = DateTime.now();
  }
}
