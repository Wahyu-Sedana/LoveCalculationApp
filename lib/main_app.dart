import 'package:flutter/material.dart';
import 'package:lovecalculation/features/home/presentation/pages/home_page.dart';
import 'package:lovecalculation/features/splash_page.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashPage(),
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}
