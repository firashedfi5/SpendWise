import 'package:flutter/material.dart';
import 'package:spendwise/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:spendwise/features/home/presentation/views/widgets/home_card.dart';
import 'package:spendwise/features/home/presentation/views/widgets/transactions_header.dart';
import 'package:spendwise/features/home/presentation/views/widgets/transactions_list_view.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomAppBar(),
        HomeCard(),
        TransactionsHeader(),
        TransactionsListView(),
      ],
    );
  }
}
