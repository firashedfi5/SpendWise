import 'package:flutter/material.dart';
import 'package:spendwise/core/utils/styles.dart';

class IncomTitleTextFormField extends StatelessWidget {
  const IncomTitleTextFormField({
    super.key,
    required this.titleController,
    required this.label,
    required this.hintText,
  });

  final TextEditingController titleController;
  final String label;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Styles.textStyle18),
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
            hintText: hintText,
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
