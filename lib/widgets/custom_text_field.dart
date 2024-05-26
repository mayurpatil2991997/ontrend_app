import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ontrend/core/theme/app_color.dart';
import 'package:ontrend/core/theme/app_text_style.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  // final String label;
  final String? hintText, counterText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  String? Function(String?)? validator;
  Widget? widget;
  GestureTapCallback? onTap, onSufixIconClick;
  FocusNode? focusNode;
  bool obscureText = false,
      showCursor = true,
      readOnly = true,
      autoFocus = false;
  TextStyle? style;
  int? maxLength;
  bool enabled;
  final InputDecoration? decoration;
  Widget? suFixIcon;
  final TextInputAction? textInputAction;
  // final FormFieldValidator<String?>? validator;

  CustomTextField(
      {Key? key,
      // required this.label,
      this.hintText,
      required this.controller,
      required this.keyboardType,
      // this.validator,
      this.onTap,
      this.focusNode,
      this.showCursor = false,
      this.obscureText = false,
      this.readOnly = false,
      this.autoFocus = false,
      this.decoration,
      this.style,
      this.counterText,
      this.maxLength,
      this.enabled = true,
      this.suFixIcon,
      this.onSufixIconClick,
      this.textInputAction,
      this.validator,
      this.widget})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 6.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0), // Match border radius with Material widget
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],// Background color for the Container
        ),
        child: TextFormField(
          style: AppTextStyle.regular,
          keyboardType: keyboardType,
          controller: controller,
          validator: validator,
          maxLength: maxLength,
          showCursor: true,
          enabled: enabled,
          readOnly: readOnly,
          autofocus: autoFocus,
          onTap: onTap,
          focusNode: FocusNode(),
          textInputAction: textInputAction,
          cursorColor: AppColor.primaryColor,

          decoration: decoration ??
              InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: hintText,
                  hintStyle: AppTextStyle.regular.copyWith(
                      color: AppColor.blackColor,
                      fontSize: 14
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: AppColor.greyColor,
                    ),
                    borderRadius: BorderRadius.circular(14)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: AppColor.greyColor,
                    ),
                      borderRadius: BorderRadius.circular(14)
                  ),
                  isDense: true,

                  focusColor: AppColor.primaryColor,
                  counterText: counterText ?? "",
                  suffixIcon: suFixIcon),
        ),
      ),
    );
  }
}
