import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';
import 'package:spendwise/features/transactions/data/repo/transactions_repo.dart';

part 'add_transaction_state.dart';

class AddTransactionCubit extends Cubit<AddTransactionState> {
  AddTransactionCubit(this._transactionsRepo) : super(AddTransactionInitial());

  final TransactionsRepo _transactionsRepo;

  DateTime date = DateTime.now();
  String? category;

  void setCategory(String selectedCategory) {
    category = selectedCategory;
    emit(CategoryUpdated(selectedCategory));
  }

  Future<void> addTransaction({required TransactionModel transaction}) async {
    emit(AddTransactionLoading());
    final result = await _transactionsRepo.addTransaction(
      transaction: transaction,
    );
    result.fold(
      (failure) => emit(AddTransactionFailure(errMessage: failure.message)),
      (success) => emit(AddTransactionSuccess()),
    );
  }
}
