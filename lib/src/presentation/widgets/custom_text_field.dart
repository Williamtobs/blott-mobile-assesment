import 'package:blott_mobile_assesment/src/core/constants/app_colors.dart';
import 'package:blott_mobile_assesment/src/core/constants/styles.dart';
import 'package:blott_mobile_assesment/src/core/extension/extension.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.onDone,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.hintText,
    this.initialValue,
    this.suffixIcon,
    this.prefixIcon,
    this.prefix,
    this.phoneCode,
    this.errorText,
    this.successText,
    this.labelWidget,
    this.enabled = true,
    this.controller,
    this.textAlign = TextAlign.start,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.maxLength,
    this.hintStyle,
    this.maxLines = 1,
    this.focusNode,
    this.value,
    this.counter,
    this.height,
    this.fillColor,
    this.textCapitalization = TextCapitalization.sentences,
    this.textLength,
    this.currentLength,
    this.removeBorder = false,
    this.padding,
  });

  final ValueChanged<String?>? onDone;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? hintText;
  final String? initialValue;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? prefix;
  final String? phoneCode;
  final String? errorText;
  final String? successText;
  final Widget? labelWidget;
  final bool enabled;
  final TextEditingController? controller;
  final TextAlign textAlign;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;
  final num? maxLength;
  final TextStyle? hintStyle;
  final int maxLines;
  final FocusNode? focusNode;
  final String? value;
  final Widget? counter;
  final double? height;
  final Color? fillColor;
  final TextCapitalization textCapitalization;
  final int? textLength;
  final int? currentLength;
  final bool removeBorder;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ??
            Styles.regularXl(
              color: AppColors.kcText400,
              fontWeight: FontWeight.w400,
            ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefix: prefix,
        filled: fillColor != null,
        contentPadding: EdgeInsets.symmetric(
          horizontal: padding ?? 0,
          vertical: 8.height,
        ),

        //bottom border only
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kcMuted300,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kcMuted300,
          ),
        ),
      ),
      enabled: enabled,
      onFieldSubmitted: onDone,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly,
      maxLength: maxLength?.toInt(),
      maxLines: maxLines,
      focusNode: focusNode,
      initialValue: initialValue,
      textAlign: textAlign,
      style: Styles.regularXl(
        color: const Color(0xFF171717),
        fontWeight: FontWeight.w400,
      ),
      textCapitalization: textCapitalization,
    );
  }
}
