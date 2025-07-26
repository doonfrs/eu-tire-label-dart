import 'dart:convert';
import 'dart:typed_data';
import 'enums.dart';
import 'eu_tire_label.dart';
import 'parsers.dart';
import 'package:xml/xml.dart';

/// Generator for EU tire labels in SVG format
class LabelGenerator {
  static const String _ec1222Template = '''
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 75 110">
	<title><![CDATA[[TITLE]]]></title>
	<style>
		text { font-family: Helvetica, Arial, sans-serif; }
	</style>
	<rect x="0" y="0" width="75" height="110" fill="white" stroke="#0091d2" stroke-width="0.35" />
	<g transform="translate(5,5)" fill="#0091d2">
		<path d="m 20.553125,8.0340853 c -0.354303,0.086553 -0.690914,0.2650662 -1.0125,0.534375 -1.984915,1.6660527 -2.931373,6.1359097 -2.109375,9.9843747 0.498181,2.333883 1.381004,3.952986 2.390625,4.44375 0.03086,0.0052 0.05266,3.71e-4 0.05625,0 0.963644,0.01558 2.463044,-0.01448 3.31875,-0.253125 0.334598,-0.09323 0.60075,-0.312558 0.759375,-0.478125 1.185417,-1.284247 1.827288,-4.316819 1.715625,-7.36875 l -1.29375,0 c 0.08619,2.311308 -0.268155,4.623379 -0.928125,5.596875 -0.807622,1.190373 -1.750486,-0.06822 -2.109375,-2.8125 -0.360251,-2.745636 0.0084,-5.953252 0.815625,-7.14375 C 22.435209,10.124983 22.717763,10.037103 23,10.171585 l 0,-1.7999997 -1.771875,-0.253125 c 0,0 0.07095,-0.056304 0.28125,-0.084375 l -0.95625,0 z"/>
		<g stroke="black" stroke-width="0.18" stroke-dasharray="0.75 0.75">
			<line x1="6.5" y1="29.375" x2="36" y2="29.375" />
			<line x1="6.5" y1="34.875" x2="36" y2="34.875" />
			<line x1="6.5" y1="40.375" x2="36" y2="40.375" />
			<line x1="6.5" y1="45.875" x2="36" y2="45.875" />
			<line x1="6.5" y1="51.375" x2="36" y2="51.375" />
			<line x1="6.5" y1="56.875" x2="36" y2="56.875" />
			<line x1="6.5" y1="62.375" x2="36" y2="62.375" />
		</g>
		<g stroke="black" stroke-width="0.18">
			<path d="m 0.1 27.0 h 4.75 l 2.375,2.375 l -2.375,2.375 h -4.75 z" fill="#009036" />
			<path d="m 0.1 32.5 h 7.125 l 2.375,2.375 l -2.375,2.375 h -7.125 z" fill="#57ab27" />
			<path d="m 0.1 38.0 h 9.5 l 2.375,2.375 l -2.375,2.375 h -9.5 z" fill="#c9d200" />
			<path d="m 0.1 43.5 h 11.875 l 2.375,2.375 l -2.375,2.375 h -11.875 z" fill="#ffed00" />
			<path d="m 0.1 49.0 h 14.25 l 2.375,2.375 l -2.375,2.375 h -14.25 z" fill="#fabb00" />
			<path d="m 0.1 54.5 h 16.625 l 2.375,2.375 l -2.375,2.375 h -16.625 z" fill="#eb690b" />
			<path d="m 0.1 60.0 h 19.0 l 2.375,2.375 l -2.375,2.375 h -19.0 z" fill="#e2001a" />
			<g fill="white" font-size="4.5" font-weight="bold">
				<text x="1.250" y="31.0">A</text>
				<text x="3.625" y="36.5">B</text>
				<text x="6.000" y="42.0">C</text>
				<text x="8.375" y="47.5">D</text>
				<text x="10.750" y="53.0">E</text>
				<text x="13.125" y="58.5">F</text>
				<text x="15.500" y="64.0">G</text>
			</g>
		</g>
		<g display="[FUEL-EFFICIENCY-DISPLAY]" transform="translate(36,[FUEL-EFFICIENCY-Y])" fill="black">
			<path d="m 0 0 v 10 h -11 l -5 -5 l 5 -5 z"/>
			<text x="-9" y="8.5" font-size="10" fill="white" font-weight="bold">[FUEL-EFFICIENCY]</text>
		</g>
		<path d="m 14,0 c -2.209139,0 -4,1.7908612 -4,4 l 0,17.75 -10,0 L 0,70 36,70 36,4 C 36,1.790861 34.209139,0 32,0 L 14,0 z m 0,1.25 18,0 c 1.518783,0 2.75,1.231217 2.75,2.75 l 0,19 0.90625,0 0,45.75 -35.3125,0 0,-45.75 10.90625,0 0,-19 c 0,-1.518783 1.231217,-2.75 2.75,-2.75 z" />
	</g>
	<g transform="translate(43.5,5)" fill="#0091d2">
		<g stroke="black" stroke-width="0.18" stroke-dasharray="0.75 0.75">
			<line x1="6.5" y1="29.375" x2="26" y2="29.375" />
			<line x1="6.5" y1="34.875" x2="26" y2="34.875" />
			<line x1="6.5" y1="40.375" x2="26" y2="40.375" />
			<line x1="6.5" y1="45.875" x2="26" y2="45.875" />
			<line x1="6.5" y1="51.375" x2="26" y2="51.375" />
			<line x1="6.5" y1="56.875" x2="26" y2="56.875" />
			<line x1="6.5" y1="62.375" x2="26" y2="62.375" />
			<g fill="black" stroke="none" font-size="4.5" font-weight="bold">
				<text x="1.5" y="31.0">A</text>
				<text x="1.5" y="36.5">B</text>
				<text x="1.5" y="42.0">C</text>
				<text x="1.5" y="47.5">D</text>
				<text x="1.5" y="53.0">E</text>
				<text x="1.5" y="58.5">F</text>
				<text x="1.5" y="64.0">G</text>
			</g>
		</g>
		<g display="[WET-GRIP-DISPLAY]" transform="translate(26,[WET-GRIP-Y])" fill="black">
			<path d="m 0 0 v 10 h -11 l -5 -5 l 5 -5 z"/>
			<text x="-9" y="8.5" font-size="10" fill="white" font-weight="bold">[WET-GRIP]</text>
		</g>
		<path d="m 4,0 c -2.209139,0 -4,1.790861 -4,4 l 0,66 26,0 0,-66 c 0,-2.209139 -1.790861,-4 -4,-4 l -18,0 z m 0,1.25 18,0 c 1.518783,0 2.75,1.231217 2.75,2.75 l 0,19 0.90625,0 0,45.75 -25.3125,0 0,-45.75 0.90625,0 0,-19 c 0,-1.5187832 1.231217,-2.75 2.75,-2.75 z" />
	</g>
	<g transform="translate(15,77.25)" fill="#0091d2">
		<g fill="none" stroke="black" stroke-linecap="round">
			<path stroke-width="2" d="m 24.604083,4.701693 c 1.366132,1.9563212 2.19301,4.5156352 2.19301,7.315105 0,2.783602 -0.817545,5.328906 -2.169008,7.281509 M 22.19905,6.7142867 c 1.047835,1.3791998 1.690831,3.2435126 1.690831,5.2961103 0,2.032863 -0.63086,3.881442 -1.661627,5.257178 M 19.881628,8.7098122 c 0.73127,0.8054109 1.192649,1.9840578 1.192649,3.2975178 0,1.286792 -0.44271,2.44437 -1.147845,3.24778" />
			<g stroke="white" stroke-width="1.5">
				<path display="[ROLLING-NOISE-1-DISPLAY]" d="m 19.881628,8.727352 c 0.73127,0.805411 1.192649,1.984058 1.192649,3.297518 0,1.286789 -0.44271,2.444366 -1.147845,3.247778" />
				<path display="[ROLLING-NOISE-2-DISPLAY]" d="m 22.19905,6.7233568 c 1.047835,1.3791998 1.690831,3.2435126 1.690831,5.2961102 0,2.032859 -0.63086,3.88144 -1.661627,5.257176" />
				<path display="[ROLLING-NOISE-3-DISPLAY]" d="m 24.604083,4.7016939 c 1.366132,1.9563212 2.19301,4.5156352 2.19301,7.3151061 0,2.783598 -0.817545,5.328903 -2.169008,7.281506" />
			</g>
		</g>
		<g display="[ROLLING-NOISE-DB-DISPLAY]" transform="translate(54.5,7)" fill="black">
			<path d="m 0 0 v 10 h -20.25 l -5 -5 l 5 -5 z" />
			<text x="-3" y="8" text-anchor="end" fill="white" font-size="5" font-weight="bold"><tspan font-size="8">[ROLLING-NOISE-DB]</tspan> dB</text>
		</g>
		<path d="m 4,0 c -2.209139,0 -4,1.790861 -4,4 l 0,16 c 0,2.209139 1.790861,4 4,4 l 50.5,0 0,-24 -28.5,0 -22,0 z m 22,0.34375 27.25,0 0,23.3125 -27.25,0 L 26,22.75 4,22.75 c -1.518783,0 -2.75,-1.231217 -2.75,-2.75 l 0,-16 c 0,-1.518783 1.231217,-2.75 2.75,-2.75 l 22,0 0,-0.90625 z" />
	</g>
	<g transform="translate(5,100)">
		<text x="11" y="6" fill="black" font-size="3">1222/2009 - <tspan font-weight="bold">[TIRE-CLASS]</tspan></text>
	</g>
</svg>''';

  /// Create EC/1222/2009 label
  static String createLabelEC1222(EuTireLabel data) {
    String label = _ec1222Template;

    // Replace placeholders
    label = label.replaceAll('[TITLE]', data.title);
    label =
        label.replaceAll('[TIRE-CLASS]', _getTireClassString(data.tireClass));

    // Fuel efficiency
    final fuelDisplay =
        data.fuelEfficiency == FuelEfficiencyClass.none ? 'none' : '';
    final fuelY = _getFuelEfficiencyY(data.fuelEfficiency);
    label = label.replaceAll('[FUEL-EFFICIENCY-DISPLAY]', fuelDisplay);
    label = label.replaceAll('[FUEL-EFFICIENCY-Y]', fuelY);
    label = label.replaceAll('[FUEL-EFFICIENCY]', data.fuelEfficiency.letter);

    // Wet grip
    final wetDisplay = data.wetGrip == WetGripClass.none ? 'none' : '';
    final wetY = _getWetGripY(data.wetGrip);
    label = label.replaceAll('[WET-GRIP-DISPLAY]', wetDisplay);
    label = label.replaceAll('[WET-GRIP-Y]', wetY);
    label = label.replaceAll('[WET-GRIP]', data.wetGrip.letter);

    // Rolling noise
    _setRollingNoiseDisplay(label, data.rollingNoise);

    // Rolling noise dB
    final noiseDb =
        data.rollingNoiseDb > 0 ? data.rollingNoiseDb.toString() : '';
    final noiseDbDisplay = data.rollingNoiseDb > 0 ? '' : 'none';
    label = label.replaceAll('[ROLLING-NOISE-DB-DISPLAY]', noiseDbDisplay);
    label = label.replaceAll('[ROLLING-NOISE-DB]', noiseDb);

    return label;
  }

  /// Create EU/2020/740 label
  static String createLabelEU2020(EuTireLabel data) {
    // This is a simplified version - you would need the full template
    String label = _ec1222Template; // Using EC template as placeholder

    // Add QR code generation
    final qrCode = _generateQRCode(data.qrcode);
    label = label.replaceAll('[QR-CODE]', qrCode);
    label = label.replaceAll('[QR-CODE-HREF]', urlEncode(data.qrcode));

    // Add other fields
    label = label.replaceAll('[TRADEMARK]', data.trademark);
    label = label.replaceAll('[TIRE-TYPE]', data.tireType);
    label = label.replaceAll('[TIRE-SIZE-DESIGNATION]', data.tireSize);
    label =
        label.replaceAll('[TIRE-CLASS]', _getTireClassString(data.tireClass));

    return label;
  }

  static String _getTireClassString(TireClass tireClass) {
    switch (tireClass) {
      case TireClass.c1:
        return 'C1';
      case TireClass.c2:
        return 'C2';
      case TireClass.c3:
        return 'C3';
      case TireClass.error:
      default:
        return '';
    }
  }

  static String _getFuelEfficiencyY(FuelEfficiencyClass efficiency) {
    switch (efficiency) {
      case FuelEfficiencyClass.a:
        return '24.375';
      case FuelEfficiencyClass.b:
        return '29.875';
      case FuelEfficiencyClass.c:
        return '35.375';
      case FuelEfficiencyClass.d:
        return '40.875';
      case FuelEfficiencyClass.e:
        return '46.375';
      case FuelEfficiencyClass.f:
        return '51.875';
      case FuelEfficiencyClass.g:
        return '58.375';
      case FuelEfficiencyClass.none:
      default:
        return '0';
    }
  }

  static String _getWetGripY(WetGripClass wetGrip) {
    switch (wetGrip) {
      case WetGripClass.a:
        return '24.375';
      case WetGripClass.b:
        return '29.875';
      case WetGripClass.c:
        return '35.375';
      case WetGripClass.d:
        return '40.875';
      case WetGripClass.e:
        return '46.375';
      case WetGripClass.f:
        return '51.875';
      case WetGripClass.g:
        return '58.375';
      case WetGripClass.none:
      default:
        return '0';
    }
  }

  static void _setRollingNoiseDisplay(String label, RollingNoiseClass noise) {
    switch (noise) {
      case RollingNoiseClass.rnc3:
        label = label.replaceAll('[ROLLING-NOISE-3-DISPLAY]', 'none');
      // fall through
      case RollingNoiseClass.rnc2:
        label = label.replaceAll('[ROLLING-NOISE-2-DISPLAY]', 'none');
      // fall through
      case RollingNoiseClass.rnc1:
        label = label.replaceAll('[ROLLING-NOISE-1-DISPLAY]', 'none');
      // fall through
      case RollingNoiseClass.none:
      default:
        label = label.replaceAll('[ROLLING-NOISE-1-DISPLAY]', '');
        label = label.replaceAll('[ROLLING-NOISE-2-DISPLAY]', '');
        label = label.replaceAll('[ROLLING-NOISE-3-DISPLAY]', '');
    }
  }

  static String _generateQRCode(String data) {
    if (data.isEmpty) {
      return '';
    }

    // For now, return a simple placeholder QR code
    // TODO: Implement proper QR code generation using the qr package
    return '''
      <rect x="1" y="1" width="27" height="27" fill="black"/>
      <rect x="2" y="2" width="25" height="25" fill="white"/>
      <text x="14" y="16" text-anchor="middle" font-size="8" fill="black">QR</text>
    ''';
  }
}
