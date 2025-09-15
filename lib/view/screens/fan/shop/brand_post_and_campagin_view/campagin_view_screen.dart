import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../config/constants/app_colors.dart';
import '../../../../../config/constants/app_fonts.dart';
import '../../../../../config/constants/app_sizes.dart';
import '../../../../../generated/assets.dart';
import '../../../../../main.dart';
import '../../../../custom/common_image_view_widget.dart';
import '../../../../custom/custom_appbar.dart';
import '../../../../custom/my_text_widget.dart';
import '../../home/home_screen.dart';
import 'campaign_dialog.dart';

class CampaignViewScreen extends StatelessWidget {
  const CampaignViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: CustomAppBar2(
          actions: [
            CommonImageView(svgPath: Assets.svgMore),
            SizedBox(width: 15),
          ],
          child: Row(
            children: [
              CommonImageView(
                height: 30,
                width: 30,
                imagePath: Assets.imagesNike,
                radius: 25,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(text: "Nike", size: 13, weight: FontWeight.w500),
                  SizedBox(height: 5),
                  MyText(
                    text: "Campaign",
                    size: 12,
                    weight: FontWeight.w400,
                    color: kGreyTxColor,
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: AppSizes.DEFAULT,
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonImageView(imagePath: Assets.imagesProfile, height: 24),
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
          ),
        ),
        body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CommonImageView(imagePath: Assets.imagesCp1),
                        Positioned(
                          right: 20,
                          left: 20,
                          bottom: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 3,
                                ),
                                decoration: ShapeDecoration(
                                  color: kPrimaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                ),
                                child: MyText(
                                  text: "Shoes",
                                  size: 12,
                                  weight: FontWeight.w400,
                                  color: kQuaternaryColor,
                                ),
                              ),
                              SizedBox(height: 10),
                              MyText(
                                text: "Air Force 1s Sale Out",
                                size: 22,
                                weight: FontWeight.w600,
                                color: kQuaternaryColor,
                              ),
                              SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            color: kQuaternaryColor,
                                            fontSize: 10,
                                            fontFamily: AppFonts.poppins,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  MyText(
                                    text: "55%",
                                    size: 15,
                                    weight: FontWeight.w600,
                                    color: kPrimaryColor,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: SizedBox(
                                  height: 20,
                                  child: LinearProgressIndicator(
                                    borderRadius: BorderRadius.circular(25),
                                    value: 0.6,
                                    backgroundColor: Colors.white.withValues(alpha: 0.50),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: AppSizes.HORIZONTAL,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                text: "Designated Team",
                                size: 12,
                                weight: FontWeight.w600,
                              ),
                              SizedBox(height: 3,),
                              Row(
                                children: [
                                  CommonImageView(imagePath: Assets.images2more,height: 32,),
                                  SizedBox(width: 4,),
                                  MyText(
                                    text: "+2 more",
                                    size: 12,
                                    weight: FontWeight.w400,
                                  )
                                ],
                              )
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            decoration: ShapeDecoration(
                              color: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: MyText(
                              text: "Back It",
                              size: 17,
                              weight: FontWeight.w600,
                              color: kQuaternaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SliverPersistentHeader(
                pinned: true, // 👈 keeps TabBar fixed on top
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    labelColor: kPrimaryColor,
                    unselectedLabelColor: kGreyTxColor,
                    indicatorColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                    tabs: [
                      Tab(text: "Description"),
                      Tab(text: "FAQs"),
                      Tab(text: "Rewards"),
                      Tab(text: "Products"),
                      Tab(text: "Comments"),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: MyText(
                  text:
                      "Lorem ipsum dolor sit amet consectetur. Porta ullamcorper proin venenatis lectus posuere."
                      " Fringilla ut augue vel diam dolor amet aliquam sed. Augue a sit nulla id malesuada cursus. "
                      "Tincidunt sociis auctor a nisl at libero. "
                      "Est eget dignissim praesent eleifend. Cursus molestie volutpat amet eu ut vitae. Sapien.",
                  size: 13,
                  weight: FontWeight.w400,
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: ListView(
                  children: [
                    buildExpandableCard(
                      title: "Lorem ipsum dolor sit amet consectetur?",
                      description:
                          "Lorem ipsum dolor sit amet consectetur. Porta ullamcorper "
                          "proin venenatis lectus posuere. Fringilla ut augue vel diam dolor amet aliquam sed.",
                    ),
                    buildExpandableCard(
                      title: "Lorem ipsum dolor sit amet consectetur?",
                      description:
                          "Lorem ipsum dolor sit amet consectetur. Porta ullamcorper "
                          "proin venenatis lectus posuere. Fringilla ut augue vel diam dolor amet aliquam sed.",
                    ),
                    buildExpandableCard(
                      title: "Lorem ipsum dolor sit amet consectetur?",
                      description:
                          "Lorem ipsum dolor sit amet consectetur. Porta ullamcorper "
                          "proin venenatis lectus posuere. Fringilla ut augue vel diam dolor amet aliquam sed.",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: ListView(
                  children: [
                    buildInfoCard(
                      title: "Thank You",
                      subtitle: "Reverted 10 users through promotion",
                      amount: "\$100",
                    ),
                    buildInfoCard(
                      title: "Surprise",
                      subtitle: "Reverted 50 users through promotion",
                      amount: "Sample Win",
                    ),

                    buildInfoCard(
                      title: "Ambassador",
                      subtitle: "Bought 2 samples",
                      amount: "\$500",
                    ),
                  ],
                ),
              ),
              GridImagesWidget(),
              ListView.builder(
                shrinkWrap: true,
                padding: AppSizes.HORIZONTAL,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonImageView(
                          url: dummyImage1,
                          height: 25,
                          width: 25,
                          radius: 25,
                        ),
                        SizedBox(width: 8),
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
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoCard({
    required String title,
    required String subtitle,
    required String amount,
  }) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
      decoration: ShapeDecoration(
        color: kCBGColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: kWhiteLightColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: title,
                  size: 15,
                  weight: FontWeight.w600,
                  color: kBlack2Color,
                ),
                MyText(
                  text: subtitle,
                  size: 12,
                  weight: FontWeight.w400,
                  color: kGreyTxColor,
                ),
              ],
            ),
          ),
          MyText(
            text: amount,
            size: 17,
            weight: FontWeight.w600,
            color: kBlack2Color,
          ),
        ],
      ),
    );
  }

  Widget buildExpandableCard({
    required String title,
    required String description,
  }) {
    final RxBool isExpanded = false.obs;

    return Obx(
      () => Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: kQuaternaryColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: kWhiteLightColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: MyText(
                    text: title,
                    size: 13,
                    weight: FontWeight.w600,
                    color: kBlack2Color,
                  ),
                ),
                GestureDetector(
                  onTap: () => isExpanded.toggle(),
                  child: AnimatedRotation(
                    duration: const Duration(milliseconds: 200),
                    turns: isExpanded.value ? 0.5 : 0,
                    child: CommonImageView(svgPath: Assets.svgArrowDown1),
                  ),
                ),
              ],
            ),
            if (isExpanded.value)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: MyText(
                  text: description,
                  size: 12,
                  weight: FontWeight.w400,
                  color: kBlack2Color,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class GridImagesWidget extends StatelessWidget {
  GridImagesWidget({super.key});

  final List<String> imagePaths = [
    Assets.imagesS1,
    Assets.imagesS2,
    Assets.imagesS3,
    Assets.imagesS4,
    Assets.imagesS1,
    Assets.imagesS2,
    Assets.imagesS3,
    Assets.imagesS4,
    // add more image paths...
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: imagePaths.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 columns
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: 1, // square items
      ),
      itemBuilder: (context, index) {
        return CommonImageView(imagePath: imagePaths[index]);
      },
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
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
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
