import 'package:flutter/material.dart';
import 'package:spendwise/features/stats/presentation/views/stats_screen_body.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: StatsScreenBody());
  }
}
