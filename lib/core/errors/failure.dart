import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with API server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with API server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with API server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate with API server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response!.statusCode ?? 0,
          e.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request to API server was cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection');
      case DioExceptionType.unknown:
        return ServerFailure('Opps there was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure(
        'Your request was not found, please try again later',
      );
    } else if (statusCode >= 500) {
      return ServerFailure(
        'There is a problem with the server, please try again later',
      );
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(_extractAspNetError(response));
    } else {
      return ServerFailure('There was an error, please try again later');
    }
  }

  //* Specific for ASP.NET Core Web API
  static String _extractAspNetError(dynamic response) {
    if (response == null) {
      return 'Bad request occurred';
    }

    if (response is String) {
      return response;
    }

    if (response is Map<String, dynamic>) {
      if (response.containsKey('errors') && response['errors'] is Map) {
        final errors = response['errors'] as Map<String, dynamic>;
        if (errors.isNotEmpty) {
          final firstFieldErrors = errors.values.first;
          if (firstFieldErrors is List && firstFieldErrors.isNotEmpty) {
            return firstFieldErrors.first.toString();
          }
        }
      }

      return response['title'] ??
          response['message'] ??
          response['detail'] ??
          'Bad request occurred';
    }

    return 'Bad request occurred';
  }
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}

class FirebaseFailure extends Failure {
  FirebaseFailure(super.message);

  factory FirebaseFailure.fromFirebase(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return FirebaseFailure('Email already in use');
      case 'invalid-email':
        return FirebaseFailure('Invalid email');
      case 'weak-password':
        return FirebaseFailure('Weak password');
      case 'wrong-password':
        return FirebaseFailure('Wrong password');
      case 'user-disabled':
        return FirebaseFailure('User disabled');
      case 'user-not-found':
        return FirebaseFailure('User not found');
    }
    return FirebaseFailure('Something went wrong');
  }
}
