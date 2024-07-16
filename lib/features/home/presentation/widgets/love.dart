import 'dart:math';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoveDialogWidget extends StatefulWidget {
  final String yourname;
  final String hisname;
  const LoveDialogWidget({super.key, required this.yourname, required this.hisname});

  @override
  State<LoveDialogWidget> createState() => _LoveDialogWidgetState();
}

class _LoveDialogWidgetState extends State<LoveDialogWidget> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late double targetPercentage;
  late String messageResult = 'Keep Waiting This Result';

  @override
  void initState() {
    super.initState();

    targetPercentage = (Random().nextDouble() * 100).floorToDouble();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        if (animationController.value * 100 >= targetPercentage - 1) {
          if (animationController.value > 70) {
            messageResult = 'You are in love!';
            animationController.stop();
          } else if (animationController.value < 70) {
            messageResult = 'You might be in love.';
            animationController.stop();
          } else {
            messageResult = 'You are not in love yet.';
            animationController.stop();
          }
          animationController.stop();
        }
        setState(() {});
      });

    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final percentage = animationController.value * 100;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            messageResult,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.redAccent,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto'),
          ),
        ),
        SizedBox(
          height: 1.cm,
        ),
        LiquidCustomProgressIndicator(
          direction: Axis.vertical,
          shapePath: _buildHeartPath(),
          center: Text(
            '${percentage.toStringAsFixed(0)}%',
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          valueColor: const AlwaysStoppedAnimation(Colors.redAccent),
          value: animationController.value,
          backgroundColor: Colors.grey[850],
        ),
        const SizedBox(height: 20),
        Text(
          'Love percentage between ${widget.yourname} and ${widget.hisname}',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.redAccent, fontSize: 18),
        ),
        SizedBox(height: 1.cm),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.share,
              color: Colors.redAccent,
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, ShareResultWidget.routeName);
              },
              child: Text('Share Result'),
            )
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Path _buildHeartPath() {
    return Path()
      ..moveTo(110, 30)
      ..cubicTo(110, 24, 100, 0, 60, 0)
      ..cubicTo(0, 0, 0, 75, 0, 75)
      ..cubicTo(0, 110, 40, 154, 110, 190)
      ..cubicTo(180, 154, 220, 110, 220, 75)
      ..cubicTo(220, 75, 220, 0, 160, 0)
      ..cubicTo(130, 0, 110, 24, 110, 30)
      ..close();
  }
}
