import 'package:flutter/material.dart';
import 'package:spendwise/features/transactions/presentation/views/widgets/custom_text_form_field.dart';

class ForgotPasswordScreenBody extends StatefulWidget {
  const ForgotPasswordScreenBody({super.key});

  @override
  State<ForgotPasswordScreenBody> createState() =>
      _ForgotPasswordScreenBodyState();
}

class _ForgotPasswordScreenBodyState extends State<ForgotPasswordScreenBody> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            child: Column(
              children: [
                CustomTextFormField(
                  textController: emailController,
                  label: 'Email',
                  hintText: 'Enter your email',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
