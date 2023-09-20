import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:project_template/modules/widgets/custom_button.dart';
import 'package:project_template/modules/widgets/custom_text.dart';
import 'package:project_template/theme/app_text_theme.dart';

import '../../router/route_name.dart';
import '../widgets/phone_text_field.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  PhoneNumber? phoneNumber;
  PhoneNumber? confirmPhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://www.onlinelogomaker.com/blog/wp-content/uploads/2017/09/fashion-logo-design.jpg',
                  width: 150,
                ),
                CustomText(
                  text:
                      'Start your registration process by entering your mobile number.',
                  textAlign: TextAlign.center,
                  style: AppTextTheme.common.bodySmall,
                ),
                SizedBox(height: 15.h),
                CustomText(
                  text:
                      'Note: A valid mobile number is required to contact future winners, therefore please ensure you enter the correct mobile number.',
                  textAlign: TextAlign.center,
                  style: AppTextTheme.common.bodySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: 'Mobile Number',
                    textAlign: TextAlign.left,
                    style: AppTextTheme.common.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'Remove the leading 0 from the start of your mobile number',
                ),
                SizedBox(height: 5.h),
                PhoneTextFormField(
                  phoneNumber: phoneNumber,
                  hintText: 'Mobile Number',
                  onInputChanged: (PhoneNumber number) {
                    setState(() {
                      phoneNumber = number;
                    });
                  },
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: 'Confirm Mobile Number',
                    textAlign: TextAlign.left,
                    style: AppTextTheme.common.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                PhoneTextFormField(
                  phoneNumber: confirmPhoneNumber,
                  hintText: 'Confirm Mobile Number',
                  onInputChanged: (PhoneNumber number) {
                    setState(() {
                      confirmPhoneNumber = number;
                    });
                  },
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, RouteName.details);
                    }
                  },
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
