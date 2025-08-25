import 'package:flutter/material.dart';
import 'package:spendwise/core/utils/styles.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    required this.textController,
    required this.label,
    required this.hintText,
  });

  final TextEditingController textController;
  final String label;
  final String hintText;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: Styles.textStyle18),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: _isVisible,
          controller: widget.textController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a value!';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(width: 1, color: Colors.black),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              icon: _isVisible
                  ? const Icon(Icons.visibility_outlined)
                  : const Icon(Icons.visibility_off_outlined),
            ),
          ),
        ),
      ],
    );
  }
}
