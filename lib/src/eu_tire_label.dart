import 'enums.dart';

/// Main data structure for EU tire label information
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

  const EuTireLabel({
    this.title = '',
    this.qrcode = '',
    this.trademark = '',
    this.tireType = '',
    this.tireSize = '',
    this.tireClass = TireClass.error,
    this.fuelEfficiency = FuelEfficiencyClass.none,
    this.wetGrip = WetGripClass.none,
    this.rollingNoise = RollingNoiseClass.none,
    this.rollingNoiseDb = 0,
    this.snowGrip = false,
    this.iceGrip = false,
  });

  /// Create a copy of this object with the given fields replaced
  EuTireLabel copyWith({
    String? title,
    String? qrcode,
    String? trademark,
    String? tireType,
    String? tireSize,
    TireClass? tireClass,
    FuelEfficiencyClass? fuelEfficiency,
    WetGripClass? wetGrip,
    RollingNoiseClass? rollingNoise,
    int? rollingNoiseDb,
    bool? snowGrip,
    bool? iceGrip,
  }) {
    return EuTireLabel(
      title: title ?? this.title,
      qrcode: qrcode ?? this.qrcode,
      trademark: trademark ?? this.trademark,
      tireType: tireType ?? this.tireType,
      tireSize: tireSize ?? this.tireSize,
      tireClass: tireClass ?? this.tireClass,
      fuelEfficiency: fuelEfficiency ?? this.fuelEfficiency,
      wetGrip: wetGrip ?? this.wetGrip,
      rollingNoise: rollingNoise ?? this.rollingNoise,
      rollingNoiseDb: rollingNoiseDb ?? this.rollingNoiseDb,
      snowGrip: snowGrip ?? this.snowGrip,
      iceGrip: iceGrip ?? this.iceGrip,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EuTireLabel &&
        other.title == title &&
        other.qrcode == qrcode &&
        other.trademark == trademark &&
        other.tireType == tireType &&
        other.tireSize == tireSize &&
        other.tireClass == tireClass &&
        other.fuelEfficiency == fuelEfficiency &&
        other.wetGrip == wetGrip &&
        other.rollingNoise == rollingNoise &&
        other.rollingNoiseDb == rollingNoiseDb &&
        other.snowGrip == snowGrip &&
        other.iceGrip == iceGrip;
  }

  @override
  int get hashCode {
    return Object.hash(
      title,
      qrcode,
      trademark,
      tireType,
      tireSize,
      tireClass,
      fuelEfficiency,
      wetGrip,
      rollingNoise,
      rollingNoiseDb,
      snowGrip,
      iceGrip,
    );
  }

  @override
  String toString() {
    return 'EuTireLabel(title: $title, qrcode: $qrcode, trademark: $trademark, '
        'tireType: $tireType, tireSize: $tireSize, tireClass: $tireClass, '
        'fuelEfficiency: $fuelEfficiency, wetGrip: $wetGrip, '
        'rollingNoise: $rollingNoise, rollingNoiseDb: $rollingNoiseDb, '
        'snowGrip: $snowGrip, iceGrip: $iceGrip)';
  }
}
