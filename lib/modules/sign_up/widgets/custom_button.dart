import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';
import '../../widgets/custom_text.dart';

class SignUpCustomButton extends StatelessWidget {
  const SignUpCustomButton({super.key, required this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.black,
              backgroundColor: AppColors.grey.withOpacity(0.3),
              elevation: 0,
              fixedSize: Size(150.w, 45.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: CustomText(
              text: 'Next',
              textAlign: TextAlign.center,
              style: AppTextTheme.common.bodyMedium!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
