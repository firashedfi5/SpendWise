import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/core/utils/app_router.dart';
import 'package:spendwise/core/utils/bloc_observer.dart';
import 'package:spendwise/core/utils/service_locator.dart';
import 'package:spendwise/core/utils/themes.dart';
import 'package:spendwise/features/settings/presentation/manager/theme_bloc/theme_bloc.dart';
import 'package:spendwise/features/transactions/data/models/transaction_model.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = SimpleBlocObserver();
  setup();
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionModelAdapter());
  await Hive.openBox<TransactionModel>(kTransactionsBox);

  final themeBloc = await ThemeBloc.create();

  runApp(SpendWise(themeBloc: themeBloc));
}

class SpendWise extends StatelessWidget {
  const SpendWise({super.key, required this.themeBloc});

  final ThemeBloc themeBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>.value(
      value: themeBloc,
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state,
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
