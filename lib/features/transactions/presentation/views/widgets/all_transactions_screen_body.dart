import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/features/home/presentation/manager/fetch_transactions/fetch_transactions_cubit.dart';
import 'package:spendwise/features/home/presentation/views/widgets/transactions_list_view_item.dart';

class AllTransactionsScreenBody extends StatelessWidget {
  const AllTransactionsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchTransactionsCubit, FetchTransactionsState>(
      builder: (context, state) {
        if (state is FetchTransactionsSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding24),
            child: ListView.builder(
              itemCount: state.transactions.length,
              itemBuilder: (context, index) {
                return TransactionsListViewItem(
                  transaction: state.transactions[index],
                );
              },
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
