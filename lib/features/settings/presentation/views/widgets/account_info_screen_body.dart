import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/functions/custom_snackbar.dart';
import 'package:spendwise/core/utils/service_locator.dart';
import 'package:spendwise/core/widgets/custom_elevated_button.dart';
import 'package:spendwise/core/widgets/custom_text_form_field.dart';
import 'package:spendwise/features/auth/data/models/user_model.dart';
import 'package:spendwise/features/settings/presentation/manager/update_profile_cubit/update_profile_cubit.dart';
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
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileFailure) {
          customSnackBar(
            context: context,
            message: state.errMessage,
            success: false,
          );
        } else if (state is UpdateProfileSuccess) {
          customSnackBar(
            context: context,
            message: 'Profile updated successfully',
            success: true,
          );
        }
        context.pop();
      },
      builder: (context, state) {
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
                      context.read<UpdateProfileCubit>().updateProfile(
                        user: UserModel(
                          userId: getIt.get<FirebaseAuth>().currentUser!.uid,
                          email: getIt.get<FirebaseAuth>().currentUser!.email!,
                          username: usernameController.text,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
