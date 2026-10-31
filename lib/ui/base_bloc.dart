import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers_vz/services/crash_reporting_service.dart';

abstract class BaseBloc<Event, State> extends Bloc<Event, State> {
  final CrashReportingService _crashReportingService;

  BaseBloc(CrashReportingService crashReportingService, super.initialState)
      : _crashReportingService = crashReportingService;

  @override
  void add(Event event) {
    if (!isClosed) {
      super.add(event);
    }
  }

  @override
  void on<E extends Event>(EventHandler<E, State> handler, {EventTransformer<E>? transformer}) =>
      super.on<E>((event, emit) => _runGuarded(handler, event, emit), transformer: transformer);

  @protected
  void handleException(Event event, Emitter<State> emit, Object error) {}

  @protected
  void runUnawaited(Future<void> future) =>
      unawaited(future.catchError(_crashReportingService.recordError));

  Future<void> _runGuarded<E extends Event>(
    EventHandler<E, State> handler,
    E event,
    Emitter<State> emit,
  ) async {
    try {
      await handler(event, emit);
    } on Object catch (error, stackTrace) {
      _crashReportingService.recordError(error, stackTrace);

      if (!emit.isDone) {
        handleException(event, emit, error);
      }
    }
  }
}
