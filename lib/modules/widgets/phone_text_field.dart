import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../theme/app_colors.dart';

class PhoneTextFormField extends StatelessWidget {
  const PhoneTextFormField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: IntlPhoneField(
        initialCountryCode: 'UAE',
        controller: controller,
        showCountryFlag: true,
        dropdownIconPosition: IconPosition.trailing,
        keyboardType: TextInputType.number,
        disableLengthCheck: true,
        flagsButtonMargin: EdgeInsets.only(left: 10.w),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(top: 3),
          prefixText: ' ',
          prefixIconConstraints: BoxConstraints(
            maxHeight: 54,
            minWidth: 60,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: AppColors.grey,
            ),
          ),
          hintText: 'Mobile Number',
        ),
        onChanged: (phone) {
          phone.completeNumber;
          phone.countryCode;
        },
        validator: (value) {
          if (value == null || value.number.isEmpty) {
            return 'Please enter a phone number.';
          }

          return null;
        },
      ),
    );
  }
}
