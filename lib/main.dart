import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:helpers_vz/app.dart';
import 'package:helpers_vz/di/di.dart';
import 'package:helpers_vz/services/crash_reporting_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  final crashReportingService = getIt<CrashReportingService>();
  FlutterError.onError = crashReportingService.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stackTrace) {
    crashReportingService.recordFatalError(error, stackTrace);

    return true;
  };
  runApp(const HelpersApp());
}
