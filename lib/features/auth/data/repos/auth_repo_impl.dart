import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spendwise/core/errors/failure.dart';
import 'package:spendwise/core/utils/api_service.dart';
import 'package:spendwise/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

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
}
