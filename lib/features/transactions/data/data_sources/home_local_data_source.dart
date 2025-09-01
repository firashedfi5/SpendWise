import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

abstract class HomeLocalDataSource {
  List<TransactionModel> fetchTransactions();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<TransactionModel> fetchTransactions() {
    // TODO: implement fetchTransactions
    throw UnimplementedError();
  }
}
