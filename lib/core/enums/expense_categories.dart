import 'package:flutter/material.dart';
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
        return const Image(image: AssetImage(AssetsData.foodIcon), width: 35);
      case ExpenseCategories.transport:
        return const Image(
          image: AssetImage(AssetsData.transportIcon),
          width: 35,
        );
      case ExpenseCategories.shopping:
        return const Image(
          image: AssetImage(AssetsData.shoppingIcon),
          width: 35,
        );
      case ExpenseCategories.bills:
        return const Image(image: AssetImage(AssetsData.billsIcon), width: 35);
      case ExpenseCategories.entertainment:
        return const Image(
          image: AssetImage(AssetsData.entertainmentIcon),
          width: 35,
        );
      case ExpenseCategories.health:
        return const Image(image: AssetImage(AssetsData.healthIcon), width: 35);
      case ExpenseCategories.education:
        return const Image(
          image: AssetImage(AssetsData.educationIcon),
          width: 35,
        );
      case ExpenseCategories.travel:
        return const Image(image: AssetImage(AssetsData.travelIcon), width: 35);
      case ExpenseCategories.groceries:
        return const Image(
          image: AssetImage(AssetsData.groceriesIcon),
          width: 35,
        );
      case ExpenseCategories.subscription:
        return const Image(
          image: AssetImage(AssetsData.subscriptionIcon),
          width: 35,
        );
      case ExpenseCategories.maintenance:
        return const Image(
          image: AssetImage(AssetsData.maintenanceIcon),
          width: 35,
        );
      case ExpenseCategories.other:
        return const Icon(Icons.more_horiz);
    }
  }
}
