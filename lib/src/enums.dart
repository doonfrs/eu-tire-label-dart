/// Tire class enumeration
enum TireClass {
  error(0),
  c1(1),
  c2(2),
  c3(3);

  const TireClass(this.value);
  final int value;

  static TireClass fromValue(int value) {
    return TireClass.values.firstWhere(
      (e) => e.value == value,
      orElse: () => TireClass.error,
    );
  }
}

/// Fuel efficiency class enumeration
enum FuelEfficiencyClass {
  none(0),
  a(1),
  b(2),
  c(3),
  d(4),
  e(5),
  f(6),
  g(7);

  const FuelEfficiencyClass(this.value);
  final int value;

  static FuelEfficiencyClass fromValue(int value) {
    return FuelEfficiencyClass.values.firstWhere(
      (e) => e.value == value,
      orElse: () => FuelEfficiencyClass.none,
    );
  }

  String get letter {
    if (this == FuelEfficiencyClass.none) return '';
    return name.toUpperCase();
  }
}

/// Wet grip class enumeration
enum WetGripClass {
  none(0),
  a(1),
  b(2),
  c(3),
  d(4),
  e(5),
  f(6),
  g(7);

  const WetGripClass(this.value);
  final int value;

  static WetGripClass fromValue(int value) {
    return WetGripClass.values.firstWhere(
      (e) => e.value == value,
      orElse: () => WetGripClass.none,
    );
  }

  String get letter {
    if (this == WetGripClass.none) return '';
    return name.toUpperCase();
  }
}

/// Rolling noise class enumeration
enum RollingNoiseClass {
  none(0),
  rnc1(1),
  rnc2(2),
  rnc3(3);

  const RollingNoiseClass(this.value);
  final int value;

  static RollingNoiseClass fromValue(int value) {
    return RollingNoiseClass.values.firstWhere(
      (e) => e.value == value,
      orElse: () => RollingNoiseClass.none,
    );
  }
}
