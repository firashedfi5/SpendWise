import 'package:hive_flutter/hive_flutter.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

abstract class HomeLocalDataSource {
  List<TransactionModel> fetchTransactions();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<TransactionModel> fetchTransactions() {
    var box = Hive.box<TransactionModel>(kTransactionsBox);

    return box.values.toList();
  }
}
