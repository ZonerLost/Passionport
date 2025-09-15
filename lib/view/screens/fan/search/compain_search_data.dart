import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:passion_port/config/constants/app_sizes.dart';
import 'package:passion_port/view/custom/common_image_view_widget.dart';
import 'package:passion_port/view/custom/my_text_widget.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_fonts.dart';
import '../../../../generated/assets.dart';
import '../shop/brand_post_and_campagin_view/campagin_view_screen.dart';
import '../shop/shop_profile_screen.dart';



class CompaignSearchData extends StatelessWidget {
   CompaignSearchData({super.key});


  final List<CategoryItem> categories = [
    CategoryItem(title: "Art", icon: Assets.svgArt),
    CategoryItem(title: "Fashion", icon: Assets.svgFassion),
    CategoryItem(title: "Jewelry", icon: Assets.svgJewelary),
    CategoryItem(title: "Electronics", icon: Assets.svgElectronic),
    // Add more as needed
  ];
   final TagsController controller = Get.put(TagsController());
   final List<String> tags = [
     "All",
     "Trending",
     "Just Launched",
     "Ending",
   ];



   @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: AppSizes.VERTICAL,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: AppSizes.HORIZONTAL,
              child: Obx(() {
                return Wrap(
                  spacing: 6,
                  runSpacing: 10,
                  children: List.generate(tags.length, (index) {
                    final isSelected = controller.selectedIndex.value == index;
                    return GestureDetector(
                      onTap: () {
                        controller.selectedIndex.value = index;
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 7),
                        decoration: ShapeDecoration(
                          color: isSelected ? kPrimaryColor : kCBGColor,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: isSelected
                                  ? kPrimaryColor
                                  : kWhiteLightColor,
                            ),
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                        child: MyText(
                          text: tags[index],
                          size: 12,
                          weight: FontWeight.w400,
                          color: isSelected ? Colors.white : kGreyTxColor,
                        ),
                      ),
                    );
                  }),
                );
              }),
            ),
            SizedBox(height: 12,),
            Padding(
              padding: AppSizes.HORIZONTAL,
              child: MyText(
                text: "Categories",
                size: 13,
                weight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8,),
            SizedBox(
              height: 85, // fixed height for horizontal list
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                padding: AppSizes.HORIZONTAL,
                itemBuilder: (context, index) {
                  final item = categories[index];
                  return Container(
                    width: 92,
                    height: 60,
                    margin: const EdgeInsets.only(right: 12,top: 5,bottom: 5), // spacing between items
                    padding: const EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      color: kQuaternaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x16000000),
                          blurRadius: 5,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CommonImageView(
                          svgPath: item.icon,
                        ),
                        const SizedBox(height: 10),
                        MyText(
                          text: item.title,
                          size: 13,
                          weight: FontWeight.w600,
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
    );
  }
}



class CategoryItem {
  final String title;
  final String icon;

  CategoryItem({required this.title, required this.icon});
}



class TagsController extends GetxController {
  var selectedIndex = (0).obs; // -1 means none selected
}





