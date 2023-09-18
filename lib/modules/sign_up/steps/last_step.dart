import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:project_template/theme/app_colors.dart';

class LastStep extends StatefulWidget {
  const LastStep({super.key});

  @override
  State<LastStep> createState() => _LastStepState();
}

class _LastStepState extends State<LastStep> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 25.0, color: AppColors.primary),
        child: Center(
          child: AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText(
                'Hello Buddy',
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                speed: const Duration(milliseconds: 300),
              ),
            ],
            repeatForever: true,
            isRepeatingAnimation: true,
          ),
        ),
      ),
    );
  }
}
