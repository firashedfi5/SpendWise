import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spendwise/core/errors/failure.dart';
import 'package:spendwise/features/home/data/data_sources/home_local_data_source.dart';
import 'package:spendwise/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:spendwise/features/home/data/repos/home_repo.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;
  final HomeLocalDataSource _homeLocalDataSource;

  HomeRepoImpl(this._homeRemoteDataSource, this._homeLocalDataSource);

  // @override
  // Future<Either<Failure, UserModel>> getUser({required String userId}) async {
  //   try {
  //     final data = await _apiService.get(endPoint: '/Users/$userId');
  //     final userData = UserModel.fromJson(data);
  //     return right(userData);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailure.fromDioError(e));
  //     }
  //     return left(ServerFailure(e.toString()));
  //   }
  // }

  //TODO: Data yet3malelha fetch ken mel local data source, ya3ni ayy transaction tetzed jdida maysirelhech fetch and cache locally
  @override
  Future<Either<Failure, List<TransactionModel>>> fetchTransactions({
    required String userId,
  }) async {
    List<TransactionModel> transactions = [];
    try {
      //* Fetch data locally
      transactions = _homeLocalDataSource.fetchTransactions();
      if (transactions.isNotEmpty) {
        return right(transactions);
      }

      //* Fetch data remotely
      transactions = await _homeRemoteDataSource.fetchTransactions();
      return right(transactions);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTransaction({required int id}) async {
    try {
      //* Delete transaction locally
      await _homeLocalDataSource.deleteTransaction(id: id);

      //* Delete transaction remotely
      await _homeRemoteDataSource.deleteTransaction(id: id);

      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
