import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

Future<void> deleteDataLocally(int id, String boxName) async {
  var box = Hive.box<TransactionModel>(boxName);
  final List<TransactionModel> transactionsList = box.values.toList();
  for (int i = 0; i < transactionsList.length; i++) {
    if (transactionsList[i].id == id) {
      await box.deleteAt(i);
      log('Transaction delete locally successfully!', name: 'Deleting');
      break;
    }
  }
}
