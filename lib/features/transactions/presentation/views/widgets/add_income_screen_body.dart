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
import 'package:spendwise/features/transactions/presentation/manager/add_update_transaction/add_update_transaction_cubit.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/amount_text_form_field.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/choose_date.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/select_category.dart';

class AddIncomeScreenBody extends StatefulWidget {
  const AddIncomeScreenBody({super.key, this.transaction});

  final TransactionModel? transaction;

  @override
  State<AddIncomeScreenBody> createState() => _AddIncomeScreenBodyState();
}

class _AddIncomeScreenBodyState extends State<AddIncomeScreenBody> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.transaction != null) {
      titleController.text = widget.transaction!.title!;
      amountController.text = widget.transaction!.amount!.toString();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        final cubit = BlocProvider.of<AddUpdateTransactionCubit>(context);
        cubit.initializeWithTask(widget.transaction!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddUpdateTransactionCubit, AddUpdateTransactionState>(
      listener: (context, state) {
        if (state is AddTransactionFailure) {
          customSnackBar(
            context: context,
            message: state.errMessage,
            success: false,
          );
        } else if (state is AddTransactionSuccess) {
          customSnackBar(
            context: context,
            message: 'Transaction added successfully',
            success: true,
          );
        } else if (state is UpdateTransactionFailure) {
          customSnackBar(
            context: context,
            message: state.errMessage,
            success: false,
          );
        } else if (state is UpdateTransactionSuccess) {
          customSnackBar(
            context: context,
            message: 'Transaction updated successfully',
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
                const ChooseDate(calendarColor: kPrimaryColor),
                const SizedBox(height: 30),
                CustomTextFormField(
                  textController: titleController,
                  label: 'Income Title',
                  hintText: 'Remote Job',
                ),
                const SizedBox(height: 30),
                AmountTextFormField(amountController: amountController),
                const SizedBox(height: 30),
                const SelectCategory(isIncome: true),
                const SizedBox(height: 50),
                CustomElevatedButton(
                  backgroundColor: kPrimaryColor,
                  foregroundColor: Colors.white,
                  label: widget.transaction == null
                      ? 'Add Income'
                      : 'Update Income',
                  onPressed: () async {
                    if (widget.transaction == null) {
                      await context
                          .read<AddUpdateTransactionCubit>()
                          .addTransaction(
                            transaction: TransactionModel(
                              id: 0,
                              userId: getIt
                                  .get<FirebaseAuth>()
                                  .currentUser!
                                  .uid,
                              type: 'Income',
                              title: titleController.text,
                              amount: double.parse(amountController.text),
                              category: context
                                  .read<AddUpdateTransactionCubit>()
                                  .category,
                              date: context
                                  .read<AddUpdateTransactionCubit>()
                                  .date,
                            ),
                          );
                    } else {
                      await context
                          .read<AddUpdateTransactionCubit>()
                          .updateTransaction(
                            transaction: TransactionModel(
                              id: context.read<AddUpdateTransactionCubit>().id,
                              userId: context
                                  .read<AddUpdateTransactionCubit>()
                                  .userId,
                              type: 'Income',
                              title: titleController.text,
                              amount: double.parse(amountController.text),
                              category: context
                                  .read<AddUpdateTransactionCubit>()
                                  .category,
                              date: context
                                  .read<AddUpdateTransactionCubit>()
                                  .date,
                            ),
                          );
                    }
                    if (context.mounted) context.pop();
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
