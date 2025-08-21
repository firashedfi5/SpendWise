import 'package:flutter/material.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/amount_text_form_field.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/choose_date.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/income_title_text_form_field.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/select_category.dart';

class AddIncomeScreenBody extends StatefulWidget {
  const AddIncomeScreenBody({super.key});

  @override
  State<AddIncomeScreenBody> createState() => _AddIncomeScreenBodyState();
}

class _AddIncomeScreenBodyState extends State<AddIncomeScreenBody> {
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
              const ChooseDate(calendarColor: kPrimaryColor),
              const SizedBox(height: 30),
              IncomTitleTextFormField(
                titleController: titleController,
                label: 'Income Title',
                hintText: 'Remote Job',
              ),
              const SizedBox(height: 30),
              AmountTextFormField(amountController: amountController),
              const SizedBox(height: 30),
              const SelectCategory(isIncome: true),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 45),
                  backgroundColor: kPrimaryColor,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: const Text('Add Income'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
