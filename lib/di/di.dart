import 'dart:math';

import 'package:get_it/get_it.dart';
import 'package:helpers_vz/repositories/math_square_repository.dart';
import 'package:helpers_vz/services/crash_reporting_service.dart';
import 'package:helpers_vz/ui/math_square/bloc/math_square_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt
    ..registerLazySingleton(CrashReportingService.new)
    ..registerLazySingleton(() => MathSquareRepository(Random()))
    ..registerFactory(() => MathSquareBloc(getIt(), getIt()));
}
