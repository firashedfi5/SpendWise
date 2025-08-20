import 'package:flutter/material.dart';
import 'package:spendwise/core/utils/styles.dart';

class IncomTitleTextFormField extends StatelessWidget {
  const IncomTitleTextFormField({super.key, required this.titleController});

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Income Title', style: Styles.textStyle18),
        const SizedBox(height: 8),
        TextFormField(
          controller: titleController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a value!';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: 'Remote Job',
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
