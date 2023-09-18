import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../theme/app_colors.dart';

class PhoneTextFormField extends StatelessWidget {
  const PhoneTextFormField({
    super.key,
    required this.phoneNumber,
    required this.hintText,
    required this.onInputChanged,
  });
  final ValueChanged<PhoneNumber>? onInputChanged;
  final PhoneNumber? phoneNumber;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: InternationalPhoneNumberInput(
        onInputChanged: onInputChanged,
        keyboardType: TextInputType.phone,
        initialValue: phoneNumber,
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        ),
        hintText: hintText,
        inputDecoration: const InputDecoration(border: InputBorder.none),
        formatInput: true,
      ),
      // child: IntlPhoneField(
      //   initialCountryCode: 'UAE',
      //   controller: controller,
      //   showCountryFlag: true,
      //   dropdownIconPosition: IconPosition.trailing,
      //   keyboardType: TextInputType.number,
      //   disableLengthCheck: true,
      //   flagsButtonMargin: EdgeInsets.only(left: 10.w),
      //   decoration: const InputDecoration(
      //     contentPadding: EdgeInsets.only(top: 3),
      //     prefixText: ' ',
      //     prefixIconConstraints: BoxConstraints(
      //       maxHeight: 54,
      //       minWidth: 60,
      //     ),
      //     border: OutlineInputBorder(
      //       borderSide: BorderSide(
      //         width: 1,
      //         color: AppColors.grey,
      //       ),
      //     ),
      //     hintText: 'Mobile Number',
      //   ),
      //   onChanged: (phone) {
      //     phone.completeNumber;
      //     phone.countryCode;
      //   },
      //   validator: (value) {
      //     if (value == null || value.number.isEmpty) {
      //       return 'Please enter a phone number.';
      //     }

      //     return null;
      //   },
      // ),
    );
  }
}
