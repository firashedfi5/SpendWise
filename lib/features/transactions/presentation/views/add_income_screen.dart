import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/utils/service_locator.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';
import 'package:spendwise/features/transactions/data/repo/transactions_repo_impl.dart';
import 'package:spendwise/features/transactions/presentation/manager/add_transaction/add_transaction_cubit.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/add_income_screen_body.dart';

class AddIncomeScreen extends StatelessWidget {
  const AddIncomeScreen({super.key, this.transaction});

  final TransactionModel? transaction;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddTransactionCubit(getIt.get<TransactionsRepoImpl>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(transaction == null ? 'Add Income' : 'Update Income'),
          centerTitle: true,
        ),
        body: AddIncomeScreenBody(transaction: transaction),
      ),
    );
  }
}
