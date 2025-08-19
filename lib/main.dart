import 'package:flutter/material.dart';
import 'package:spendwise/core/utils/app_router.dart';

void main() {
  runApp(const SpendWise());
}

class SpendWise extends StatelessWidget {
  const SpendWise({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xfff3f5f7),
        appBarTheme: const AppBarTheme(color: Color(0xfff3f5f7)),
      ),
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
