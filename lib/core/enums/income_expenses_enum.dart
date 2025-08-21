import 'package:flutter/material.dart';
import 'package:spendwise/core/constants.dart';

enum IncomeExpenseEnum { income, expense }

extension IncomeExpenseEnumExtension on IncomeExpenseEnum {
  String get title {
    switch (this) {
      case IncomeExpenseEnum.income:
        return 'Total Income';
      case IncomeExpenseEnum.expense:
        return 'Total Expenses';
    }
  }

  Widget get icon {
    switch (this) {
      case IncomeExpenseEnum.income:
        return const Icon(Icons.arrow_circle_down, color: kPrimaryColor);
      case IncomeExpenseEnum.expense:
        return const Icon(Icons.arrow_circle_up, color: kSecondaryColor);
    }
  }

  Color get color {
    switch (this) {
      case IncomeExpenseEnum.income:
        return kPrimaryColor;
      case IncomeExpenseEnum.expense:
        return kSecondaryColor;
    }
  }

  double get amount {
    switch (this) {
      case IncomeExpenseEnum.income:
        return 8.500;
      case IncomeExpenseEnum.expense:
        return 3.500;
    }
  }
}
