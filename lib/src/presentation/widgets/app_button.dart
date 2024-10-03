import 'package:blott_mobile_assesment/src/core/constants/app_colors.dart';
import 'package:blott_mobile_assesment/src/core/constants/styles.dart';
import 'package:blott_mobile_assesment/src/core/extension/extension.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onTap,
    required this.text,
  });

  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.kcPrimary600,
          borderRadius: BorderRadius.circular(24.radius),
        ),
        child: Center(
          child: Text(
            text,
            style: Styles.regularMd(
              color: AppColors.kcText50,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
