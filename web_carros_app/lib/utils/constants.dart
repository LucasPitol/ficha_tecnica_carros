
class Constants {
  static const int home_page_index = 0;
  static const int list_page_index = 1;

  static const String empty_string = '---';

  static const String instagramUrl = 'https://www.instagram.com/rid_cars_/';

  static Map<int, String> bodyworkMap = {
    0: 'Todos',
    1: 'Conversível',
    2: 'Coupe',
    3: 'Hatch',
    4: 'Perua',
    5: 'Picape',
    6: 'Sedan',
    7: 'SUV',
  };

  static getYears() {
    int initYear = 1900;
    int finalYear = (DateTime.now().year) + 1;

    List<int> years = [];

    for (int i = initYear; i <= finalYear; i++) {
      years.add(i);
    }

    return years;
  }
}
