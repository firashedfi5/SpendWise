import 'package:flutter/material.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/add_transaction_screen_body.dart';

class AddTransactionScreen extends StatelessWidget {
  const AddTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AddTransactionScreenBody());
  }
}
