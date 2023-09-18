import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.onTap,
  });
  final TextEditingController? controller;
  final String? hintText;
  final GestureTapCallback? onTap;

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
        onTap: onTap,
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a valid value.';
          }

          return null;
        },
      ),
    );
  }
}
