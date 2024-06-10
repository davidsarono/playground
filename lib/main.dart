import 'dart:async';

import 'package:flutter/material.dart';
import 'package:playground/core/di/injectable.dart';
import 'package:playground/presentation/routes/router.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    configureDependencies();

    runApp(const MainApp());
  }, (error, stack) {
    debugPrint('runZonedGuarded: Caught error in my root zone.');
    debugPrint('ERROR\nDETAIL: $error\nSTACKTRACE: $stack');
  },);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
