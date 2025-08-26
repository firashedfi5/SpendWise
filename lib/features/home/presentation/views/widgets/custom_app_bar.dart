import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spendwise/core/utils/app_router.dart';
import 'package:spendwise/core/utils/assets.dart';
import 'package:spendwise/core/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      title: const Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.red,
            backgroundImage: AssetImage(AssetsData.defaultAvatar),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome!', style: Styles.textStyle14),
              Text('Dina Hedfi', style: Styles.textStyle18),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () => context.push(AppRouter.kSettingsScreen),
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }
}
