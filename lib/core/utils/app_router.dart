import 'package:go_router/go_router.dart';
import 'package:spendwise/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:spendwise/features/settings/presentation/views/settings_screen.dart';
import 'package:spendwise/features/transactions/presentation/views/add_expense_screen.dart';
import 'package:spendwise/features/transactions/presentation/views/add_income_screen.dart';
import 'package:spendwise/features/transactions/presentation/views/add_transaction_screen.dart';

abstract class AppRouter {
  static const String kAddTransactionScreen = '/newTransactionScreen';
  static const String kAddIncomeScreen = '/addIncomeScreen';
  static const String kAddExpenseScreen = '/addExpenseScreen';
  static const String kSettingsScreen = '/settingsScreen';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const CustomBottomNavBar(),
      ),
      GoRoute(
        path: kAddTransactionScreen,
        builder: (context, state) => const AddTransactionScreen(),
      ),
      GoRoute(
        path: kAddIncomeScreen,
        builder: (context, state) => const AddIncomeScreen(),
      ),
      GoRoute(
        path: kAddExpenseScreen,
        builder: (context, state) => const AddExpenseScreen(),
      ),
      GoRoute(
        path: kSettingsScreen,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
}
