import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:passion_port/config/constants/app_fonts.dart';
import 'package:passion_port/config/constants/app_sizes.dart';
import 'package:passion_port/view/custom/common_image_view_widget.dart';
import 'package:passion_port/view/custom/custom_appbar.dart';
import 'package:passion_port/view/custom/my_button.dart';
import 'package:passion_port/view/custom/my_text_widget.dart';
import 'package:passion_port/view/screens/fan/profile/edit_profile_screen.dart';
import 'package:passion_port/view/screens/fan/profile/setting_screen.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../generated/assets.dart';
import 'general_setting_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

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
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(
          actions: [
            GestureDetector(
              onTap: (){
                Get.to(()=>SettingScreen());
              },
                child: CommonImageView(svgPath: Assets.svgMore)),
            const SizedBox(width: 15),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Padding(
                  padding: AppSizes.DEFAULT,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 👤 Profile info
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonImageView(
                            imagePath: Assets.imagesProfile,
                            height: 80,
                          ),
                          _buildCounter("100", "Posts"),
                          _buildCounter("10k", "Followers"),
                          _buildCounter("500", "Following"),
                        ],
                      ),
                      const SizedBox(height: 20),
                      MyText(
                          text: "Jhon Doe",
                          size: 17,
                          weight: FontWeight.w500),
                      const SizedBox(height: 5),
                      MyText(
                        text:
                        "Lorem ipsum dolor sit amet consectetur.\nRutrum arcu faucibus sapien arcu. Fringilla.",
                        size: 15,
                        weight: FontWeight.w400,
                        color: kGreyTxColor,
                        fontFamily: AppFonts.poppins,
                      ),
                      const SizedBox(height: 20),
                      MyButton(
                        height: 40,
                        onTap: () {
                          Get.to(()=>EditProfileScreen());
                        },
                        buttonText: "Edit Profile",
                        backgroundColor: kCBGColor,
                        outlineColor: kWhiteLightColor,
                        fontColor: kBlack2Color,
                      ),

                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: _TabBarDelegate(
                  const TabBar(
                    padding: EdgeInsets.only(bottom: 15),
                    labelColor: kBlack2Color,
                    dividerColor: kWhiteLightColor,
                    indicatorColor:kPrimaryColor,
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
                //pinned: true,
              ),
            ];
          },

          body: TabBarView(
            children: [
              _buildGrid(),
              _buildGrid(),
              _buildGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCounter(String count, String label) {
    return Column(
      children: [
        MyText(text: count, size: 15, weight: FontWeight.w400, color: kBlack2Color),
        const SizedBox(height: 5),
        MyText(text: label, size: 13, weight: FontWeight.w500, color: kBlack2Color),
      ],
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return CommonImageView(imagePath: images[index]);
      },
    );
  }
}

/// ✅ Custom delegate so TabBar stays sticky while scrolling
class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Colors.white, child: tabBar);
  }

  @override
  bool shouldRebuild(_TabBarDelegate oldDelegate) {
    return false;
  }
}

