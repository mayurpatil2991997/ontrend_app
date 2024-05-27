import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ontrend/controller/register/register_controller.dart';
import 'package:ontrend/core/strings.dart';
import 'package:ontrend/core/theme/app_color.dart';
import 'package:ontrend/core/theme/app_text_style.dart';
import 'package:ontrend/screens/login/login_screen.dart';
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
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
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
              Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        hintText: fName,
                        controller: controller.fNameController,
                        validator: (String? value) => Validators.validateText(value!.trim(),"First Name"),
                        keyboardType: null,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      CustomTextField(
                        hintText: lName,
                        controller: controller.lNameController,
                        validator: (String? value) => Validators.validateText(value!.trim(),"Last Name"),
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
                        validator: (String? value) => Validators.validateMobile(value!.trim()),
                        maxLength: 6,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      CustomTextField(
                        hintText: createPassword,
                        controller: controller.createPasswordController,
                        validator: (String? value) => Validators.validatePassword(value!.trim()),
                        keyboardType: null,
                      ),
                    ],
                  )),
              SizedBox(
                height: 5.h,
              ),
              ButtonWidget(
                text: createAccount,
                onTap: () async {
                  if (controller.formKey.currentState!.validate()) {
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                        email: controller.emailController.value.text,
                        password:
                            controller.createPasswordController.value.text,
                      );
                      if (newUser != null) {
                        Get.to(() => const LoginScreen());
                      }
                    } catch (e) {
                      print(e);
                    }
                  }
                },
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
                    onTap: () {
                      Get.to(() => const LoginScreen());
                    },
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
      ),
    );
  }
}
