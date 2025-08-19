import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: SizedBox(
        child: BarChart(
          BarChartData(
            barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
                // getTooltipColor: (group) => Colors.white,
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  return BarTooltipItem(
                    '${rod.toY}',
                    const TextStyle(
                      color: Colors.white, // Text color
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            gridData: const FlGridData(drawVerticalLine: false),
            borderData: FlBorderData(show: false),
            titlesData: const FlTitlesData(
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            maxY: 5000,
            barGroups: List.generate(
              4,
              (index) => BarChartGroupData(
                barsSpace: 10,
                x: 4,
                barRods: [
                  BarChartRodData(
                    toY: 5000,
                    color: Colors.purple,
                    width: 10,
                    backDrawRodData: BackgroundBarChartRodData(
                      color: Colors.grey.withValues(alpha: 0.4),
                      toY: 5000,
                      show: true,
                    ),
                  ),
                  BarChartRodData(
                    toY: 3500,
                    color: Colors.orange,
                    width: 10,
                    backDrawRodData: BackgroundBarChartRodData(
                      color: Colors.grey.withValues(alpha: 0.4),
                      toY: 5000,
                      show: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
