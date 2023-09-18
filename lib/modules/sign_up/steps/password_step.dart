import 'package:flutter/material.dart';
import 'package:project_template/modules/widgets/custom_text.dart';
import 'package:project_template/theme/app_colors.dart';
import 'package:project_template/theme/app_text_theme.dart';

class PasswordStep extends StatelessWidget {
  const PasswordStep({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String password = '';
    String confirmPassword = '';
    String email = '';
    return Form(
      key: formKey,
      child: Column(
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
          Container(
            height: 54,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: AppColors.grey),
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Password',
                border: InputBorder.none,
              ),
              obscureText: true,
              validator: (value) {
                if (value == '') {
                  return 'Please enter a password';
                }
                return null;
              },
              onSaved: (value) {
                password = value!;
              },
            ),
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
          Container(
            height: 54,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: AppColors.grey),
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Confirm Password',
                border: InputBorder.none,
              ),
              obscureText: true,
              validator: (value) {
                if (value == '') {
                  return 'Please confirm your password';
                }
                if (value != password) {
                  return 'Passwords do not match';
                }
                return null;
              },
              onSaved: (value) {
                confirmPassword = value!;
              },
            ),
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
          Container(
            height: 54,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: AppColors.grey),
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email',
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value == '' || !value!.contains('@')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              onSaved: (value) {
                email = value!;
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
