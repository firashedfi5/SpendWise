import 'package:flutter/material.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/add_income_screen_body.dart';

class AddIncomeScreen extends StatelessWidget {
  const AddIncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Income'), centerTitle: true),
      body: const AddIncomeScreenBody(),
    );
  }
}
