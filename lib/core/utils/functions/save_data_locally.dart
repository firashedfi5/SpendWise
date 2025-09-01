import 'package:hive/hive.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

void saveDataLocally(List<TransactionModel> transactions, String boxName) {
  var box = Hive.box(boxName);
  box.addAll(transactions);
}
