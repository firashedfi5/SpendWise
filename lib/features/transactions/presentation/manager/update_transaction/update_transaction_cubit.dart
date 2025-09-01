import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';
import 'package:spendwise/features/transactions/data/repo/transactions_repo.dart';

part 'update_transaction_state.dart';

class UpdateTransactionCubit extends Cubit<UpdateTransactionState> {
  UpdateTransactionCubit(this._transactionsRepo)
    : super(UpdateTransactionInitial());

  final TransactionsRepo _transactionsRepo;

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
