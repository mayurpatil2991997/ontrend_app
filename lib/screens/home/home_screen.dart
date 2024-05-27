import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ontrend/constants/app_const_assets.dart';
import 'package:ontrend/controller/home/home_controller.dart';
import 'package:ontrend/core/theme/app_color.dart';
import 'package:ontrend/core/theme/app_text_style.dart';
import 'package:ontrend/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.put(HomeController());
  final PageController _pageController = PageController();
  final List<String> _images = [
    'assets/svg/slider2.jpeg',
    'assets/svg/slider4.jpeg',
    'assets/svg/slider2.jpeg',

  ];
  final List<Map<String, String>> items = [
    {'image': 'assets/svg/pizza.jpeg', 'title': 'Pizza'},
    {'image': 'assets/svg/burger.jpeg', 'title': 'Burger'},
    {'image': 'assets/svg/pizza.jpeg', 'title': 'Pizza'},
    {'image': 'assets/svg/pizza.jpeg', 'title': 'Pizza'},
    {'image': 'assets/svg/burger.jpeg', 'title': 'Burger'},
    {'image': 'assets/svg/pizza.jpeg', 'title': 'Pizza'},
    {'image': 'assets/svg/burger.jpeg', 'title': 'Burger'},
    {'image': 'assets/svg/pizza.jpeg', 'title': 'Pizza'},
    // Add more items as needed
  ];

  final List<Map<String, String>> itemsOffer = [
    {'image': 'assets/images/pizza.jpg', 'title': 'Dominos pizza',},
    {'image': 'assets/images/burger.jpg', 'title': 'Honey chilli potato'},
    {'image': 'assets/images/pizza.jpg', 'title': 'Mix pastas'},
    {'image': 'assets/images/burger.jpg', 'title': 'Chards burgers'},

    // Add more items as needed
  ];
  final List<Map<String, String>> itemsTop = [
    {
      'image': 'assets/images/pizza.jpg',
      'title': 'Macdonals',
    },
    {'image': 'assets/images/burger.jpg', 'title': 'BurgerKing '},
    {'image': 'assets/images/pizza.jpg', 'title': 'Zomato'},
    {'image': 'assets/images/burger.jpg', 'title': 'Macdonals '},

    // Add more items as needed
  ];
  var size,height,width;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 4.w
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 15.h,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      _images[index],
                      fit: BoxFit.cover,
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                    );
                  },
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: _images.length,
                    effect: const WormEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: Colors.blue,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "Categories",
                style: AppTextStyle.semiBold.copyWith(
                    color: AppColor.blackColor,
                    fontSize: 14
                ),
              ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],//
              ),
              child: SizedBox(
                height: 25.h,
                child: GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // Number of columns
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 15.0,
                    childAspectRatio: 0.90, // Adjust as needed
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return GridItem(
                      image: items[index]['image']!,
                      title: items[index]['title']!,
                    );
                  },
                ),
              ),
            ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 2.w
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Offers",
                      style: AppTextStyle.semiBold.copyWith(
                          color: AppColor.blackColor,
                          fontSize: 14
                      ),
                    ),
                    Text(
                      "View All",
                      style: AppTextStyle.semiBold.copyWith(
                          color: AppColor.blackColor,
                          fontSize: 14
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                height: 45.h,
                child: GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 6.0,
                    mainAxisSpacing: 6.0,
                    childAspectRatio: 2/2, // Adjust as needed
                  ),
                  itemCount: itemsOffer.length,
                  itemBuilder: (context, index) {
                    return GridItemOffer(
                      image: items[index]['image']!,
                      title: items[index]['title']!,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Top rated restaurant near oou",
                style: AppTextStyle.semiBold.copyWith(
                    color: AppColor.blackColor,
                    fontSize: 14
                ),
              ),
              SizedBox(
                height: 30.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: itemsTop.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  items[index]['image']!,
                                  fit: BoxFit.cover,
                                  height: 200,
                                  width: 150,
                                ),
                              ),
                              Positioned(
                                bottom: 0.5,
                                left: 0.0,
                                right: 0.0,
                                top: 130,
                                child: Container(
                                  color: Colors.black54,

                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          items[index]['title']!,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w700),
                                          textAlign: TextAlign.center,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "40-45 min"!,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.w400),
                                              textAlign: TextAlign.center,
                                            ),
                                            Container(
                                              decoration:BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius: BorderRadius.circular(2)
                                              ),
                                              child: const Row(
                                                children: [
                                                  Text(" 4.5 ",
                                                    style: TextStyle(color: Colors.white,fontSize: 12),
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                    size: 15,
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 2.h
              ),
              Text(
                "Restaurants to Explore (1288 Founds)",
                style: AppTextStyle.semiBold.copyWith(
                  color: AppColor.blackColor,
                  fontSize: 14
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 4,
                shrinkWrap: true,
                padding: const EdgeInsets.all(00),
                itemBuilder: (BuildContext context, int index) {
                  return exploreWidget();
                }
            ),
            ],
          ),
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
  Widget exploreWidget() {
    return Container(
      width: width,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: AppColor.whiteColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 4.0,
            ),
          ],//
          borderRadius: BorderRadius.circular(14)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            height: 20.h,
            AppAssets.food,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 4.w
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Domino's Pizza",
                  style: AppTextStyle.semiBold.copyWith(
                      fontSize: 12,
                      color: AppColor.blackColor
                  ),
                ),
                Container(
                  height: 3.h,
                  width: 14.w,
                  decoration: BoxDecoration(
                      color: AppColor.greenColor,
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "4.2",
                        style: AppTextStyle.medium.copyWith(
                            color: AppColor.whiteColor,
                            fontSize: 12
                        ),
                      ),
                      SizedBox(
                        width: 0.5.w,
                      ),
                      const Icon(
                        Icons.star,
                        color: AppColor.whiteColor,
                        size: 16,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 4.w
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pizza,Pasta,Desserts",
                  style: AppTextStyle.medium.copyWith(
                      fontSize: 12,
                      color: AppColor.blackColor.withOpacity(0.5)
                  ),
                ),
                const Spacer(),
                Container(
                  height: 1.h,
                  width: 1.w,
                  decoration: const BoxDecoration(
                      color: AppColor.blackColor,
                      shape: BoxShape.circle
                  ),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Text(
                  "OMR 27 for one",
                  style: AppTextStyle.medium.copyWith(
                      fontSize: 12,
                      color: AppColor.blackColor.withOpacity(0.5)
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 4.w
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.timelapse,
                  color: AppColor.blueColor,
                  size: 16,
                ),
                SizedBox(
                  width: 1.w,
                ),
                Text(
                  "40-45 min",
                  style: AppTextStyle.medium.copyWith(
                      fontSize: 12,
                      color: AppColor.blackColor.withOpacity(0.5)
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Container(
                  height: 1.h,
                  width: 1.w,
                  decoration: const BoxDecoration(
                      color: AppColor.blackColor,
                      shape: BoxShape.circle
                  ),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Text(
                  "6.8 km",
                  style: AppTextStyle.medium.copyWith(
                      fontSize: 12,
                      color: AppColor.blackColor.withOpacity(0.5)
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 1.w,
                ),
                Text(
                  "Salalah",
                  style: AppTextStyle.semiBold.copyWith(
                      fontSize: 12,
                      color: AppColor.blackColor.withOpacity(0.5)
                  ),
                ),
                const Icon(
                  Icons.location_pin,
                  color: AppColor.orangeColor,
                  size: 20,
                )
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }
}
class GridItem extends StatelessWidget {
  final String image;
  final String title;

  GridItem({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ClipOval(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              height: 18,
              width: 65,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          title,
          style: const TextStyle(fontSize: 13.0),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
class GridItemOffer extends StatelessWidget {
  final String image;
  final String title;

  GridItemOffer({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          top: 11.h,

          child: Container(
            color: Colors.black54,
            // padding: const EdgeInsets.all(4.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "Starting from",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600
                    ),
                    textAlign: TextAlign.center,
                  ),
                  RichText(
                    text: TextSpan(
                      //  text: 'This item costs ',
                      children: <TextSpan>[
                        const TextSpan(
                          text:  "OMR 20 ",
                          style:  TextStyle(
                              color: Colors.green,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        new TextSpan(
                            text: " OMR 70",
                            style: TextStyle(
                                decoration:  TextDecoration.lineThrough,

                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600
                            )
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
