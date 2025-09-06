import 'package:flutter/material.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/all_transactions_screen_body.dart';

class AllTransactionsScreen extends StatelessWidget {
  const AllTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Transactions'), centerTitle: true),
      body: const SafeArea(child: AllTransactionsScreenBody()),
    );
  }
}
