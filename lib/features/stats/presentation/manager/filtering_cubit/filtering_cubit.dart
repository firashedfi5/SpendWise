import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

part 'filtering_state.dart';

class FilteringCubit extends Cubit<FilteringState> {
  FilteringCubit() : super(FilteringInitial());

  String _type = 'Income';
  List<TransactionModel> _allTransactions = [];

  String get type => _type;
  List<TransactionModel> get allTransactions => _allTransactions;

  void setAllTransactions(List<TransactionModel> transactions) {
    _allTransactions = transactions;
    filterTransactions(type: _type);
  }

  void updateFilterType(String newType) {
    _type = newType;
    filterTransactions(type: _type);
  }

  // void removeTransaction(TransactionModel transaction) {
  //   _allTransactions.removeWhere(
  //     (transaction) => transaction.id == transaction.id,
  //   );
  //   filterTransactions(type: _type);
  // }

  Future<void> filterTransactions({required String type}) async {
    emit(
      FilteringSuccess(
        filteredTransactions: _allTransactions
            .where((element) => element.type == type)
            .toList(),
      ),
    );
  }
}
