import 'package:get_it/get_it.dart';
import 'package:helpers_vz/services/crash_reporting_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerLazySingleton(CrashReportingService.new);
}
