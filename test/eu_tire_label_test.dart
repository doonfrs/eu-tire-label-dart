import 'package:test/test.dart';
import 'package:eu_tire_label/eu_tire_label.dart';

void main() {
  group('EU Tire Label Tests', () {
    test('should create EuTireLabel with default values', () {
      final label = EuTireLabel();

      expect(label.title, equals(''));
      expect(label.qrcode, equals(''));
      expect(label.trademark, equals(''));
      expect(label.tireType, equals(''));
      expect(label.tireSize, equals(''));
      expect(label.tireClass, equals(TireClass.error));
      expect(label.fuelEfficiency, equals(FuelEfficiencyClass.none));
      expect(label.wetGrip, equals(WetGripClass.none));
      expect(label.rollingNoise, equals(RollingNoiseClass.none));
      expect(label.rollingNoiseDb, equals(0));
      expect(label.snowGrip, equals(false));
      expect(label.iceGrip, equals(false));
    });

    test('should create EuTireLabel with custom values', () {
      final label = EuTireLabel(
        title: 'Test Tire',
        qrcode: 'http://example.com',
        trademark: 'BRAND',
        tireType: 'SUMMER',
        tireSize: '205/55 R16',
        tireClass: TireClass.c1,
        fuelEfficiency: FuelEfficiencyClass.a,
        wetGrip: WetGripClass.b,
        rollingNoise: RollingNoiseClass.rnc1,
        rollingNoiseDb: 70,
        snowGrip: true,
        iceGrip: false,
      );

      expect(label.title, equals('Test Tire'));
      expect(label.qrcode, equals('http://example.com'));
      expect(label.trademark, equals('BRAND'));
      expect(label.tireType, equals('SUMMER'));
      expect(label.tireSize, equals('205/55 R16'));
      expect(label.tireClass, equals(TireClass.c1));
      expect(label.fuelEfficiency, equals(FuelEfficiencyClass.a));
      expect(label.wetGrip, equals(WetGripClass.b));
      expect(label.rollingNoise, equals(RollingNoiseClass.rnc1));
      expect(label.rollingNoiseDb, equals(70));
      expect(label.snowGrip, equals(true));
      expect(label.iceGrip, equals(false));
    });

    test('should parse tire class correctly', () {
      expect(parseTireClass('1'), equals(TireClass.c1));
      expect(parseTireClass('2'), equals(TireClass.c2));
      expect(parseTireClass('3'), equals(TireClass.c3));
      expect(parseTireClass('0'), equals(TireClass.error));
      expect(parseTireClass('invalid'), equals(TireClass.error));
    });

    test('should parse fuel efficiency class correctly', () {
      expect(parseFuelEfficiencyClass('1'), equals(FuelEfficiencyClass.a));
      expect(parseFuelEfficiencyClass('A'), equals(FuelEfficiencyClass.a));
      expect(parseFuelEfficiencyClass('a'), equals(FuelEfficiencyClass.a));
      expect(parseFuelEfficiencyClass('B'), equals(FuelEfficiencyClass.b));
      expect(parseFuelEfficiencyClass('G'), equals(FuelEfficiencyClass.g));
      expect(
        parseFuelEfficiencyClass('invalid'),
        equals(FuelEfficiencyClass.none),
      );
    });

    test('should parse wet grip class correctly', () {
      expect(parseWetGripClass('1'), equals(WetGripClass.a));
      expect(parseWetGripClass('A'), equals(WetGripClass.a));
      expect(parseWetGripClass('a'), equals(WetGripClass.a));
      expect(parseWetGripClass('B'), equals(WetGripClass.b));
      expect(parseWetGripClass('G'), equals(WetGripClass.g));
      expect(parseWetGripClass('invalid'), equals(WetGripClass.none));
    });

    test('should parse rolling noise class correctly', () {
      expect(parseRollingNoiseClass('1'), equals(RollingNoiseClass.rnc1));
      expect(parseRollingNoiseClass('A'), equals(RollingNoiseClass.rnc1));
      expect(parseRollingNoiseClass('a'), equals(RollingNoiseClass.rnc1));
      expect(parseRollingNoiseClass('2'), equals(RollingNoiseClass.rnc2));
      expect(parseRollingNoiseClass('B'), equals(RollingNoiseClass.rnc2));
      expect(parseRollingNoiseClass('3'), equals(RollingNoiseClass.rnc3));
      expect(parseRollingNoiseClass('C'), equals(RollingNoiseClass.rnc3));
      expect(parseRollingNoiseClass('invalid'), equals(RollingNoiseClass.none));
    });

    test('should parse rolling noise dB correctly', () {
      expect(parseRollingNoiseDb('70'), equals(70));
      expect(parseRollingNoiseDb('72'), equals(72));
      expect(parseRollingNoiseDb('10'), equals(10));
      expect(parseRollingNoiseDb('120'), equals(120));
      expect(parseRollingNoiseDb('9'), equals(0)); // Below minimum
      expect(parseRollingNoiseDb('121'), equals(0)); // Above maximum
      expect(parseRollingNoiseDb('invalid'), equals(0));
    });

    test('should generate EC/1222/2009 label', () {
      final label = EuTireLabel(
        title: 'Test Tire',
        tireClass: TireClass.c1,
        fuelEfficiency: FuelEfficiencyClass.a,
        wetGrip: WetGripClass.b,
        rollingNoise: RollingNoiseClass.rnc1,
        rollingNoiseDb: 70,
      );

      final svg = LabelGenerator.createLabelEC1222(label);

      expect(svg, contains('<svg'));
      expect(svg, contains('Test Tire'));
      expect(svg, contains('C1'));
      expect(svg, contains('A'));
      expect(svg, contains('B'));
      expect(svg, contains('70'));
    });

    test('should generate EU/2020/740 label', () {
      final label = EuTireLabel(
        title: 'Test Tire',
        qrcode: 'http://example.com',
        trademark: 'BRAND',
        tireType: 'SUMMER',
        tireSize: '205/55 R16',
        tireClass: TireClass.c1,
        fuelEfficiency: FuelEfficiencyClass.a,
        wetGrip: WetGripClass.b,
        rollingNoise: RollingNoiseClass.rnc1,
        rollingNoiseDb: 70,
        snowGrip: true,
        iceGrip: false,
      );

      final svg = LabelGenerator.createLabelEU2020(label);

      expect(svg, contains('<svg'));
      expect(svg, contains('Test Tire'));
      expect(svg, contains('BRAND'));
      expect(svg, contains('SUMMER'));
      expect(svg, contains('205/55 R16'));
      expect(svg, contains('C1'));
    });

    test('should URL encode correctly', () {
      expect(urlEncode('http://example.com'), contains('%3A'));
      expect(urlEncode('test"quote'), contains('%22'));
      expect(urlEncode('test%percent'), contains('%25'));
    });

    test('should check for CDATA markers', () {
      expect(sanitizePlainText('normal text'), equals(false));
      expect(sanitizePlainText('text]]>more'), equals(true));
    });
  });
}
