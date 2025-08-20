import 'package:flutter/material.dart';
import 'package:spendwise/core/utils/styles.dart';

class AmountTextFormField extends StatelessWidget {
  const AmountTextFormField({super.key, required this.amountController});

  final TextEditingController amountController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Amount', style: Styles.textStyle18),
        const SizedBox(height: 8),
        TextFormField(
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          controller: amountController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a value!';
            }
            return null;
          },
          decoration: InputDecoration(
            prefixText: '\$ ',
            hintText: '0.00',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(width: 1, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
