import 'package:firebase_auth/firebase_auth.dart';
import 'package:spendwise/core/utils/api_service.dart';
import 'package:spendwise/core/utils/service_locator.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<TransactionModel>> fetchTransactions();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl(this._apiService);
  @override
  Future<List<TransactionModel>> fetchTransactions() async {
    final data = await _apiService.get(
      endPoint: '/Transactions/${getIt.get<FirebaseAuth>().currentUser!.uid}',
    );
    List<TransactionModel> transactions = [];
    for (var item in data['data']) {
      transactions.add(TransactionModel.fromJson(item));
    }
    return transactions;
  }
}
