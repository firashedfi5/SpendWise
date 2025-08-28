import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';
import 'package:spendwise/features/transactions/data/repo/transactions_repo.dart';

part 'transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  TransactionsCubit(this._transactionsRepo) : super(TransactionsInitial());

  final TransactionsRepo _transactionsRepo;

  DateTime date = DateTime.now();
  String? category;

  void setCategory(String selectedCategory) {
    category = selectedCategory;
    emit(CategoryUpdated(selectedCategory));
  }

  Future<void> addTransaction({required TransactionModel transaction}) async {
    emit(TransactionsLoading());
    final result = await _transactionsRepo.addTransaction(
      transaction: transaction,
    );
    result.fold(
      (failure) => emit(TransactionsFailure(errMessage: failure.message)),
      (success) => emit(TransactionsSuccess()),
    );
  }
}
