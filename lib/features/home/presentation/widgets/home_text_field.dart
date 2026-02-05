import 'package:flutter/material.dart';
import 'package:onboarding_winter_project/core/resources/app_colors.dart';
import 'package:onboarding_winter_project/core/resources/app_text_styles.dart';

class HomeTextField extends StatelessWidget {
  const HomeTextField({
    super.key,
    required this.hintText,
    this.onIconPressed,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
    this.validator,
    this.onSaved,
    this.controller,
    this.prefixIcon,
    this.initialValue,
    this.textColor = AppColors.blackColor,
    this.autovalidateMode,
    this.suffixIcon,
  });

  final String hintText;
  final void Function()? onIconPressed;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final Widget? prefixIcon, suffixIcon;
  final String? initialValue;
  final Color textColor;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      style: TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      initialValue: initialValue,
      controller: controller,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      textInputAction: textInputAction,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Field can\'t be empty!';
            } else {
              return null;
            }
          },
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.whiteColor,
        hintText: hintText,
        contentPadding: const EdgeInsetsDirectional.only(
          start: 16,
          top: 14,
          bottom: 14,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle: AppTextStyles.grey67Color12Medium,
        enabledBorder: _buildBorder(Colors.transparent),
        focusedBorder: _buildBorder(Colors.transparent),
        errorBorder: _buildBorder(Colors.red),
        focusedErrorBorder: _buildBorder(Colors.red),
      ),
    );
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color),
    );
  }
}
