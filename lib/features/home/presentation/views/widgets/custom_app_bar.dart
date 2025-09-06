import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spendwise/core/utils/app_router.dart';
import 'package:spendwise/core/utils/assets.dart';
import 'package:spendwise/core/utils/service_locator.dart';
import 'package:spendwise/core/utils/styles.dart';
import 'package:spendwise/features/settings/presentation/manager/update_profile_cubit/update_profile_cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      title: BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
        builder: (context, state) {
          String? updatedUsername;
          if (state is UpdateProfileSuccess) {
            updatedUsername = state.user.displayName;
          }
          return Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.red,
                backgroundImage: AssetImage(AssetsData.defaultAvatar),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Welcome!', style: Styles.textStyle14),
                  Text(
                    updatedUsername ??
                        getIt.get<FirebaseAuth>().currentUser!.displayName ??
                        'Unkown',
                    style: Styles.textStyle18,
                  ),
                ],
              ),
            ],
          );
        },
      ),
      actions: [
        IconButton(
          onPressed: () async {
            final cubit = context.read<UpdateProfileCubit>();
            context.push(AppRouter.kSettingsScreen, extra: cubit);
            // var box = Hive.box<TransactionModel>(kTransactionsBox);
            // await box.clear();
          },
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }
}
