import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.hintText,
  });
  final List<String> items;
  final String? value;
  final String hintText;
  final ValueChanged onChanged;

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
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
      child: DropdownButtonFormField<String>(
        value: widget.value,
        onChanged: widget.onChanged,
        items: widget.items
            .map<DropdownMenuItem<String>>(
              (String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ),
            )
            .toList(),
        decoration: InputDecoration(
          hintText: widget.hintText,
          contentPadding: EdgeInsets.only(top: 3, left: 5.h),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: AppColors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
