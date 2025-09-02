import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

abstract class TransactionsLocalDataSource {
  Future<void> addTransaction({required TransactionModel transaction});
}

class TransactionsLocalDataSourceImpl implements TransactionsLocalDataSource {
  @override
  Future<void> addTransaction({required TransactionModel transaction}) async {
    var box = Hive.box<TransactionModel>(kTransactionsBox);
    await box.add(transaction);
    log('Transaction added locally successfully!', name: 'Adding');
  }
}
