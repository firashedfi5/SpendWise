import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spendwise/core/errors/failure.dart';
import 'package:spendwise/core/utils/api_service.dart';
import 'package:spendwise/features/transactions/data/data_sources/transactions_local_data_source.dart';
import 'package:spendwise/features/transactions/data/data_sources/transactions_remote_data_source.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';
import 'package:spendwise/features/transactions/data/repo/transactions_repo.dart';

class TransactionsRepoImpl implements TransactionsRepo {
  final ApiService _apiService;
  final TransactionsRemoteDataSource _transactionsRemoteDataSource;
  final TransactionsLocalDataSource _transactionsLocalDataSource;

  TransactionsRepoImpl(
    this._apiService,
    this._transactionsRemoteDataSource,
    this._transactionsLocalDataSource,
  );

  @override
  Future<Either<Failure, Unit>> addTransaction({
    required TransactionModel transaction,
  }) async {
    try {
      final TransactionModel serverTransaction =
          await _transactionsRemoteDataSource.addTransaction(
            transaction: transaction,
          );

      await _transactionsLocalDataSource.addTransaction(
        transaction: serverTransaction,
      );

      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateTransaction({
    required TransactionModel transaction,
  }) async {
    try {
      await _apiService.put(
        endPoint: '/Transactions/${transaction.id}',
        data: transaction.toJson(),
      );
      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
