import 'package:flutter/material.dart';
import 'package:lovecalculation/cores/helper/strings.dart';
import 'package:lovecalculation/cores/styles/style.dart';
import 'package:lovecalculation/features/home/presentation/widgets/form_input.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = '/home';

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
        width: double.infinity,
        height: double.infinity,
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Image(width: 200, image: AssetImage(backgroundApp2)),
                  SizedBox(height: 1),
                  LoveFormWidget()
                ],
              ),
            )),
      ),
    );
  }
}
