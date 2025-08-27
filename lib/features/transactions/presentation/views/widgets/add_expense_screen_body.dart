import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/functions/custom_snackbar.dart';
import 'package:spendwise/core/utils/service_locator.dart';
import 'package:spendwise/core/widgets/custom_elevated_button.dart';
import 'package:spendwise/core/widgets/custom_text_form_field.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';
import 'package:spendwise/features/transactions/presentation/manager/cubit/transactions_cubit.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/amount_text_form_field.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/choose_date.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/select_category.dart';

class AddExpenseScreenBody extends StatefulWidget {
  const AddExpenseScreenBody({super.key});

  @override
  State<AddExpenseScreenBody> createState() => _AddExpenseScreenBodyState();
}

class _AddExpenseScreenBodyState extends State<AddExpenseScreenBody> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionsCubit, TransactionsState>(
      listener: (context, state) {
        if (state is TransactionsFailure) {
          customSnackBar(
            context: context,
            message: state.errMessage,
            success: false,
          );
        } else if (state is TransactionsSuccess) {
          customSnackBar(
            context: context,
            message: 'Transaction added successfully',
            success: true,
          );
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kPadding24),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ChooseDate(calendarColor: kSecondaryColor),
                const SizedBox(height: 30),
                CustomTextFormField(
                  textController: titleController,
                  label: 'Expense Title',
                  hintText: 'Travel trip to canada',
                ),
                const SizedBox(height: 30),
                AmountTextFormField(amountController: amountController),
                const SizedBox(height: 30),
                const SelectCategory(isIncome: false),
                const SizedBox(height: 50),
                CustomElevatedButton(
                  backgroundColor: kSecondaryColor,
                  foregroundColor: Colors.white,
                  label: 'Add Expense',
                  onPressed: () {
                    context.read<TransactionsCubit>().addTransaction(
                      transaction: TransactionModel(
                        id: 0,
                        userId: getIt.get<FirebaseAuth>().currentUser!.uid,
                        type: 'Expense',
                        title: titleController.text,
                        amount: int.parse(amountController.text),
                        category: context.read<TransactionsCubit>().category,
                        date: context.read<TransactionsCubit>().date,
                      ),
                    );
                    context.pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
