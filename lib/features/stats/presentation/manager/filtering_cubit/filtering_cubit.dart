import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/utils/service_locator.dart';
import 'package:spendwise/features/home/data/repos/home_repo.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

part 'filtering_state.dart';

class FilteringCubit extends Cubit<FilteringState> {
  FilteringCubit(this._homeRepo) : super(FilteringInitial());

  final HomeRepo _homeRepo;

  Future<void> filterTransactions({required String type}) async {
    emit(FilteringLoading());
    final result = await _homeRepo.fetchTransactions(
      userId: getIt.get<FirebaseAuth>().currentUser!.uid,
    );
    result.fold(
      (failure) => emit(FilteringFailure(errMessage: failure.message)),
      (transactions) {
        emit(
          FilteringSuccess(
            filteredTransactions: transactions
                .where((element) => element.type == type)
                .toList(),
          ),
        );
      },
    );
  }
}
