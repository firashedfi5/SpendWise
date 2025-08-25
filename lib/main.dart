import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spendwise/core/utils/app_router.dart';
import 'package:spendwise/core/utils/service_locatore.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setup();
  runApp(const SpendWise());
}

class SpendWise extends StatelessWidget {
  const SpendWise({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // theme: ThemeData.dark(),
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
