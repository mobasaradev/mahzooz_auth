import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_template/modules/sign_up/widgets/phone_step.dart';

import '../widgets/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _activeStepIndex = 0;
  final formKey = GlobalKey<FormState>();
  final numberController = TextEditingController();
  final confirmNumberController = TextEditingController();

  void _onStepContinue() {
    setState(() {
      if (_activeStepIndex < (stepList().length - 1)) {
        _activeStepIndex += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.h),
        child: Stepper(
          elevation: 0,
          type: StepperType.horizontal,
          currentStep: _activeStepIndex,
          onStepContinue: _onStepContinue,
          controlsBuilder: (context, details) => SignUpCustomButton(
            onPressed: details.onStepContinue,
          ),
          steps: stepList(),
        ),
      ),
    );
  }

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text(''),
          content: NumberStep(
            formKey: formKey,
            numberController: numberController,
            confirmNumberController: confirmNumberController,
          ),
        ),
        Step(
          state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title: const Text(''),
          content: const Center(child: Text('Address number')),
        ),
        Step(
          state: _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 2,
          title: const Text(''),
          content: const Center(child: Text('Success number')),
        ),
        Step(
          state: StepState.complete,
          isActive: _activeStepIndex >= 3,
          title: const Text(''),
          content: const Center(child: Text('Success number')),
        ),
      ];
}
