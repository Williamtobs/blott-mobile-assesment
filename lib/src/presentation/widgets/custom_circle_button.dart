import 'package:blott_mobile_assesment/src/core/constants/app_colors.dart';
import 'package:blott_mobile_assesment/src/core/extension/extension.dart';
import 'package:flutter/material.dart';

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({
    super.key,
    this.isActive = false,
    this.onTap,
  });

  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56.height,
        width: 56.height,
        decoration: BoxDecoration(
          color: isActive ? AppColors.kcPrimary600 : const Color(0xFFB6ADF2),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.8),
              blurRadius: 4.radius,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 24.radius,
          ),
        ),
      ),
    );
  }
}
