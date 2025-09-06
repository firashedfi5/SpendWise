import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/features/home/data/repos/home_repo.dart';

part 'delete_transaction_state.dart';

class DeleteTransactionCubit extends Cubit<DeleteTransactionState> {
  DeleteTransactionCubit(this._homeRepo) : super(DeleteTransactionInitial());

  final HomeRepo _homeRepo;

  Future<void> deleteTransaction({required int id}) async {
    emit(DeleteTransactionLoading());
    final result = await _homeRepo.deleteTransaction(id: id);
    result.fold(
      (failure) => emit(DeleteTransactionFailure(errMessage: failure.message)),
      (success) => emit(DeleteTransactionSuccess()),
    );
  }
}
