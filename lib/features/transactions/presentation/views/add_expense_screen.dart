import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/utils/service_locator.dart';
import 'package:spendwise/features/transactions/data/repo/transactions_repo_impl.dart';
import 'package:spendwise/features/transactions/presentation/manager/cubit/transactions_cubit.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/add_expense_screen_body.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionsCubit(getIt.get<TransactionsRepoImpl>()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Add Expense'), centerTitle: true),
        body: const AddExpenseScreenBody(),
      ),
    );
  }
}
