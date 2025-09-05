import 'package:dartz/dartz.dart';
import 'package:spendwise/core/errors/failure.dart';
import 'package:spendwise/features/auth/data/models/user_model.dart';

abstract class SettingsRepo {
  Future<Either<Failure, Unit>> updateProfile({required UserModel user});
}
