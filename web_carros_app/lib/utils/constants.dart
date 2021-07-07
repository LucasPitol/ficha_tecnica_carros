class Constants {
  static const int home_page_index = 0;
  static const int list_page_index = 1;

  static const String empty_string = '---';

  static getYears() {
    int initYear = 1900;
    int finalYear = DateTime.now().year;

    List<int> years = [];

    for (int i = initYear; i <= finalYear; i++) {
      years.add(i);
    }

    return years;
  }
}
