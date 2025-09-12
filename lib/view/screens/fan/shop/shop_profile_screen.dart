import 'package:flutter/material.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_fonts.dart';
import '../../../../config/constants/app_sizes.dart';
import '../../../../generated/assets.dart';
import '../../../custom/common_image_view_widget.dart';
import '../../../custom/custom_appbar.dart';
import '../../../custom/my_button.dart';
import '../../../custom/my_text_widget.dart';

class ShopProfileScreen extends StatelessWidget {
  ShopProfileScreen({super.key});

  final List<String> images = [
    Assets.imagesP1,
    Assets.imagesP2,
    Assets.imagesP3,
    Assets.imagesP4,
    Assets.imagesP5,
    Assets.imagesP6,
    Assets.imagesP7,
    Assets.imagesP8,
    Assets.imagesP9,
    Assets.imagesP1,
    Assets.imagesP2,
    Assets.imagesP3,
    Assets.imagesP4,
    Assets.imagesP5,
    Assets.imagesP6,
    Assets.imagesP7,
    Assets.imagesP8,
    Assets.imagesP9,
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Changed to 3 for Posts, Campaigns, Tags
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar2(
          title: "Nike_official",
          actions: [
            CommonImageView(svgPath: Assets.svgMore),
            SizedBox(width: 15),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    // JUST DO IT Banner Image
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CommonImageView(
                          imagePath: Assets.imagesJdit,
                          height: 120,
                        ),
                        Positioned(
                          bottom: 0, // stick at the bottom
                          left: 0,
                          right: 0, // expand full width
                          child: Container(
                            height: 10, // adjust thickness
                            decoration: BoxDecoration(
                              color: kQuaternaryColor,
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(15), // rounded top corners
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // White container for profile info
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.vertical(
                          top: Radius.circular(15),
                        ),
                      ),
                      padding: AppSizes.DEFAULT,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CommonImageView(
                                imagePath: Assets.imagesNike,
                                height: 50,
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      text: "Nike",
                                      size: 18,
                                      weight: FontWeight.w600,
                                      color: kBlack2Color,
                                    ),
                                    MyText(
                                      text: "@nike_official",
                                      size: 14,
                                      weight: FontWeight.w400,
                                      color: kGreyTxColor,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 88,
                                height: 40,
                                child: MyBorderButton(
                                  textColor: kBlack2Color,
                                  buttonText: "Edit Profile",
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 15),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  decoration: ShapeDecoration(
                                    color: kPrimaryLight2Color,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      MyText(
                                        text: "100",
                                        size: 15,
                                        weight: FontWeight.w400,
                                        color: kPrimaryColor,
                                      ),
                                      SizedBox(height: 5),
                                      MyText(
                                        text: "Posts",
                                        size: 13,
                                        weight: FontWeight.w600,
                                        color: kPrimaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  decoration: ShapeDecoration(
                                    color: kPrimaryLight2Color,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      MyText(
                                        text: "10k",
                                        size: 15,
                                        weight: FontWeight.w400,
                                        color: kPrimaryColor,
                                      ),
                                      SizedBox(height: 5),
                                      MyText(
                                        text: "Followers",
                                        size: 13,
                                        weight: FontWeight.w600,
                                        color: kPrimaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  decoration: ShapeDecoration(
                                    color: kPrimaryLight2Color,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      MyText(
                                        text: "500",
                                        size: 15,
                                        weight: FontWeight.w400,
                                        color: kPrimaryColor,
                                      ),
                                      SizedBox(height: 5),
                                      MyText(
                                        text: "Following",
                                        size: 13,
                                        weight: FontWeight.w600,
                                        color: kPrimaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),
                          MyText(
                            text:
                                "Lorem ipsum dolor sit amet consectetur.\nRutrum arcu faucibus sapien arcu. Fringilla.",
                            size: 15,
                            weight: FontWeight.w400,
                            color: kGreyTxColor,
                            fontFamily: AppFonts.poppins,
                          ),
                          const SizedBox(height: 7),
                          MyText(
                            text: "https://nike.com/",
                            size: 14,
                            weight: FontWeight.w400,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Tab bar
              SliverPersistentHeader(
                delegate: _TabBarDelegate(
                  TabBar(
                    padding: EdgeInsets.only(bottom: 15),
                    labelColor: kBlack2Color,
                    dividerColor: kWhiteLightColor,
                    indicatorColor: kPrimaryColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w500
                    ),
                    tabs: [
                      Tab(text: "Posts"),
                      Tab(text: "Campaigns"),
                      Tab(text: "Tags"),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [_buildGrid(), _buildGrid(), _buildGrid()],
          ),
        ),
      ),
    );
  }

  Widget _buildGrid() {
    return Container(
      color: Colors.white,
      child: GridView.builder(
        padding: EdgeInsets.all(1),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return CommonImageView(imagePath: images[index]);
        },
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: Colors.white, child: tabBar);
  }

  @override
  bool shouldRebuild(_TabBarDelegate oldDelegate) {
    return false;
  }
}
