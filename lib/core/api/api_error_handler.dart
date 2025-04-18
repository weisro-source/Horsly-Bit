import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:horsly_bit/core/utils/logger.dart';

abstract class Failure {
  final String errorMessage;
  final int statusCode;

  const Failure(this.errorMessage, this.statusCode);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage, super.statusCode);

  static const int defaultCode = 500;
  static const int networkCode = 606;

  factory ServerFailure.fromDioError(DioException dioException) {
    final int status = dioException.response?.statusCode ?? defaultCode;
    debugPrint('Status code: $status');

    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with server', status);
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with server', status);
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with server', status);
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate from server', status);
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(status, dioException.response?.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request was cancelled', status);
      case DioExceptionType.connectionError:
        if (dioException.error is SocketException) {
          return ServerFailure(
              'Network error: Check your internet connection', networkCode);
        }
        return ServerFailure('Connection error with server', status);
      case DioExceptionType.unknown:
      default:
        return ServerFailure(
            'Unexpected error occurred. Please try again.', status);
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    LoggerHelper.info('Parsing error from response: Status code $statusCode');

    bool isHtmlContent(String res) =>
        res.startsWith('<!DOCTYPE html>') || res.startsWith('<html>');

    // Handle HTML response
    if (response is String && isHtmlContent(response)) {
      final document = html_parser.parse(response);
      final parsedError =
          document.body?.text.trim() ?? 'Unable to parse HTML error';
      LoggerHelper.error('Parsed HTML error: $parsedError');
      return ServerFailure(parsedError, statusCode);
    }

    String error = "An unknown error occurred";

    // Handle Map response
    if (response is Map) {
      final message = response['message'];
      final errorField = response['error'];

      if (statusCode == 409 && errorField == 'MongoServerError') {
        error = response['message'] ?? error;
      } else if (message is List) {
        error = message.join(', ');
      } else if (message is String) {
        error = message;
      } else if (errorField is String) {
        error = errorField;
      }
    }

    // Handle List response
    if (response is List) {
      error = response.map((e) => e.toString()).join(', ');
    }

    LoggerHelper.error("Extracted error: $error");

    // Return based on status code
    switch (statusCode) {
      case 400:
        return ServerFailure("Bad Request: $error", statusCode);
      case 401:
      case 403:
      case 422:
        return ServerFailure(error, statusCode);
      case 404:
        return ServerFailure("Not Found: $error", statusCode);
      case 409:
        return ServerFailure(error, statusCode);
      case 500:
        return ServerFailure("Internal Server Error: $error", statusCode);
      default:
        return ServerFailure('Unexpected Error: $error', statusCode);
    }
  }
}

class ErrorHandler {
  static Failure handleError(dynamic error) {
    LoggerHelper.error('⚠️ Handling error: $error');

    if (error is DioException) {
      LoggerHelper.error('DioException caught: ${error.message}');
      return ServerFailure.fromDioError(error);
    } else if (error is SocketException) {
      LoggerHelper.error('SocketException caught: ${error.message}');
      return ServerFailure(
        'Network error: Please check your internet connection!',
        ServerFailure.networkCode,
      );
    } else if (error == 409) {
      return ServerFailure("Conflict error. Try again.", 409);
    }

    return ServerFailure(error.toString(), ServerFailure.defaultCode);
  }
}
