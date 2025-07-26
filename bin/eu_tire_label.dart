#!/usr/bin/env dart

import 'dart:io';
import 'package:eu_tire_label/eu_tire_label.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    printUsage();
    exit(1);
  }

  final command = arguments[0];

  switch (command) {
    case 'generate':
      generateLabel(arguments.skip(1).toList());
      break;
    case 'parse':
      parseValues(arguments.skip(1).toList());
      break;
    case 'help':
    case '--help':
    case '-h':
      printUsage();
      break;
    default:
      print('Unknown command: $command');
      printUsage();
      exit(1);
  }
}

void printUsage() {
  print('''
EU Tire Label Generator - Dart Port

Usage:
  dart run eu_tire_label.dart generate [options]     Generate a tire label
  dart run eu_tire_label.dart parse <value>          Parse a classification value
  dart run eu_tire_label.dart help                   Show this help

Generate options:
  --title <text>              Label title
  --qrcode <url>              QR code URL
  --trademark <text>          Trademark/brand
  --tire-type <text>          Tire type (SUMMER/WINTER)
  --tire-size <text>          Tire size designation
  --tire-class <1-3>          Tire class (1=C1, 2=C2, 3=C3)
  --fuel-efficiency <A-G>     Fuel efficiency class
  --wet-grip <A-G>            Wet grip class
  --rolling-noise <1-3>       Rolling noise class
  --rolling-noise-db <10-120> Rolling noise in dB
  --snow-grip                 Enable snow grip indicator
  --ice-grip                  Enable ice grip indicator
  --output <file>             Output file (default: tire-label.svg)
  --format <EC1222|EU2020>    Label format (default: EC1222)

Parse examples:
  dart run eu_tire_label.dart parse tire-class 1
  dart run eu_tire_label.dart parse fuel-efficiency B
  dart run eu_tire_label.dart parse wet-grip E
  dart run eu_tire_label.dart parse rolling-noise 2
  dart run eu_tire_label.dart parse rolling-noise-db 72

Examples:
  dart run eu_tire_label.dart generate \\
    --title "Example Tire" \\
    --trademark "MICHELINE" \\
    --tire-size "P215/65 R15" \\
    --tire-class 1 \\
    --fuel-efficiency B \\
    --wet-grip E \\
    --rolling-noise 2 \\
    --rolling-noise-db 72 \\
    --output example.svg
''');
}

void generateLabel(List<String> args) {
  final options = <String, String>{};
  String? outputFile;
  String format = 'EC1222';

  // Parse arguments
  for (int i = 0; i < args.length; i++) {
    final arg = args[i];
    if (arg.startsWith('--')) {
      final key = arg.substring(2);
      if (i + 1 < args.length && !args[i + 1].startsWith('--')) {
        options[key] = args[i + 1];
        i++; // Skip next argument
      } else {
        options[key] = 'true';
      }
    }
  }

  // Handle special options
  outputFile = options.remove('output') ?? 'tire-label.svg';
  format = options.remove('format') ?? 'EC1222';

  // Create tire label data
  final tireData = EuTireLabel(
    title: options['title'] ?? '',
    qrcode: options['qrcode'] ?? '',
    trademark: options['trademark'] ?? '',
    tireType: options['tire-type'] ?? '',
    tireSize: options['tire-size'] ?? '',
    tireClass: parseTireClass(options['tire-class'] ?? ''),
    fuelEfficiency: parseFuelEfficiencyClass(options['fuel-efficiency'] ?? ''),
    wetGrip: parseWetGripClass(options['wet-grip'] ?? ''),
    rollingNoise: parseRollingNoiseClass(options['rolling-noise'] ?? ''),
    rollingNoiseDb: parseRollingNoiseDb(options['rolling-noise-db'] ?? ''),
    snowGrip: options['snow-grip'] == 'true',
    iceGrip: options['ice-grip'] == 'true',
  );

  // Generate label
  String svg;
  switch (format.toUpperCase()) {
    case 'EC1222':
      svg = LabelGenerator.createLabelEC1222(tireData);
      break;
    case 'EU2020':
      svg = LabelGenerator.createLabelEU2020(tireData);
      break;
    default:
      print('Unknown format: $format');
      exit(1);
  }

  // Write to file
  File(outputFile).writeAsStringSync(svg);
  print('Generated $format label: $outputFile');
}

void parseValues(List<String> args) {
  if (args.length != 2) {
    print('Usage: parse <type> <value>');
    print(
      'Types: tire-class, fuel-efficiency, wet-grip, rolling-noise, rolling-noise-db',
    );
    exit(1);
  }

  final type = args[0];
  final value = args[1];

  switch (type) {
    case 'tire-class':
      final result = parseTireClass(value);
      print('Tire class "$value" -> $result');
      break;
    case 'fuel-efficiency':
      final result = parseFuelEfficiencyClass(value);
      print('Fuel efficiency "$value" -> $result');
      break;
    case 'wet-grip':
      final result = parseWetGripClass(value);
      print('Wet grip "$value" -> $result');
      break;
    case 'rolling-noise':
      final result = parseRollingNoiseClass(value);
      print('Rolling noise "$value" -> $result');
      break;
    case 'rolling-noise-db':
      final result = parseRollingNoiseDb(value);
      print('Rolling noise dB "$value" -> $result');
      break;
    default:
      print('Unknown type: $type');
      print(
        'Types: tire-class, fuel-efficiency, wet-grip, rolling-noise, rolling-noise-db',
      );
      exit(1);
  }
}
