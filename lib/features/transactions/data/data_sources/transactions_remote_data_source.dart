import 'dart:developer';

import 'package:spendwise/core/utils/api_service.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

abstract class TransactionsRemoteDataSource {
  Future<TransactionModel> addTransaction({
    required TransactionModel transaction,
  });
}

class TransactionsRemoteDataSourceImpl implements TransactionsRemoteDataSource {
  final ApiService _apiService;

  TransactionsRemoteDataSourceImpl(this._apiService);

  @override
  Future<TransactionModel> addTransaction({
    required TransactionModel transaction,
  }) async {
    final response = await _apiService.post(
      endPoint: '/Transactions',
      data: transaction.toJson(),
    );
    log('Transaction added remotely successfully!', name: 'Adding');
    return TransactionModel.fromJson(response.data);
  }
}
