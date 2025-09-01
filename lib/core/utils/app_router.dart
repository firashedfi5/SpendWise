import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spendwise/features/auth/presentation/views/forgot_passwrod_screen.dart';
import 'package:spendwise/features/auth/presentation/views/login_screen.dart';
import 'package:spendwise/features/auth/presentation/views/signup_screen.dart';
import 'package:spendwise/features/home/presentation/views/widgets/main_screen.dart';
import 'package:spendwise/features/settings/presentation/views/account_info_screen.dart';
import 'package:spendwise/features/settings/presentation/views/language_screen.dart';
import 'package:spendwise/features/settings/presentation/views/settings_screen.dart';
import 'package:spendwise/features/settings/presentation/views/theme_screen.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';
import 'package:spendwise/features/transactions/presentation/views/add_expense_screen.dart';
import 'package:spendwise/features/transactions/presentation/views/add_income_screen.dart';
import 'package:spendwise/features/transactions/presentation/views/add_transaction_screen.dart';

abstract class AppRouter {
  static const String kSignupScreen = '/signupScreen';
  static const String kForgotPasswordScreen = '/forgotPasswordScreen';
  static const String kMainScreen = '/mainScreen';
  static const String kAddTransactionScreen = '/newTransactionScreen';
  static const String kAddIncomeScreen = '/addIncomeScreen';
  static const String kAddExpenseScreen = '/addExpenseScreen';
  static const String kSettingsScreen = '/settingsScreen';
  static const String kAccountInfoScreen = '/accountInfoScreen';
  static const String kLanguageScreen = '/languageScreen';
  static const String kThemeScreen = '/themeScreen';
  static final router = GoRouter(
    observers: [routeObserver],
    routes: [
      GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: kSignupScreen,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: kForgotPasswordScreen,
        builder: (context, state) => const ForgotPasswrodScreen(),
      ),
      GoRoute(
        path: kMainScreen,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: kAddTransactionScreen,
        builder: (context, state) => const AddTransactionScreen(),
      ),
      GoRoute(
        path: kAddIncomeScreen,
        builder: (context, state) {
          final TransactionModel? transaction =
              state.extra as TransactionModel?;
          return AddIncomeScreen(transaction: transaction);
        },
      ),
      GoRoute(
        path: kAddExpenseScreen,
        builder: (context, state) {
          final TransactionModel? transaction =
              state.extra as TransactionModel?;
          return AddExpenseScreen(transaction: transaction);
        },
      ),
      GoRoute(
        path: kSettingsScreen,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: kAccountInfoScreen,
        builder: (context, state) => const AccountInfoScreen(),
      ),
      GoRoute(
        path: kLanguageScreen,
        builder: (context, state) => const LanguageScreen(),
      ),
      GoRoute(
        path: kThemeScreen,
        builder: (context, state) => const ThemeScreen(),
      ),
    ],
  );
}

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();
// class GoRouterObserver extends NavigatorObserver {
//   @override
//   void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     log('MyTest didPush: $route');
//   }

//   @override
//   void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     log('MyTest didPop: $route');
//   }

//   @override
//   void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     log('MyTest didRemove: $route');
//   }

//   @override
//   void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
//     log('MyTest didReplace: $newRoute');
//   }
// }
