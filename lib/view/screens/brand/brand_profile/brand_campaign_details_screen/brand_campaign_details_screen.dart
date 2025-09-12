import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:passion_port/config/constants/app_sizes.dart';
import 'package:passion_port/view/custom/custom_appbar.dart';

import '../../../../../config/constants/app_colors.dart';
import '../../../../../config/constants/app_fonts.dart';
import '../../../../../generated/assets.dart';
import '../../../../../main.dart';
import '../../../../custom/common_image_view_widget.dart';
import '../../../../custom/my_text_widget.dart';
import '../../../fan/home/comment_bottomsheet.dart';
import '../../../fan/home/home_screen.dart';


class BrandCampaignDetailsScreen extends StatelessWidget {
   BrandCampaignDetailsScreen({super.key});
  final RxInt selectedIndex = 0.obs;

  final List<String> categories = [
    "All",
    "Active",
    "Inactive",
    "Stopped",
    "Archived",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "Campaigns",
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: AppSizes.VERTICAL,
          child: Column(
            children: [
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
                          margin: const EdgeInsets.only(right: 5),
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
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: AppSizes.HORIZONTAL,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            MyCarousel(),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: CommonImageView(
                                imagePath: Assets.imagesPromotion,
                                height: 30,
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
                        ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if(index != 0)
                                    CommonImageView(
                                      url: dummyImage1,
                                      height: 25,
                                      width: 25,
                                      radius: 25,
                                    ),
                                  if(index != 0)
                                    SizedBox(width: 8,),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'User_name ',
                                          style: TextStyle(
                                            color: kBlack2Color,
                                            fontSize: 14,
                                            fontFamily: AppFonts.poppins,
                                            fontWeight: FontWeight.w600,
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
                        Stack(
                          children: [
                            CommonImageView(imagePath: Assets.imagesShoes,height: 300,width: 300,),
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
                        )
                      ],

                    ),
                  );

              },)
            ],
          ),
        ),
      ),
    );
  }
}
