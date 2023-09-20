import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';

class PassTextField extends StatefulWidget {
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
  State<PassTextField> createState() => _PassTextFieldState();
}

class _PassTextFieldState extends State<PassTextField> {
  bool _isPasswordVisible = false;
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
        controller: widget.controller,
        keyboardType: TextInputType.text,
        obscureText: !_isPasswordVisible,
        decoration: InputDecoration(
          hintText: widget.hintText,
          contentPadding: EdgeInsets.only(top: 3, left: 10.h),
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: AppColors.grey,
            ),
          ),
        ),
        validator: widget.validator,
        onSaved: widget.onSaved,
      ),
    );
  }
}
