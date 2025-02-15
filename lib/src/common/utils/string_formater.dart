class StringFormater {
  static String textToQuery(String text) {
    return text.replaceAll(' ', '+');
  }
}
