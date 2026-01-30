import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onboarding_winter_project/core/resources/app_colors.dart';
import 'package:onboarding_winter_project/core/resources/app_text_styles.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.type = TextInputType.text,
    required this.controller, this.validator,
  });

  final String hint;
  final String icon;
  final bool? isPassword;
  final TextInputType? type;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.isPassword! && isVisible,
      keyboardType: widget.type,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: AppTextStyles.grey67Color12Medium,
        filled: true,
        fillColor: AppColors.whiteF3Color,
        border: getBorder(),
        focusedBorder: getBorder(),
        enabledBorder: getBorder(),
        errorBorder: getBorder(AppColors.redColor),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset(widget.icon),
        ),
        suffixIcon: widget.isPassword == true
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                icon: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.grey62Color,
                ),
              )
            : null,
      ),
    );
  }

  OutlineInputBorder getBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color ?? AppColors.greyA8Color),
    );
  }
}
