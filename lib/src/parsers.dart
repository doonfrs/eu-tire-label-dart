import 'enums.dart';

/// Parse tire class from string
TireClass parseTireClass(String str) {
  final value = int.tryParse(str);
  if (value != null && value >= 1 && value <= 3) {
    return TireClass.fromValue(value);
  }

  print('warning: invalid tire class: $str');
  return TireClass.error;
}

/// Parse fuel efficiency class from string
FuelEfficiencyClass parseFuelEfficiencyClass(String str) {
  final value = int.tryParse(str);
  if (value != null && value >= 1 && value <= 7) {
    return FuelEfficiencyClass.fromValue(value);
  }

  if (str.length == 1) {
    final char = str.toLowerCase();
    if (char.codeUnitAt(0) >= 'a'.codeUnitAt(0) &&
        char.codeUnitAt(0) <= 'g'.codeUnitAt(0)) {
      return FuelEfficiencyClass.fromValue(
        char.codeUnitAt(0) - 'a'.codeUnitAt(0) + 1,
      );
    }
  }

  print('warning: invalid fuel efficiency class: $str');
  return FuelEfficiencyClass.none;
}

/// Parse wet grip class from string
WetGripClass parseWetGripClass(String str) {
  final value = int.tryParse(str);
  if (value != null && value >= 1 && value <= 7) {
    return WetGripClass.fromValue(value);
  }

  if (str.length == 1) {
    final char = str.toLowerCase();
    if (char.codeUnitAt(0) >= 'a'.codeUnitAt(0) &&
        char.codeUnitAt(0) <= 'g'.codeUnitAt(0)) {
      return WetGripClass.fromValue(char.codeUnitAt(0) - 'a'.codeUnitAt(0) + 1);
    }
  }

  print('warning: invalid wet grip class: $str');
  return WetGripClass.none;
}

/// Parse rolling noise class from string
RollingNoiseClass parseRollingNoiseClass(String str) {
  final value = int.tryParse(str);
  if (value != null && value >= 1 && value <= 3) {
    return RollingNoiseClass.fromValue(value);
  }

  if (str.length == 1) {
    final char = str.toLowerCase();
    if (char.codeUnitAt(0) >= 'a'.codeUnitAt(0) &&
        char.codeUnitAt(0) <= 'c'.codeUnitAt(0)) {
      return RollingNoiseClass.fromValue(
        char.codeUnitAt(0) - 'a'.codeUnitAt(0) + 1,
      );
    }
  }

  print('warning: invalid rolling noise class: $str');
  return RollingNoiseClass.none;
}

/// Parse rolling noise dB value from string
int parseRollingNoiseDb(String str) {
  final value = int.tryParse(str);
  if (value != null && value >= 10 && value <= 120) {
    return value;
  }

  print('warning: invalid rolling noise dB value: $str');
  return 0;
}

/// Sanitize plain text by replacing CDATA end markers
bool sanitizePlainText(String text) {
  return text.contains(']]>');
}

/// URL encode a string
String urlEncode(String text) {
  return Uri.encodeComponent(
    text,
  ).replaceAll('%', '%25').replaceAll('"', '%22');
}
