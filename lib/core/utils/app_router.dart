import 'package:go_router/go_router.dart';
import 'package:spendwise/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';

abstract class AppRouter {
  static const String kHomeScreen = '/homeScreen';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const CustomBottomNavBar(),
      ),
      // GoRoute(
      //   path: kHomeScreen,
      //   builder: (context, state) => const HomeScreen(),
      // ),
    ],
  );
}
