import 'package:eu_tire_label/src/enums.dart';
import 'package:eu_tire_label/src/eu_tire_label.dart';
import 'package:eu_tire_label/src/templates/ec1222_template.dart';
import 'package:eu_tire_label/src/templates/eu2020_template.dart';
import 'package:qr/qr.dart';

/// Generator for EU tire labels in SVG format
class LabelGenerator {
  /// Create EC/1222/2009 label
  static String createLabelEC1222(EuTireLabel data) {
    String label = ec1222Template;

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
    label = _setRollingNoiseDisplay(label, data.rollingNoise);

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
    String label = eu2020Template;

    // Footer positioning array like in C code
    final List<List<String>> footerPositions = [
      ['0', '0', '0'], // empty
      ['22.5', '0', '0'], // rolling noise
      ['0', '30', '0'], // snow grip
      ['14', '41', '0'], // rolling noise + snow grip
      ['0', '0', '30'], // ice grip
      ['14', '0', '41'], // rolling noise + ice grip
      ['0', '20', '40'], // snow grip + ice grip
      ['4', '31', '51'], // rolling noise + snow grip + ice grip
    ];

    // Calculate positioning index
    int x = 0;
    if (data.rollingNoise != RollingNoiseClass.none ||
        data.rollingNoiseDb > 0) {
      x |= 1 << 0;
    }
    if (data.snowGrip) {
      x |= 1 << 1;
    }
    if (data.iceGrip) {
      x |= 1 << 2;
    }

    // Basic replacements
    label = label.replaceAll('[TITLE]', data.title);
    label = label.replaceAll('[TRADEMARK]', data.trademark);
    label = label.replaceAll('[TIRE-TYPE]', data.tireType);
    label = label.replaceAll('[TIRE-SIZE-DESIGNATION]', data.tireSize);
    label =
        label.replaceAll('[TIRE-CLASS]', _getTireClassString(data.tireClass));

    // QR code
    final qrCodeUrl = urlEncode(data.qrcode);
    final qrCode = _generateQRCode(data.qrcode);
    label = label.replaceAll('[QR-CODE-HREF]', qrCodeUrl);
    label = label.replaceAll('[QR-CODE]', qrCode);

    // Fuel efficiency
    final fuelDisplay =
        data.fuelEfficiency == FuelEfficiencyClass.none ? 'none' : '';
    final fuelY = _getEU2020FuelEfficiencyY(data.fuelEfficiency);
    label = label.replaceAll('[FUEL-EFFICIENCY-DISPLAY]', fuelDisplay);
    label = label.replaceAll('[FUEL-EFFICIENCY-Y]', fuelY);
    label = label.replaceAll('[FUEL-EFFICIENCY]', data.fuelEfficiency.letter);

    // Wet grip
    final wetDisplay = data.wetGrip == WetGripClass.none ? 'none' : '';
    final wetY = _getEU2020WetGripY(data.wetGrip);
    label = label.replaceAll('[WET-GRIP-DISPLAY]', wetDisplay);
    label = label.replaceAll('[WET-GRIP-Y]', wetY);
    label = label.replaceAll('[WET-GRIP]', data.wetGrip.letter);

    // Rolling noise
    final rollingNoiseDisplay = data.rollingNoiseDb > 0 ? '' : 'none';
    label = label.replaceAll('[ROLLING-NOISE-DISPLAY]', rollingNoiseDisplay);
    label = label.replaceAll('[ROLLING-NOISE-X]', footerPositions[x][0]);
    label = label.replaceAll('[ROLLING-NOISE-DB]',
        data.rollingNoiseDb > 0 ? data.rollingNoiseDb.toString() : '');

    // Rolling noise classes (A, B, C indicators)
    switch (data.rollingNoise) {
      case RollingNoiseClass.rnc1:
        label = label.replaceAll('[ROLLING-NOISE-A]', 'active');
        label = label.replaceAll('[ROLLING-NOISE-B]', '');
        label = label.replaceAll('[ROLLING-NOISE-C]', '');
        break;
      case RollingNoiseClass.rnc2:
        label = label.replaceAll('[ROLLING-NOISE-A]', '');
        label = label.replaceAll('[ROLLING-NOISE-B]', 'active');
        label = label.replaceAll('[ROLLING-NOISE-C]', '');
        break;
      case RollingNoiseClass.rnc3:
        label = label.replaceAll('[ROLLING-NOISE-A]', '');
        label = label.replaceAll('[ROLLING-NOISE-B]', '');
        label = label.replaceAll('[ROLLING-NOISE-C]', 'active');
        break;
      case RollingNoiseClass.none:
        label = label.replaceAll('[ROLLING-NOISE-A]', '');
        label = label.replaceAll('[ROLLING-NOISE-B]', '');
        label = label.replaceAll('[ROLLING-NOISE-C]', '');
        break;
    }

    // Snow grip
    final snowDisplay = data.snowGrip ? '' : 'none';
    label = label.replaceAll('[SNOW-GRIP-DISPLAY]', snowDisplay);
    label = label.replaceAll('[SNOW-GRIP-X]', footerPositions[x][1]);

    // Ice grip
    final iceDisplay = data.iceGrip ? '' : 'none';
    label = label.replaceAll('[ICE-GRIP-DISPLAY]', iceDisplay);
    label = label.replaceAll('[ICE-GRIP-X]', footerPositions[x][2]);

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
        return '0';
    }
  }

  static String _getEU2020FuelEfficiencyY(FuelEfficiencyClass efficiency) {
    switch (efficiency) {
      case FuelEfficiencyClass.a:
        return '19.25';
      case FuelEfficiencyClass.b:
        return '27.25';
      case FuelEfficiencyClass.c:
        return '35.25';
      case FuelEfficiencyClass.d:
        return '43.25';
      case FuelEfficiencyClass.e:
        return '51.25';
      case FuelEfficiencyClass.f:
        return '51.25'; // Same as E in EU/2020/740
      case FuelEfficiencyClass.g:
        return '51.25'; // Same as E in EU/2020/740
      case FuelEfficiencyClass.none:
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
        return '0';
    }
  }

  static String _getEU2020WetGripY(WetGripClass wetGrip) {
    switch (wetGrip) {
      case WetGripClass.a:
        return '19.25';
      case WetGripClass.b:
        return '27.25';
      case WetGripClass.c:
        return '35.25';
      case WetGripClass.d:
        return '43.25';
      case WetGripClass.e:
        return '51.25';
      case WetGripClass.f:
        return '51.25'; // Same as E in EU/2020/740
      case WetGripClass.g:
        return '51.25'; // Same as E in EU/2020/740
      case WetGripClass.none:
        return '0';
    }
  }

  static String _setRollingNoiseDisplay(String label, RollingNoiseClass noise) {
    // White overlays hide black waves. display="none" shows the black wave.
    // rnc1 = 1 wave (quietest), rnc2 = 2 waves, rnc3 = 3 waves (loudest)
    switch (noise) {
      case RollingNoiseClass.rnc1:
        // Show 1 wave: hide waves 2,3
        label = label.replaceAll('[ROLLING-NOISE-1-DISPLAY]', 'none');
        label = label.replaceAll('[ROLLING-NOISE-2-DISPLAY]', '');
        label = label.replaceAll('[ROLLING-NOISE-3-DISPLAY]', '');
        break;
      case RollingNoiseClass.rnc2:
        // Show 2 waves: hide wave 3
        label = label.replaceAll('[ROLLING-NOISE-1-DISPLAY]', 'none');
        label = label.replaceAll('[ROLLING-NOISE-2-DISPLAY]', 'none');
        label = label.replaceAll('[ROLLING-NOISE-3-DISPLAY]', '');
        break;
      case RollingNoiseClass.rnc3:
        // Show 3 waves: hide nothing
        label = label.replaceAll('[ROLLING-NOISE-1-DISPLAY]', 'none');
        label = label.replaceAll('[ROLLING-NOISE-2-DISPLAY]', 'none');
        label = label.replaceAll('[ROLLING-NOISE-3-DISPLAY]', 'none');
        break;
      case RollingNoiseClass.none:
        // Show all waves visible (white overlays shown)
        label = label.replaceAll('[ROLLING-NOISE-1-DISPLAY]', '');
        label = label.replaceAll('[ROLLING-NOISE-2-DISPLAY]', '');
        label = label.replaceAll('[ROLLING-NOISE-3-DISPLAY]', '');
        break;
    }
    return label;
  }

  static String _generateQRCode(String data) {
    if (data.isEmpty) {
      return '';
    }

    try {
      // Create QR code using the qr package (similar to C implementation)
      final qrCode = QrCode(
          4,
          QrErrorCorrectLevel
              .L); // Version 4, Low error correction (like ECC_LOW in C)
      qrCode.addData(data);

      final qrImage = QrImage(qrCode);
      final size = qrImage.moduleCount;

      // Build SVG path similar to C implementation
      final pathData = StringBuffer();

      for (int x = 0; x < size; x++) {
        int start = 0;
        int length = 0;

        for (int y = 0; y < size; y++) {
          bool isDark = qrImage.isDark(y, x);

          if (isDark && length == 0) {
            start = y;
          }
          if (isDark) {
            length++;
          }
          if (length != 0 && (!isDark || y + 1 == size)) {
            pathData.write('M$x,${start}h1v${length}h-1z');
            length = 0;
          }
        }
      }

      return '<path d="${pathData.toString()}"/>';
    } catch (e) {
      // If QR generation fails, throw the error to fail fast
      throw Exception('Failed to generate QR code: $e');
    }
  }

  /// URL encode helper function
  static String urlEncode(String str) {
    return Uri.encodeComponent(str);
  }
}
