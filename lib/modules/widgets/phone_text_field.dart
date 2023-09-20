import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

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
    return InternationalPhoneNumberInput(
      onInputChanged: onInputChanged,
      keyboardType: TextInputType.phone,
      initialValue: phoneNumber,
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
      ),
      hintText: hintText,
      inputDecoration: const InputDecoration(border: UnderlineInputBorder()),
      formatInput: true,
    );
  }
}
