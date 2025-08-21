import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:passion_port/config/constants/app_fonts.dart';
import 'package:passion_port/config/constants/app_sizes.dart';
import 'package:passion_port/view/screens/brand/brand_home/stats_widget.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../custom/common_image_view_widget.dart';
import '../../../custom/custom_appbar.dart';
import '../../../custom/my_text_widget.dart';
import '../../fan/likes/likes_screen.dart';
import '../brand_chat/brand_chat_screen.dart';
import 'chart_screen.dart';

class BrandHomeScreen extends StatelessWidget {
  BrandHomeScreen({super.key});
  final List<Map<String, String>> campaigns = [
    {"title": "Active Campaigns", "count": "100"},
    {"title": "Campaign Promoters", "count": "10,000"},
    {"title": "Total Revenue", "count": "\$1,000,000"},
    {"title": "Post Views", "count": "1000"},
  ];

  final RxInt selectedIndex = 0.obs; // 0 = Fans, 1 = Products, 2 = Campaigns


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => LikesScreen());
            },
            child: Badge(
              smallSize: 9,
              backgroundColor: kPrimaryColor,
              child: CommonImageView(imagePath: Assets.imagesLike, height: 24),
            ),
          ),
          SizedBox(width: 15),
          GestureDetector(
            onTap: () {
              Get.to(()=>BrandChatScreen());
            },
            child: Badge(
              label: MyText(text: "1", color: kQuaternaryColor),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.4,
                ),
                itemCount: campaigns.length,
                itemBuilder: (context, index) {
                  final item = campaigns[index];
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: [
                        BoxShadow(
                          color: const Color(0x16000000),
                          blurRadius: 20,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: item["title"] ?? "",
                          size: 12,
                          weight: FontWeight.w400,
                          color: kGreyTxColor,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            MyText(
                              text: item["count"] ?? "",
                              size: 22,
                              weight: FontWeight.w600,
                              color: kPrimaryColor,
                            ),
                            if (index == 3)
                              MyText(
                                text: " per min",
                                size: 12,
                                weight: FontWeight.w400,
                                color: kGreyTxColor,
                              ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 15),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x16000000),
                      blurRadius: 20,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    buildSelectableTabs(),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        MyText(
                          text: "Number of Fans",
                          size: 12,
                          weight: FontWeight.w600,
                        ),
                        SizedBox(width: 20),
                        MyText(
                          text: "5186590",
                          size: 17,
                          weight: FontWeight.w700,
                          color: kPrimaryColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    UserAnalyticsDashboard(),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x16000000),
                      blurRadius: 20,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                        text: "Sales",
                      size: 14,
                      weight: FontWeight.w600,
                    ),
                    MyText(
                        text: "\$128,7K",
                      size: 22,
                      weight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                    SalesChart(),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          text: "Campaign Promoters",
                          size: 14,
                          weight: FontWeight.w500,
                          color: kQuaternaryColor,
                        ),
                        MyText(
                          text: "show all",
                          size: 14,
                          weight: FontWeight.w500,
                          color: kQuaternaryColor,
                          fontFamily: AppFonts.poppins,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildProfileImage(imagePath: Assets.imagesPpf),
                        buildProfileImage(imagePath: Assets.imagesPpf),
                        buildProfileImage(imagePath: Assets.imagesPpf),
                        buildProfileImage(imagePath: Assets.imagesPpf),
                        buildProfileImage(imagePath: Assets.imagesPpf),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileImage({required String imagePath, double size = 45}) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: kQuaternaryColor),
          borderRadius: BorderRadius.circular(60),
        ),
      ),
      child: CommonImageView(imagePath: imagePath, height: size, width: size),
    );
  }


  Widget buildSelectableTabs() {
    final List<String> items = ["Fans", "Products", "Campaigns"];

    return Obx(
          () => Row(
        children: List.generate(items.length, (index) {
          final isSelected = selectedIndex.value == index;
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () => selectedIndex.value = index,
              child: MyText(
                text: items[index],
                size: 12,
                weight: FontWeight.w600,
                color: isSelected ? kPrimaryColor : kGreyTxColor,
              ),
            ),
          );
        }),
      ),
    );
  }

}
