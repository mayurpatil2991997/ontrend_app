import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ontrend/controller/home/home_controller.dart';
import 'package:ontrend/core/theme/app_color.dart';
import 'package:ontrend/core/theme/app_text_style.dart';
import 'package:ontrend/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 4.w
        ),
        child: Column(
          children: [
            SizedBox(
              height: 6.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 30,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Janub Ad Dahariz",
                      style: AppTextStyle.semiBold.copyWith(
                          color: AppColor.blackColor,
                          fontSize: 12
                      ),
                    ),
                    Text(
                      "Salalah, oman",
                      style: AppTextStyle.medium.copyWith(
                          color: AppColor.blueColor,
                          fontSize: 12
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                likeWidget(),
                SizedBox(
                  width: 3.w,
                ),
                notificationWidget()
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextField(
              hintText: "Search",
              controller: controller.searchController,
              keyboardType: null,
              suffix: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget notificationWidget() {
    return Container(
      height: 8.h,
      width: 10.w,
      decoration: const BoxDecoration(
        color: AppColor.whiteColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],//
      ),
      child: const Icon(
        Icons.notifications_none,
        color: AppColor.blackColor,
      ),
    );
  }
  Widget likeWidget() {
    return Container(
      height: 8.h,
      width: 10.w,
      decoration: const BoxDecoration(
        color: AppColor.whiteColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],//
      ),
      child: const Icon(
        Icons.favorite_outline_outlined,
        color: AppColor.blackColor,
      ),
    );
  }
}
