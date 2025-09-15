import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:passion_port/config/constants/app_fonts.dart';
import 'package:passion_port/config/constants/app_sizes.dart';
import 'package:passion_port/view/custom/my_text_widget.dart';
import 'package:passion_port/view/screens/fan/chat/chat_screen.dart';
import 'package:passion_port/view/screens/fan/home/story_widget.dart';
import 'package:passion_port/view/screens/fan/likes/likes_screen.dart';
import 'package:passion_port/view/screens/fan/shop/brand_post_and_campagin_view/post_view_screen.dart';
import '../../../../config/constants/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../custom/common_image_view_widget.dart';
import '../../../custom/custom_appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';

import '../shop/brand_post_and_campagin_view/campagin_view_screen.dart';
import '../shop/shop_product_screen.dart';
import '../shop/shop_profile_screen.dart';
import '../shop/shop_screen.dart';
import '../userProfile/user_profile_screen.dart';
import 'comment_bottomsheet.dart';




class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          actions: [
            GestureDetector(
              onTap: (){
                Get.to(()=>LikesScreen());
              },
              child: Badge(
                smallSize: 9,
                backgroundColor: kPrimaryColor,
                child: CommonImageView(
                  imagePath: Assets.imagesLike,
                  height: 24,
                ),
              ),
            ),
            SizedBox(width: 15,),
            GestureDetector(
              onTap: (){
                Get.to(()=>ChatScreen());
              },
              child: Badge(
                label: MyText(
                  text: "1",
                  color: kQuaternaryColor,
                ),
                largeSize: 10,
                alignment: Alignment.topRight,
                backgroundColor: kPrimaryColor,
                child: CommonImageView(
                  imagePath: Assets.imagesMessage,
                  height: 24,
                ),
              ),
            ),
            const SizedBox(width: 25),
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      StoriesWidget(),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  pinned: false, // 👈 keeps TabBar fixed on top
                  delegate: _SliverAppBarDelegate(
                     TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.orange,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: TextStyle(fontWeight: FontWeight.w500),
                      tabs: [
                        Tab(text: "Posts"),
                        Tab(text: "Campaigns"),
                      ],
                    ),
                  ),
                ),
              ];
            },

            body: TabBarView(
              children: [
                Padding(
                  padding: AppSizes.DEFAULT,
                  child: ListView.builder(
                    //padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2, // number of posts
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20), // spacing between posts
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Post header
                            Stack(
                              children: [
                                MyCarousel(),
                                Positioned(
                                  child: Padding(
                                    padding: const EdgeInsets.all(14),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            Get.to(()=>UserProfileScreen());
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: ShapeDecoration(
                                              color: kQuaternaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                CommonImageView(
                                                  imagePath: Assets.imagesProfile2,
                                                  height: 32,
                                                ),
                                                const SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    MyText(
                                                      text: "User_name",
                                                      size: 13,
                                                      weight: FontWeight.w500,
                                                    ),
                                                    const SizedBox(height: 5),
                                                    MyText(
                                                      text: "Nike",
                                                      size: 12,
                                                      weight: FontWeight.w400,
                                                      color: kGreyTxColor,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(() => PostViewScreen());
                                          },
                                          child: CommonImageView(
                                            imagePath: Assets.imagesMore,
                                            height: 32,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              spacing: 15,
                              children: [
                                CommonImageView(svgPath: Assets.svgHeart),
                                GestureDetector(
                                    onTap:(){
                                      Get.bottomSheet(
                                        const CommentBottomSheet(),
                                        isScrollControlled: true,
                                        isDismissible: true,
                                      );
                                    },
                                    child: CommonImageView(svgPath: Assets.svgComment)),
                                CommonImageView(svgPath: Assets.svgShare),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'User_name ',
                                    style: TextStyle(
                                      color: kBlack2Color,
                                      fontSize: 14,
                                      fontFamily: AppFonts.poppins,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Best one there is 🔥',
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
                Padding(
                  padding: AppSizes.DEFAULT,
                  child: ListView.builder(
                    //padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2, // number of posts
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20), // spacing between posts
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [


                            Stack(
                              children: [
                                CommonImageView(imagePath: Assets.imagesShoes,),
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
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(() => CampaignViewScreen());
                                          },
                                          child: CommonImageView(
                                            imagePath: Assets.imagesMore,
                                            height: 32,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom:10,
                                  right:10,
                                  left:10,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      color: Colors.white.withValues(alpha: 0.20),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '\$13,675',
                                                style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: 12,
                                                  fontFamily: AppFonts.poppins,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' / \$100,000 Raised',
                                                style: TextStyle(
                                                  color:kQuaternaryColor,
                                                  fontSize: 10,
                                                  fontFamily: AppFonts.poppins,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: SizedBox(
                                            height: 20,
                                            child: LinearProgressIndicator(
                                              borderRadius: BorderRadius.circular(25),
                                              value: 0.6,
                                              backgroundColor: kPrimaryLight3Color,
                                              valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              decoration: ShapeDecoration(
                                color: const Color(0x33FF7A00),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: MyText(
                                text: "Lorem ipsum dolor sit amet consectetur. Dolor amet habitasse tortor nullam ipsum tellus. Est.",
                                size: 13,
                                weight: FontWeight.w400,
                                color: kPrimaryColor,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                MyText(
                                  text: "View Campaign",
                                  size: 14,
                                  weight: FontWeight.w500,
                                  color: kGreyTxColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Container(
                                    width: 6,
                                    height: 6,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFF999999),
                                      shape: OvalBorder(),
                                    ),
                                  ),
                                ),
                                MyText(
                                  text: "Back It",
                                  size: 14,
                                  weight: FontWeight.w500,
                                  color: kPrimaryColor,
                                ),
                              ],
                            )


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





class MyCarousel extends StatelessWidget {
  MyCarousel({super.key});

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
          items: images.map((path) {
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
          bottom:15,
          right:0,
          left:0,
          child:  Obx(
                () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.asMap().entries.map((entry) {
                final isActive = _currentIndex.value == entry.key;
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isActive ? Colors.orange : Colors.grey.shade300,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}





class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white, // TabBar background
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
