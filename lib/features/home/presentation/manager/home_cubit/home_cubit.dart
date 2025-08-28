import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/features/home/data/repos/home_repo.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());

  final HomeRepo _homeRepo;

  // Future<void> getUserData({required String userId}) async {
  //   emit(HomeLoading());
  //   final result = await _homeRepo.getUser(userId: userId);
  //   result.fold(
  //     (failure) => emit(HomeFailure(errMessage: failure.message)),
  //     (user) => emit(HomeSuccess(user: user)),
  //   );
  // }

  Future<void> getTransactions({required String userId}) async {
    emit(HomeLoading());
    final result = await _homeRepo.getTransactions(userId: userId);
    result.fold(
      (failure) => emit(HomeFailure(errMessage: failure.message)),
      (transactions) => emit(HomeSuccess(transactions: transactions)),
    );
  }
}
