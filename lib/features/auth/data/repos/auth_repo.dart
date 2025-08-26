import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spendwise/core/errors/failure.dart';
import 'package:spendwise/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  //* Sign up
  Future<Either<Failure, User>> signup({
    required String email,
    required String password,
    required String username,
  });

  //* Store user info in SQL Server
  Future<Either<Failure, Unit>> createUser(UserModel user);

  //* Log in
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> loginWithGoogle();

  //* Log out
  Future<Either<Failure, Unit>> logout();
}
