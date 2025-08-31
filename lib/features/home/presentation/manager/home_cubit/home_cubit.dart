import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/enums/expense_categories.dart';
import 'package:spendwise/core/enums/income_categories.dart';
import 'package:spendwise/core/utils/service_locator.dart';
import 'package:spendwise/features/home/data/repos/home_repo.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());

  final HomeRepo _homeRepo;

  Future<void> getTransactions() async {
    emit(HomeLoading());
    final result = await _homeRepo.getTransactions(
      userId: getIt.get<FirebaseAuth>().currentUser!.uid,
    );
    result.fold(
      (failure) => emit(HomeFailure(errMessage: failure.message)),
      (transactions) => emit(HomeSuccess(transactions: transactions)),
    );
  }

  Widget getCategoryIcon({
    required String type,
    required String fetchedCategory,
  }) {
    if (type == 'Income') {
      for (var category in IncomeCategories.values) {
        if (category.name == fetchedCategory) {
          return category.icon;
        }
      }
    } else {
      for (var category in ExpenseCategories.values) {
        if (category.name == fetchedCategory) {
          return category.icon;
        }
      }
    }

    return const Icon(Icons.help_outline);
  }

  double getTotalBalance({required List<TransactionModel> transactions}) {
    double totalBalance = 0;
    for (var transaction in transactions) {
      if (transaction.type == 'Income') {
        totalBalance += transaction.amount!;
      } else {
        totalBalance -= transaction.amount!;
      }
    }
    return totalBalance;
  }

  double getTotalIncome({required List<TransactionModel> transactions}) {
    double totalIncome = 0;
    for (var transaction in transactions) {
      if (transaction.type == 'Income') {
        totalIncome += transaction.amount!;
      } else {
        totalIncome += 0;
      }
    }
    return totalIncome;
  }

  double getTotalExpenses({required List<TransactionModel> transactions}) {
    double totalExpenses = 0;
    for (var transaction in transactions) {
      if (transaction.type == 'Expense') {
        totalExpenses += transaction.amount!;
      } else {
        totalExpenses += 0;
      }
    }
    return totalExpenses;
  }
}
