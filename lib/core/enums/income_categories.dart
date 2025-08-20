import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        return const ImageIcon(AssetImage(AssetsData.salaryIcon), size: 30);
      case IncomeCategories.freelance:
        return const ImageIcon(AssetImage(AssetsData.freelanceIcon), size: 30);
      case IncomeCategories.business:
        return const ImageIcon(AssetImage(AssetsData.businessIcon), size: 30);
      case IncomeCategories.partTime:
        return const ImageIcon(AssetImage(AssetsData.partTimeIcon), size: 36);
      case IncomeCategories.investment:
        return const ImageIcon(AssetImage(AssetsData.investmentIcon), size: 34);
      case IncomeCategories.rental:
        return const ImageIcon(AssetImage(AssetsData.rentIcon), size: 30);
      case IncomeCategories.bonus:
        return const ImageIcon(AssetImage(AssetsData.bonusIcon), size: 34);
      case IncomeCategories.gift:
        return const FaIcon(FontAwesomeIcons.gift, size: 24);
      case IncomeCategories.refund:
        return const ImageIcon(AssetImage(AssetsData.refundIcon), size: 30);
      case IncomeCategories.cashback:
        return const ImageIcon(AssetImage(AssetsData.cashbackIcon), size: 34);
      case IncomeCategories.pension:
        return const ImageIcon(AssetImage(AssetsData.pensionIcon), size: 34);
      case IncomeCategories.other:
        return const Icon(Icons.more_horiz);
    }
  }
}
