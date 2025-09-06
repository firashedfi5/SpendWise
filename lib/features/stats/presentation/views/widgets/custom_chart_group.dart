import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:spendwise/core/constants.dart';

BarChartGroupData customBarChart({
  required int x,
  required double totalExpenses,
  required double totalIncome,
}) {
  return BarChartGroupData(
    barsSpace: 10,
    x: x,
    barRods: [
      BarChartRodData(
        toY: totalIncome,
        color: kPrimaryColor,
        width: 10,
        backDrawRodData: BackgroundBarChartRodData(
          color: Colors.grey.withValues(alpha: 0.4),
          toY: 8000,
          show: true,
        ),
      ),
      BarChartRodData(
        toY: totalExpenses,
        color: kSecondaryColor,
        width: 10,
        backDrawRodData: BackgroundBarChartRodData(
          color: Colors.grey.withValues(alpha: 0.4),
          toY: 8000,
          show: true,
        ),
      ),
    ],
  );
}
