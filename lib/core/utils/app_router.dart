import 'package:go_router/go_router.dart';
import 'package:spendwise/features/home/presentation/views/home_screen.dart';

abstract class AppRouter {
  static const String kHomeScreen = '/homeScreen';
  static const String kCalendarScreen = '/calendarScreen';
  static const String kNewTaskScreen = '/newTaskScreen';
  static const String kTaskScreen = '/taskScreen';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      // GoRoute(
      //   path: kHomeScreen,
      //   builder: (context, state) => const HomeScreen(),
      // ),
    ],
  );
}
