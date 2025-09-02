import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/functions/delete_data_locally.dart';
import 'package:spendwise/core/utils/service_locator.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

abstract class HomeLocalDataSource {
  List<TransactionModel> fetchTransactions();
  Future<void> deleteTransaction({required int id});
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<TransactionModel> fetchTransactions() {
    var box = Hive.box<TransactionModel>(kTransactionsBox);

    log('Transaction fetched locally successfully!', name: 'Fetching');

    List<TransactionModel> transactions = box.values.toList();

    return transactions
        .where(
          (element) =>
              element.userId == getIt.get<FirebaseAuth>().currentUser!.uid,
        )
        .toList();
  }

  @override
  Future<void> deleteTransaction({required int id}) async {
    await deleteDataLocally(id, kTransactionsBox);
    log('Transaction deleted locally successfully!', name: 'Deleting');
  }
}
