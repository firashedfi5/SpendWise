import 'package:dartz/dartz.dart';
import 'package:spendwise/core/errors/failure.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

abstract class HomeRepo {
  // Future<Either<Failure, UserModel>> getUser({required String userId});

  Future<Either<Failure, List<TransactionModel>>> getTransactions({
    required String userId,
  });

  Future<Either<Failure, Unit>> deleteTransaction({required int id});
}
