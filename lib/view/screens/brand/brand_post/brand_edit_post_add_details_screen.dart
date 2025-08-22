import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_sizes.dart';
import '../../../../generated/assets.dart';
import '../../../custom/common_image_view_widget.dart';
import '../../../custom/custom_appbar.dart';
import '../../../custom/my_button.dart';
import '../../../custom/my_text_widget.dart';
import 'brand_campaign_screen.dart';


class BrandEditPostAddDetailsScreen extends StatelessWidget {
  const BrandEditPostAddDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: "Add Details"),
      bottomNavigationBar: SafeArea(
        child: Container(
          color: kQuaternaryColor,
          child: Padding(
            padding: AppSizes.DEFAULT,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                      decoration: ShapeDecoration(
                        color: kCBGColor,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: kWhiteLightColor,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Row(
                        children: [
                          CommonImageView(
                            svgPath: Assets.svgSmallcaps,
                          ),
                          SizedBox(width: 5,),
                          MyText(
                            text: "Add Text",
                            size: 14,
                            weight: FontWeight.w500,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                      decoration: ShapeDecoration(
                        color: kCBGColor,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: kWhiteLightColor,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Row(
                        children: [
                          CommonImageView(
                            svgPath: Assets.svgGalleryEdit,
                          ),
                          SizedBox(width: 5,),
                          MyText(
                            text: "GIF",
                            size: 14,
                            weight: FontWeight.w500,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                MyButton(onTap: () {
                  Get.to(()=>BrandCampaignScreen());
                }, buttonText: "Post"),
              ],
            ),
          ),
        ),
      ),
      body: SizedBox.expand(
        child: CommonImageView(
          imagePath: Assets.imagesFp,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
