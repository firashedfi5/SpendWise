import 'package:spendwise/core/utils/api_service.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

abstract class TransactionsRemoteDataSource {
  Future<TransactionModel> addTransaction({
    required TransactionModel transaction,
  });
  Future<void> updateTransaction({required TransactionModel transaction});
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
    // log('Transaction added remotely successfully!', name: 'Adding');
    return TransactionModel.fromJson(response.data);
  }

  @override
  Future<void> updateTransaction({
    required TransactionModel transaction,
  }) async {
    await _apiService.put(
      endPoint: '/Transactions/${transaction.id}',
      data: transaction.toJson(),
    );
    // log('Transaction updated remotely successfully!', name: 'Updating');
  }
}
