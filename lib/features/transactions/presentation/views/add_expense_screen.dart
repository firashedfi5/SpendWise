import 'package:flutter/material.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/add_expense_screen_body.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Expense'), centerTitle: true),
      body: const AddExpenseScreenBody(),
    );
  }
}
