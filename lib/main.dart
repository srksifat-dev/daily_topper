import 'package:daily_topper/core/routes/route_generator.dart';
import 'package:daily_topper/res/localization/languages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      translations: Languages(),
      locale: const Locale("en","US"),
      fallbackLocale: const Locale("en","US"),
      routeInformationParser: RouteGenerator.router.routeInformationParser,
      routerDelegate: RouteGenerator.router.routerDelegate,
      routeInformationProvider: RouteGenerator.router.routeInformationProvider,
    );
  }
}