import 'dart:developer';

import 'package:logger/logger.dart';

class LoggerHelper {
  static final Logger _logger =
      Logger(printer: PrettyPrinter(), level: Level.debug);
  static void debug(String message) {
    _logger.d(message);
  }

  static void info(String message) {
    _logger.i(message);
  }

  static void warning(String message) {
    _logger.w(message);
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(
      message,
      error: error,
      stackTrace: stackTrace ?? StackTrace.current,
    );
  }

  static void logError(Object error, String endpoint) {
    log(
      'Error in API call to $endpoint: ${error.toString()}',
      error: error,
    );
  }
}
