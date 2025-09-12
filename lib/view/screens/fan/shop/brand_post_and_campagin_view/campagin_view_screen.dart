import 'package:flutter/material.dart';

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
              imagePath: Assets.imagesNike,
              radius: 25,
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "Nike",
                  size: 13,
                  weight: FontWeight.w500,
                ),
                SizedBox(height: 5,),
                MyText(
                  text: "Campaign",
                  size: 12,
                  weight: FontWeight.w400,
                  color: kGreyTxColor,
                ),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  MyCarousel(),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: GestureDetector(
                      onTap: (){
                        CampaignDialog.showCampaignDialog();
                      },
                      child: CommonImageView(
                        imagePath: Assets.imagesPromotion,
                        height: 35,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                spacing: 15,
                children: [
                  CommonImageView(svgPath: Assets.svgLikeheart),
                  CommonImageView(svgPath: Assets.svgComment),
                  CommonImageView(svgPath: Assets.svgShare),
                ],
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Nike ',
                      style: TextStyle(
                        color: kBlack2Color,
                        fontSize: 14,
                        fontFamily: AppFonts.poppins,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: '50% off on last 100 pairs of AJ 1s. Don’t miss out',
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

             /* const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: "Funding Goal",
                      size: 14,
                      weight: FontWeight.w600,
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        MyText(
                          text: "65%",
                          size: 22,
                          weight: FontWeight.w600,
                          color: kPrimaryColor,
                        ),
                        SizedBox(width: 3,),
                        MyText(
                        text: "\$13,675 / \$100,000 Raise",
                        size: 14,
                        weight: FontWeight.w400,
                      )
                      ],
                    ),
                    SizedBox(height: 10,),
                    LinearProgressIndicator(
                      minHeight: 15,
                      borderRadius: BorderRadius.circular(25),
                      value: 0.5, // 50% progress, remove this for an indeterminate loader
                      backgroundColor: kPrimaryLight2Color,
                      valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                    )
                  ],
                ),
              ),*/
              const SizedBox(height: 10),
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
                          CommonImageView(
                            url: dummyImage1,
                            height: 25,
                            width: 25,
                            radius: 25,
                          ),
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
                //crossAxisAlignment: CrossAxisAlignment.start,
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
        ),
      ),
    );
  }
}
