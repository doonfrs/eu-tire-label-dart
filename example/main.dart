import 'dart:io';
import 'package:eu_tire_label/eu_tire_label.dart';

void main() {
  // Create a tire label data structure
  final tireData = EuTireLabel(
    title: 'EU Tire Label Example',
    qrcode: 'http://eprel.eu/624150',
    trademark: 'MICHELINE',
    tireType: 'WINTER',
    tireSize: 'P215/65 R15',
    tireClass: TireClass.c1,
    fuelEfficiency: FuelEfficiencyClass.b,
    wetGrip: WetGripClass.e,
    rollingNoise: RollingNoiseClass.rnc2,
    rollingNoiseDb: 72,
    snowGrip: true,
    iceGrip: false,
  );

  // Generate EC/1222/2009 label
  final ecLabel = LabelGenerator.createLabelEC1222(tireData);

  // Write to file
  File('tire-label-EC-1222-2009.svg').writeAsStringSync(ecLabel);
  print('Generated EC/1222/2009 label: tire-label-EC-1222-2009.svg');

  // Generate EU/2020/740 label
  final euLabel = LabelGenerator.createLabelEU2020(tireData);

  // Write to file
  File('tire-label-EU-2020-740.svg').writeAsStringSync(euLabel);
  print('Generated EU/2020/740 label: tire-label-EU-2020-740.svg');

  // Example of parsing values
  print('\nParsing examples:');
  print('Tire class "1" -> ${parseTireClass("1")}');
  print('Fuel efficiency "B" -> ${parseFuelEfficiencyClass("B")}');
  print('Wet grip "E" -> ${parseWetGripClass("E")}');
  print('Rolling noise "2" -> ${parseRollingNoiseClass("2")}');
  print('Rolling noise dB "72" -> ${parseRollingNoiseDb("72")}');
}
