import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spendwise/core/errors/failure.dart';
import 'package:spendwise/core/utils/api_service.dart';
import 'package:spendwise/core/utils/service_locator.dart';
import 'package:spendwise/features/home/data/repos/home_repo.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImpl(this._apiService);

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

  @override
  Future<Either<Failure, List<TransactionModel>>> fetchTransactions({
    required String userId,
  }) async {
    try {
      final data = await _apiService.get(
        endPoint: '/Transactions/${getIt.get<FirebaseAuth>().currentUser!.uid}',
      );
      List<TransactionModel> transactions = [];
      for (var item in data['data']) {
        transactions.add(TransactionModel.fromJson(item));
      }
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
      await _apiService.delete(endPoint: '/Transactions/$id');
      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
