class MathNotation {
  static const String minus = '−';

  const MathNotation._();

  static String number(int value) => value < 0 ? '$minus${-value}' : '$value';
}
