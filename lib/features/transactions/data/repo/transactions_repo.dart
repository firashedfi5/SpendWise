import 'package:dartz/dartz.dart';
import 'package:spendwise/core/errors/failure.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

abstract class TransactionsRepo {
  Future<Either<Failure, Unit>> addTransaction({
    required TransactionModel transaction,
  });

  Future<Either<Failure, Unit>> updateTransaction({
    required TransactionModel transaction,
  });
}
