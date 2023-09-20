import 'package:flutter/material.dart';
import 'package:project_template/modules/widgets/custom_pass_field.dart';
import 'package:project_template/modules/widgets/custom_text_field.dart';

import '../../router/route_name.dart';
import '../../theme/app_text_theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final passController = TextEditingController();
  final cPassController = TextEditingController();
  final emailController = TextEditingController();
  String? password;
  String? confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Password',
                  textAlign: TextAlign.left,
                  style: AppTextTheme.common.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 3),
              PassTextField(
                controller: passController,
                hintText: 'Password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
                onSaved: (value) {
                  password = value;
                },
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Confirm Password',
                  textAlign: TextAlign.left,
                  style: AppTextTheme.common.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 3),
              PassTextField(
                controller: cPassController,
                hintText: 'Confirm Password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != passController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                onSaved: (value) {
                  confirmPassword = value;
                },
              ),
              const SizedBox(height: 20.0),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'E-mail',
                  textAlign: TextAlign.left,
                  style: AppTextTheme.common.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 3),
              CustomTextField(
                controller: emailController,
                hintText: 'E-mail',
                keyboardType: TextInputType.emailAddress,
              ),
              CustomButton(onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, RouteName.home);
                }
              }),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
