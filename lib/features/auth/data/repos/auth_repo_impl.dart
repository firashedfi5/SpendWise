import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spendwise/core/errors/failure.dart';
import 'package:spendwise/core/utils/api_service.dart';
import 'package:spendwise/core/utils/auth_service.dart';
import 'package:spendwise/features/auth/data/models/user_model.dart';
import 'package:spendwise/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;
  final AuthService authService;

  AuthRepoImpl(this.apiService, this.authService);

  //* Sign up
  @override
  Future<Either<Failure, User>> signup({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await authService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(userCredential.user!);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebase(e));
      }
      return left(FirebaseFailure('An unexpected error occurred'));
    }
  }

  //* Log in
  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(userCredential.user!);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebase(e));
      }
      return left(FirebaseFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, User>> loginWithGoogle() async {
    try {
      final userCredential = await authService.loginWithGoogle();
      return right(userCredential.user!);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebase(e));
      }
      return left(FirebaseFailure('An unexpected error occurred'));
    }
  }

  //* Log out
  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await authService.logout();
      return right(unit);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebase(e));
      }
      return left(FirebaseFailure('An unexpected error occurred'));
    }
  }

  //* Store user info in SQL Server
  //* POST /api/Users
  @override
  Future<Either<Failure, Unit>> createUser(UserModel user) async {
    try {
      await apiService.post(endPoint: '/Users', data: user.toJson());
      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
