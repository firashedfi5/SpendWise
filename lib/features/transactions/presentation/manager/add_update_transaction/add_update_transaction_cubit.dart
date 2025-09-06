import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';
import 'package:spendwise/features/transactions/data/repo/transactions_repo.dart';

part 'add_update_transaction_state.dart';

class AddUpdateTransactionCubit extends Cubit<AddUpdateTransactionState> {
  AddUpdateTransactionCubit(this._transactionsRepo)
    : super(AddTransactionInitial());

  final TransactionsRepo _transactionsRepo;

  int? id;
  String? userId;
  DateTime date = DateTime.now();
  DateTime createdAt = DateTime.now();
  String? category;

  void initializeWithTask(TransactionModel transaction) {
    id = transaction.id!;
    userId = transaction.userId!;
    date = transaction.date!;
    createdAt = transaction.createdAt!;
    category = transaction.category!;

    emit(UpdateTransactionInitial(transaction: transaction));
  }

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

  Future<void> updateTransaction({
    required TransactionModel transaction,
  }) async {
    emit(UpdateTransactionLoading());
    final result = await _transactionsRepo.updateTransaction(
      transaction: transaction,
    );
    result.fold(
      (failure) => emit(UpdateTransactionFailure(errMessage: failure.message)),
      (success) => emit(UpdateTransactionSuccess()),
    );
  }
}
