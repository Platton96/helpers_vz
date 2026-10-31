import 'package:flutter/foundation.dart';

class CrashReportingService {
  const CrashReportingService();

  void recordFlutterFatalError(FlutterErrorDetails details) => FlutterError.presentError(details);

  void recordFatalError(Object error, StackTrace stackTrace) => debugPrint('$error\n$stackTrace');

  void recordError(Object error, StackTrace stackTrace) => debugPrint('$error\n$stackTrace');
}
