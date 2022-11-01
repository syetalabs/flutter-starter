import 'package:flutter/material.dart';
import 'package:flutter_starter/core/config/router.router.dart';
import 'package:flutter_starter/locator.dart';
import 'package:flutter_starter/ui/theme/theme.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Starter',
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      theme: AppTheme.theme,
    );
  }
}
