import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spendwise/core/errors/failure.dart';

abstract class AuthRepo {
  //* Sign up
  Future<Either<Failure, User>> signupUser({
    required String email,
    required String password,
  });

  //* Log in
  Future<Either<Failure, User>> loginUser({
    required String email,
    required String password,
  });
}
