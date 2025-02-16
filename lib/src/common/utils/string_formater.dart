class StringFormater {
  static String textToQuery(String text) {
    return text.replaceAll(' ', '+');
  }

  static String minutesToHours(int minutes) {
    final int hours = minutes ~/ 60;
    final int remainingMinutes = minutes % 60;
    return '$hours h $remainingMinutes min';
  }
}
