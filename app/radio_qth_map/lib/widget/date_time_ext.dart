extension DateTimeExtension on DateTime {
  static DateTime? tryParseUTC(String value) {
    final parsed = DateTime.tryParse(value);
    if (parsed == null) {
      return null;
    } else {
      return DateTime.utc(
        parsed.year,
        parsed.month,
        parsed.day,
        parsed.hour,
        parsed.minute,
        parsed.second,
        parsed.millisecond,
        parsed.microsecond,
      );
    }
  }
}
