import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spendwise/core/utils/app_router.dart';
import 'package:spendwise/core/utils/assets.dart';
import 'package:spendwise/core/utils/service_locator.dart';
import 'package:spendwise/core/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      title: Row(
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
                getIt.get<FirebaseAuth>().currentUser!.displayName ?? 'Unkown',
                style: Styles.textStyle18,
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () async {
            context.push(AppRouter.kSettingsScreen);
            // var box = Hive.box<TransactionModel>(kTransactionsBox);
            // await box.clear();
          },
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }
}
