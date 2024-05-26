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
  double? width;
  bool obscureText = false,
      showCursor = true,
      readOnly = true,
      autoFocus = false;
  TextStyle? style;
  int? maxLength;
  bool enabled;
  final InputDecoration? decoration;
  Widget? suFixIcon;
  bool? prifix;
  bool? suffix;
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
      this.width,
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
      this.prifix = false,
      this.suffix = false,
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
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0), // Match border radius with Material widget
          color: Colors.white,
          boxShadow: [
            const BoxShadow(
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
                      color: AppColor.blackColor.withOpacity(0.5),
                      fontSize: 16
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
                    prefixIcon: prifix == true ? Container(
                      padding: EdgeInsets.only(left: 3.w, right: 8.w), // Adjust padding to fit the hint text
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "+968",
                            style: AppTextStyle.regular.copyWith(
                              color: AppColor.blackColor.withOpacity(0.5),
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            size: 24,
                            color: AppColor.blueColor.withOpacity(0.4),
                          ),
                          Container(
                            height: 7.h,
                            child: const VerticalDivider(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ) : null,

                  focusColor: AppColor.primaryColor,
                  counterText: counterText ?? "",
                  suffixIcon: suffix == true ? Container(
                    padding: EdgeInsets.only(left: 2.w, right: 4.w), // Adjust padding to fit the hint text
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 4.h,
                          child: const VerticalDivider(
                            color: Colors.grey,
                          ),
                        ),
                        const Icon(
                          Icons.multitrack_audio_rounded,
                          size: 24,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ) : null,),
        ),
      ),
    );
  }
}
