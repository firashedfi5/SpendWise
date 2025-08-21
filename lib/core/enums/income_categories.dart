import 'package:flutter/material.dart';
import 'package:spendwise/core/utils/assets.dart';

enum IncomeCategories {
  salary,
  freelance,
  business,
  partTime,
  investment,
  rental,
  bonus,
  gift,
  refund,
  cashback,
  pension,
  other,
}

extension IncomeCategoriesExtension on IncomeCategories {
  String get name {
    switch (this) {
      case IncomeCategories.salary:
        return 'Salary';
      case IncomeCategories.freelance:
        return 'Freelance';
      case IncomeCategories.business:
        return 'Business';
      case IncomeCategories.partTime:
        return 'Part Time';
      case IncomeCategories.investment:
        return 'Investment';
      case IncomeCategories.rental:
        return 'Rental';
      case IncomeCategories.bonus:
        return 'Bonus';
      case IncomeCategories.gift:
        return 'Gift';
      case IncomeCategories.refund:
        return 'Refund';
      case IncomeCategories.cashback:
        return 'Cashback';
      case IncomeCategories.pension:
        return 'Pension';
      case IncomeCategories.other:
        return 'Other';
    }
  }

  Widget get icon {
    switch (this) {
      case IncomeCategories.salary:
        return const Image(image: AssetImage(AssetsData.salaryIcon), width: 35);
      case IncomeCategories.freelance:
        return const Image(
          image: AssetImage(AssetsData.freelanceIcon),
          width: 35,
        );
      case IncomeCategories.business:
        return const Image(
          image: AssetImage(AssetsData.businessIcon),
          width: 35,
        );
      case IncomeCategories.partTime:
        return const Image(
          image: AssetImage(AssetsData.partTimeIcon),
          width: 35,
        );
      case IncomeCategories.investment:
        return const Image(
          image: AssetImage(AssetsData.investmentIcon),
          width: 35,
        );
      case IncomeCategories.rental:
        return const Image(image: AssetImage(AssetsData.rentIcon), width: 35);
      case IncomeCategories.bonus:
        return const Image(image: AssetImage(AssetsData.bonusIcon), width: 35);
      case IncomeCategories.gift:
        return const Image(image: AssetImage(AssetsData.giftIcon), width: 35);
      case IncomeCategories.refund:
        return const Image(image: AssetImage(AssetsData.refundIcon), width: 35);
      case IncomeCategories.cashback:
        return const Image(
          image: AssetImage(AssetsData.cashbackIcon),
          width: 35,
        );
      case IncomeCategories.pension:
        return const Image(
          image: AssetImage(AssetsData.pensionIcon),
          width: 35,
        );
      case IncomeCategories.other:
        return const Icon(Icons.more_horiz);
    }
  }
}
