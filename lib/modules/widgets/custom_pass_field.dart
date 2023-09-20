import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';

class PassTextField extends StatelessWidget {
  const PassTextField({
    super.key,
    this.controller,
    this.hintText,
    this.validator,
    this.onSaved,
  });
  final TextEditingController? controller;
  final String? hintText;

  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

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
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.only(top: 3, left: 10.h),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: AppColors.grey,
            ),
          ),
        ),
        obscureText: true,
        validator: validator,
        // (value) {
        //   if (value == null || value.isEmpty) {
        //     return 'Please enter a password';
        //   }
        //   return null;
        // },
        onSaved: onSaved,
        // (value) {
        //   _password = value;
        // },
      ),
    );
  }
}
