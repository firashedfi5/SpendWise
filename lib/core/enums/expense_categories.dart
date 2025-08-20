import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spendwise/core/utils/assets.dart';

enum ExpenseCategories {
  food,
  transport,
  shopping,
  bills,
  entertainment,
  health,
  education,
  travel,
  groceries,
  subscription,
  maintenance,
  other,
}

extension IncomeCategoriesExtension on ExpenseCategories {
  String get name {
    switch (this) {
      case ExpenseCategories.food:
        return 'Food';
      case ExpenseCategories.transport:
        return 'Transport';
      case ExpenseCategories.shopping:
        return 'Shopping';
      case ExpenseCategories.bills:
        return 'Bills';
      case ExpenseCategories.entertainment:
        return 'Entertainment';
      case ExpenseCategories.health:
        return 'Health';
      case ExpenseCategories.education:
        return 'Education';
      case ExpenseCategories.travel:
        return 'Travel';
      case ExpenseCategories.groceries:
        return 'Groceries';
      case ExpenseCategories.subscription:
        return 'Subscription';
      case ExpenseCategories.maintenance:
        return 'Maintenance';
      case ExpenseCategories.other:
        return 'Other';
    }
  }

  Widget get icon {
    switch (this) {
      case ExpenseCategories.food:
        return const Icon(Icons.fastfood, size: 28);
      case ExpenseCategories.transport:
        return const FaIcon(FontAwesomeIcons.bus);
      case ExpenseCategories.shopping:
        return const FaIcon(FontAwesomeIcons.bagShopping, size: 26);
      case ExpenseCategories.bills:
        return const ImageIcon(AssetImage(AssetsData.billsIcon), size: 34);
      case ExpenseCategories.entertainment:
        return const ImageIcon(
          AssetImage(AssetsData.entertainmentIcon),
          size: 34,
        );
      case ExpenseCategories.health:
        return const ImageIcon(AssetImage(AssetsData.healthIcon), size: 30);
      case ExpenseCategories.education:
        return const ImageIcon(AssetImage(AssetsData.educationIcon), size: 34);
      case ExpenseCategories.travel:
        return const ImageIcon(AssetImage(AssetsData.travelIcon), size: 34);
      case ExpenseCategories.groceries:
        return const ImageIcon(AssetImage(AssetsData.groceriesIcon), size: 30);
      case ExpenseCategories.subscription:
        return const ImageIcon(
          AssetImage(AssetsData.subscriptionIcon),
          size: 34,
        );
      case ExpenseCategories.maintenance:
        return const ImageIcon(
          AssetImage(AssetsData.maintenanceIcon),
          size: 30,
        );
      case ExpenseCategories.other:
        return const Icon(Icons.more_horiz);
    }
  }
}
