import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spendwise/core/errors/failure.dart';
import 'package:spendwise/core/utils/api_service.dart';
import 'package:spendwise/core/utils/auth_service.dart';
import 'package:spendwise/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;
  final AuthService authService;

  AuthRepoImpl(this.apiService, this.authService);

  //* Sign up
  @override
  Future<Either<Failure, User>> signupUser({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await apiService.createUserWithEmailAndPassword(
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
  Future<Either<Failure, User>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await apiService.signInWithEmailAndPassword(
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
}
