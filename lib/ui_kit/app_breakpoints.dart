class AppBreakpoints {
  static const double wide = 720;

  const AppBreakpoints._();

  static bool isWide(double width) => width >= wide;
}
