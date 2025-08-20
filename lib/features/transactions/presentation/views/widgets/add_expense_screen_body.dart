import 'package:flutter/material.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/amount_text_form_field.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/choose_date.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/income_title_text_form_field.dart';
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kPadding24),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ChooseDate(calendarColor: kSecondaryColor),
              const SizedBox(height: 30),
              IncomTitleTextFormField(
                titleController: titleController,
                label: 'Expense Title',
                hintText: 'Travel trip to canada',
              ),
              const SizedBox(height: 30),
              AmountTextFormField(amountController: amountController),
              const SizedBox(height: 30),
              const SelectCategory(),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 45),
                  backgroundColor: kSecondaryColor,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: const Text('Add Expense'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
