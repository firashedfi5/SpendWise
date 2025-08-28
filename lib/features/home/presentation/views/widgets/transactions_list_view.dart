import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/functions/custom_snackbar.dart';
import 'package:spendwise/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:spendwise/features/home/presentation/views/widgets/transactions_list_view_item.dart';

class TransactionsListView extends StatelessWidget {
  const TransactionsListView({super.key, required this.childCount});

  final int childCount;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding24),
      sliver: BlocConsumer<HomeCubit, HomeState>(
        listener: (BuildContext context, HomeState state) {
          if (state is HomeFailure) {
            customSnackBar(
              context: context,
              message: state.errMessage,
              success: false,
            );
          }
        },
        builder: (context, state) {
          if (state is HomeSuccess) {
            return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return TransactionsListViewItem(
                  transaction: state.transactions[index],
                );
              }, childCount: state.transactions.length),
            );
          } else if (state is HomeFailure) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Icon(Icons.error_outline, color: Colors.red),
              ),
            );
          } else if (state is HomeLoading) {
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          }
          return const SliverToBoxAdapter(child: SizedBox());
        },
      ),
    );
  }
}
