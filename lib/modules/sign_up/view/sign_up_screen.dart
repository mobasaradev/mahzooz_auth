import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:project_template/modules/sign_up/steps/details_step.dart';
import 'package:project_template/modules/sign_up/steps/last_step.dart';
import 'package:project_template/modules/sign_up/steps/password_step.dart';
import 'package:project_template/modules/sign_up/steps/phone_step.dart';

import '../../widgets/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int _activeStepIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  PhoneNumber? phoneNumber;
  PhoneNumber? confirmPhoneNumber;

  void _onStepContinue() {
    if (_formKey.currentState!.validate()) {
      print('Phone Number: ${phoneNumber.toString()}');
    }
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
          // onStepContinue: _onStepContinue,
          controlsBuilder: (context, details) => SignUpCustomButton(
            onPressed: _onStepContinue,
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
          content: Form(
            key: _formKey,
            child: PhoneNumberStep(
              onInputChanged: (PhoneNumber number) {
                setState(() {
                  phoneNumber = number;
                });
              },
              cOnInputChanged: (PhoneNumber number) {
                setState(() {
                  confirmPhoneNumber = number;
                });
              },
              phoneNumber: phoneNumber,
              confirmPhoneNumber: confirmPhoneNumber,
            ),
          ),
        ),
        Step(
          state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title: const Text(''),
          content: const DetailsStep(),
        ),
        Step(
          state: _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 2,
          title: const Text(''),
          content: const PasswordStep(),
        ),
        Step(
          state: StepState.complete,
          isActive: _activeStepIndex >= 3,
          title: const Text(''),
          content: const LastStep(),
        ),
      ];
}
