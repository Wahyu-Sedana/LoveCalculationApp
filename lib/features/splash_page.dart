import 'package:flutter/material.dart';
import 'package:lovecalculation/cores/helper/strings.dart';
import 'package:lovecalculation/cores/styles/style.dart';
import 'package:lovecalculation/features/landing/presentation/landing_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const String routeName = '/splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(LandingPage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(logoSplash)),
            SizedBox(height: 5),
            Text(
              appName,
              style: appNameStyledText,
            ),
          ],
        ),
      ),
    );
  }
}
