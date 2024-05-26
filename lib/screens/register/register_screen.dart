import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ontrend/controller/register/register_controller.dart';
import 'package:ontrend/core/strings.dart';
import 'package:ontrend/core/theme/app_color.dart';
import 'package:ontrend/core/theme/app_text_style.dart';
import 'package:ontrend/utils/validator.dart';
import 'package:ontrend/widgets/button_widget.dart';
import 'package:ontrend/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 7.h,
            ),
            const Icon(
              Icons.arrow_back_ios_outlined,
            ),
            SizedBox(
              height: 3.h,
            ),
            Center(
              child: Text(
                register,
                style: AppTextStyle.bold.copyWith(
                  color: AppColor.blackColor,
                  fontSize: 26,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Center(
              child: Text(
                registerText,
                style: AppTextStyle.medium.copyWith(
                  color: AppColor.blackColor,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            CustomTextField(
              hintText: fName,
              controller: controller.fNameController,
              keyboardType: null,
            ),
            SizedBox(
              height: 3.h,
            ),
            CustomTextField(
              hintText: lName,
              controller: controller.lNameController,
              validator: (String? value) =>
                  Validators.validatePassword(value!.trim()),
              keyboardType: null,
            ),
            SizedBox(
              height: 3.h,
            ),
            CustomTextField(
              hintText: email,
              controller: controller.emailController,
              validator: (String? value) =>
                  Validators.validateEmail(value!.trim()),
              keyboardType: null,
            ),
            SizedBox(
              height: 3.h,
            ),
            CustomTextField(
              hintText: phone,
              prifix: true,
              controller: controller.phoneController,
              maxLength: 6,
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 3.h,
            ),
            CustomTextField(
              hintText: createPassword,
              controller: controller.createPasswordController,
              keyboardType: null,
            ),
            SizedBox(
              height: 5.h,
            ),
            ButtonWidget(
              text: createAccount,
              onTap: () {},
              height: 7.h,
              borderRadius: 10,
              bColor: AppColor.orangeColor,
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  alreadyAccount,
                  style: AppTextStyle.regular
                      .copyWith(color: AppColor.blackColor, fontSize: 14),
                ),
                SizedBox(
                  width: 1.w,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    signIn,
                    style: AppTextStyle.semiBold.copyWith(
                        color: AppColor.blueColor.withOpacity(0.4),
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
