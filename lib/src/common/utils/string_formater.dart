class StringFormater {
  /// format text to query
  /// [text] text to format
  /// [returns] formatted text
  static String textToQuery(String text) {
    return text.replaceAll(' ', '+');
  }

  /// format minutes to hours
  /// [minutes] minutes to format
  /// [returns] formatted minutes to hours
  static String minutesToHours(int minutes) {
    final int hours = minutes ~/ 60;
    final int remainingMinutes = minutes % 60;
    return "${hours}h ${remainingMinutes}m";
  }
}
