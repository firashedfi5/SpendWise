import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/service_locator.dart';
import 'package:spendwise/core/widgets/custom_elevated_button.dart';
import 'package:spendwise/core/widgets/custom_text_form_field.dart';
import 'package:spendwise/features/settings/presentation/views/widgets/profile_image.dart';

class AccountInfoScreenBody extends StatefulWidget {
  const AccountInfoScreenBody({super.key});

  @override
  State<AccountInfoScreenBody> createState() => _AccountInfoScreenBodyState();
}

class _AccountInfoScreenBodyState extends State<AccountInfoScreenBody> {
  final TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    usernameController.text = getIt
        .get<FirebaseAuth>()
        .currentUser!
        .displayName!;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kPadding24),
        child: Form(
          child: Column(
            children: [
              const ProfilImage(),
              CustomTextFormField(
                textController: usernameController,
                label: 'Username',
                hintText: 'Enter your username',
              ),
              const SizedBox(height: 200),
              CustomElevatedButton(
                backgroundColor: kPrimaryColor,
                foregroundColor: Colors.white,
                label: 'Update',
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
