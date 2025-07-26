# EU Tire Label - Dart Command-Line Tool

This is a Dart port of the [EU-tire-label](https://github.com/arkadiusz-bokowy/eu-tire-label) C library. It generates EU tire labels in SVG format according to the EU regulations EC/1222/2009 and EU/2020/740.

## Features

- Generate EU tire labels in SVG format
- Support for both EC/1222/2009 and EU/2020/740 regulations
- Command-line interface for easy label generation
- Parsing utilities for tire classification data
- Type-safe enums for all tire parameters

## Installation

### Prerequisites

Make sure you have Dart SDK installed:

```bash
# Check if Dart is installed
dart --version

# If not installed, follow: https://dart.dev/get-dart
```

### Setup

1. Clone or download this project
2. Navigate to the project directory:
   ```bash
   cd eu-tire-label-dart
   ```
3. Get dependencies:
   ```bash
   dart pub get
   ```

## Usage

### Command-Line Tool

The main way to use this tool is through the command-line interface:

#### Generate a Tire Label

```bash
dart run bin/eu_tire_label.dart generate \
  --title "Example Tire" \
  --trademark "MICHELINE" \
  --tire-size "P215/65 R15" \
  --tire-type "WINTER" \
  --tire-class 1 \
  --fuel-efficiency B \
  --wet-grip E \
  --rolling-noise 2 \
  --rolling-noise-db 72 \
  --output example.svg
```

#### Generate EU/2020/740 Label with QR Code

```bash
dart run bin/eu_tire_label.dart generate \
  --qrcode "http://eprel.eu/624150" \
  --trademark "MICHELINE" \
  --tire-size "P215/65 R15" \
  --tire-type "WINTER" \
  --tire-class 1 \
  --fuel-efficiency B \
  --wet-grip E \
  --rolling-noise 2 \
  --rolling-noise-db 72 \
  --snow-grip \
  --ice-grip \
  --format EU2020 \
  --output tire-label-EU2020.svg
```

#### Available Options

```
--title <text>              Label title
--qrcode <url>              QR code URL (for EU/2020/740)
--trademark <text>          Trademark/brand
--tire-type <text>          Tire type (SUMMER/WINTER)
--tire-size <text>          Tire size designation
--tire-class <1-3>          Tire class (1=C1, 2=C2, 3=C3)
--fuel-efficiency <A-G>     Fuel efficiency class
--wet-grip <A-G>            Wet grip class
--rolling-noise <1-3>       Rolling noise class (1, 2, or 3)
--rolling-noise-db <10-120> Rolling noise in dB
--snow-grip                 Enable snow grip indicator
--ice-grip                  Enable ice grip indicator
--output <file>             Output file (default: tire-label.svg)
--format <EC1222|EU2020>    Label format (default: EC1222)
```

#### Parse Classification Values

```bash
# Parse different tire classification values
dart run bin/eu_tire_label.dart parse tire-class 1
dart run bin/eu_tire_label.dart parse fuel-efficiency B
dart run bin/eu_tire_label.dart parse wet-grip E
dart run bin/eu_tire_label.dart parse rolling-noise 2
dart run bin/eu_tire_label.dart parse rolling-noise-db 72
```

#### Show Help

```bash
dart run bin/eu_tire_label.dart help
```

### Quick Test

Run the example to generate sample labels:

```bash
dart run example/main.dart
```

This creates two SVG files:
- `tire-label-EC-1222-2009.svg`
- `tire-label-EU-2020-740.svg`

### As a Dart Library

You can also use this as a library in your Dart projects:

```dart
import 'package:eu_tire_label/eu_tire_label.dart';

void main() {
  // Create tire data
  final tireData = EuTireLabel(
    title: 'Example Tire',
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

  // Generate labels
  final ecLabel = LabelGenerator.createLabelEC1222(tireData);
  final euLabel = LabelGenerator.createLabelEU2020(tireData);
}
```

## Data Structures

### EuTireLabel

The main data structure containing all tire information:

```dart
class EuTireLabel {
  final String title;
  final String qrcode;
  final String trademark;
  final String tireType;
  final String tireSize;
  final TireClass tireClass;
  final FuelEfficiencyClass fuelEfficiency;
  final WetGripClass wetGrip;
  final RollingNoiseClass rollingNoise;
  final int rollingNoiseDb;
  final bool snowGrip;
  final bool iceGrip;
}
```

### Classification Enums

- `TireClass`: c1, c2, c3
- `FuelEfficiencyClass`: a, b, c, d, e, f, g (A-G ratings)
- `WetGripClass`: a, b, c, d, e, f, g (A-G ratings)
- `RollingNoiseClass`: rnc1, rnc2, rnc3 (1-3 noise levels)

## EU Regulations

### EC/1222/2009
The original European tire labeling regulation in force since October 2012.

### EU/2020/740
The updated regulation that supersedes EC/1222/2009, in force since May 1, 2021. This regulation adds:
- QR codes linking to EPREL database
- Snow grip and ice grip indicators
- Updated visual design

## Testing

Run the test suite:

```bash
dart test
```

## Output

The tool generates SVG files that can be:
- Viewed in web browsers
- Converted to other formats (PNG, PDF) using external tools
- Embedded in web pages or documents
- Printed for physical labels

## Dependencies

- Pure Dart implementation (no Flutter dependencies)
- `xml`: For XML/SVG manipulation
- `qr`: For QR code generation (placeholder implementation)
- `http`: For HTTP requests (if needed)

## License

This project is licensed under the MIT license, same as the original C library.

## Original Project

This is a port of [EU-tire-label](https://github.com/arkadiusz-bokowy/eu-tire-label) by Arkadiusz Bokowy. 