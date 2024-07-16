import 'package:flutter/material.dart';
import 'package:lovecalculation/cores/helper/strings.dart';
import 'package:lovecalculation/cores/styles/style.dart';
import 'package:lovecalculation/cores/widgets/custom_button_widget.dart';
import 'package:lovecalculation/features/home/presentation/pages/home_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  static const String routeName = '/landing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            appName,
            style: appNameStyledText,
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage(backgroundApp),
                  ),
                  SizedBox(height: 1.cm),
                  const Text(
                    'Welcome to Love Calculator! 💖',
                    style: TextStyle(
                        color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Embark on a journey to discover the magic of love. Whether you're curious about the compatibility with your crush or want to test the strength of your relationship, our Love Calculator is here to bring you closer to the answers you seek.",
                    style: TextStyle(color: Colors.redAccent),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 1.cm),
                  CustomButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.redAccent),
                    ),
                    bgColor: Colors.white,
                    event: () {
                      Navigator.pushReplacementNamed(context, HomePage.routeName);
                    },
                    text: const Text(
                      'Get Started',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
