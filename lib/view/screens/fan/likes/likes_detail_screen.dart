import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:passion_port/config/constants/app_sizes.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_fonts.dart';
import '../../../../generated/assets.dart';
import '../../../../main.dart';
import '../../../custom/common_image_view_widget.dart';
import '../../../custom/custom_appbar.dart';
import '../../../custom/my_text_widget.dart';
import '../home/comment_bottomsheet.dart';
import '../home/home_screen.dart';



class LikesDetailScreen extends StatelessWidget {
  const LikesDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        actions: [

          CommonImageView(
            svgPath: Assets.svgMore,
          ),
          SizedBox(width: 15,),
        ],
        child: Row(
          children: [
            CommonImageView(
              height: 30,
              width: 30,
              url: dummyImage1,
              radius: 25,
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "User_name",
                  size: 13,
                  weight: FontWeight.w600,
                ),
                SizedBox(height: 2,),
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
      body: Padding(
        padding: AppSizes.DEFAULT,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyCarousel(),
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
          ],
        ),
      ),
    );
  }
}
