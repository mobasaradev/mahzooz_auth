import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:project_template/modules/widgets/custom_text.dart';
import 'package:project_template/theme/app_text_theme.dart';

import '../../widgets/phone_text_field.dart';

class PhoneNumberStep extends StatelessWidget {
  const PhoneNumberStep({
    super.key,
    required this.onInputChanged,
    required this.cOnInputChanged,
    required this.phoneNumber,
    required this.confirmPhoneNumber,
  });
  final ValueChanged<PhoneNumber>? onInputChanged;
  final ValueChanged<PhoneNumber>? cOnInputChanged;
  final PhoneNumber? phoneNumber;
  final PhoneNumber? confirmPhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          onInputChanged: onInputChanged,
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
          onInputChanged: onInputChanged,
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
