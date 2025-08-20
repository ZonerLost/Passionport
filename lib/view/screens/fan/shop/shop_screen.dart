import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:passion_port/view/screens/fan/shop/shop_product_screen.dart';
import 'package:passion_port/view/screens/fan/shop/shop_profile_screen.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_fonts.dart';
import '../../../../config/constants/app_sizes.dart';
import '../../../../generated/assets.dart';
import '../../../custom/common_image_view_widget.dart';
import '../../../custom/custom_appbar.dart';
import '../../../custom/my_text_widget.dart';
import '../home/comment_bottomsheet.dart';
import '../home/story_widget.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({super.key});

  final RxInt selectedIndex = 0.obs;

  final List<String> categories = [
    "Shoes",
    "Bags",
    "Watches",
    "Clothes",
    "Accessories",
    "Shoes",
    "Bags",
    "Watches",
    "Clothes",
    "Accessories",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          GestureDetector(
            onTap: () {
              //Get.to(()=>ChatScreen());
            },
            child: Badge(
              label: MyText(text: "1", color: kQuaternaryColor),
              largeSize: 10,
              alignment: Alignment.topRight,
              backgroundColor: kPrimaryColor,
              child: CommonImageView(imagePath: Assets.imagesCart, height: 24),
            ),
          ),
          const SizedBox(width: 25),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: AppSizes.VERTICAL,
          child: Column(
            children: [
              StoriesWidget(addStory: false),
              SizedBox(
                height: 25,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  padding: AppSizes.HORIZONTAL,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      final isSelected = selectedIndex.value == index;

                      return GestureDetector(
                        onTap: () => selectedIndex.value = index,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 0,
                          ),
                          decoration: ShapeDecoration(
                            color:
                                isSelected ? kPrimaryColor : kPrimaryLightColor,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1,
                                color: kPrimaryColor,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              categories[index],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color:
                                    isSelected
                                        ? kQuaternaryColor
                                        : kPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: ListView.builder(
                  //padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10, // number of posts
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ), // spacing between posts
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Post header
                          Stack(
                            children: [
                              MyShopCarousel(),
                              Positioned(
                                child: Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() => ShopProfileScreen());
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 6,
                                          ),
                                          decoration: ShapeDecoration(
                                            color: kQuaternaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              CommonImageView(
                                                imagePath: Assets.imagesNike,
                                                height: 32,
                                              ),
                                              const SizedBox(width: 10),
                                              MyText(
                                                text: "Nike",
                                                size: 13,
                                                weight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      CommonImageView(
                                        imagePath: Assets.imagesMore,
                                        height: 32,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 10,
                                bottom: 10,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => ShopProductScreen());
                                  },
                                  child: CommonImageView(
                                    imagePath: Assets.imagesShop1,
                                    height: 35,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 15),

                          /// Action buttons (like, comment, share)
                          Row(
                            spacing: 15,
                            children: [
                              CommonImageView(svgPath: Assets.svgHeart),
                              GestureDetector(
                                onTap: () {
                                  Get.bottomSheet(
                                    const CommentBottomSheet(),
                                    isScrollControlled: true,
                                    isDismissible: true,
                                  );
                                },
                                child: CommonImageView(
                                  svgPath: Assets.svgComment,
                                ),
                              ),
                              CommonImageView(svgPath: Assets.svgShare),
                            ],
                          ),

                          const SizedBox(height: 8),

                          // Post description
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Nike ',
                                  style: TextStyle(
                                    color: kBlack2Color,
                                    fontSize: 14,
                                    fontFamily: AppFonts.poppins,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '50% off on last 100 pairs of AJ 1s. Don’t miss out',
                                  style: TextStyle(
                                    color: kBlack2Color,
                                    fontSize: 13,
                                    fontFamily: AppFonts.poppins,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // const SizedBox(height: 5),

                          // Comment box
                          Row(
                            children: [
                              CommonImageView(
                                imagePath: Assets.imagesProfile,
                                height: 24,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Write a comment....",
                                    hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: kGreyTxColor,
                                      fontFamily: AppFonts.poppins,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              MyText(text: "❤️  👍  🔥"),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyShopCarousel extends StatelessWidget {
  MyShopCarousel({super.key});

  final CarouselSliderController _controller = CarouselSliderController();
  final RxInt _currentIndex = 0.obs;

  final List<String> images = [
    Assets.imagesFeed,
    Assets.imagesFeed,
    Assets.imagesFeed,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items:
              images.map((path) {
                return CommonImageView(
                  imagePath: path,
                  radius: 15,
                  width: double.infinity,
                );
              }).toList(),
          carouselController: _controller,
          options: CarouselOptions(
            height: 320,
            enlargeCenterPage: false,
            autoPlay: false,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              _currentIndex.value = index;
            },
          ),
        ),
        Positioned(
          bottom: 15,
          right: 0,
          left: 0,
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  images.asMap().entries.map((entry) {
                    final isActive = _currentIndex.value == entry.key;
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 10,
                        height: 10,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              isActive ? Colors.orange : Colors.grey.shade300,
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
