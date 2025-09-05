import 'package:dartz/dartz.dart';
import 'package:spendwise/core/errors/failure.dart';

abstract class SettingsRepo {
  Future<Either<Failure, Unit>> updateProfile();
}
