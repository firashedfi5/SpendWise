import 'package:dartz/dartz.dart';
import 'package:spendwise/core/errors/failure.dart';
import 'package:spendwise/features/auth/data/models/user_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, UserModel>> getUser({required String userId});
}
