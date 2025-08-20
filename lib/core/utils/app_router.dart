import 'package:go_router/go_router.dart';
import 'package:spendwise/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:spendwise/features/transactions/presentation/views/add_transaction_screen.dart';

abstract class AppRouter {
  static const String kNewTransactionScreen = '/newTransactionScreen';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const CustomBottomNavBar(),
      ),
      GoRoute(
        path: kNewTransactionScreen,
        builder: (context, state) => const AddTransactionScreen(),
      ),
    ],
  );
}
