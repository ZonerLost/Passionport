import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../custom/common_image_view_widget.dart';
import '../../../custom/custom_appbar.dart';
import '../../../custom/my_text_widget.dart';
import 'brand_post_add_detail_screen.dart';

class BrandCreatePostScreen extends StatelessWidget {
   BrandCreatePostScreen({super.key});

  final List<String> images = [
    Assets.imagesP1,
    Assets.imagesP2,
    Assets.imagesP3,
    Assets.imagesP4,
    Assets.imagesP5,
    Assets.imagesP6,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: "Create Post"),
      bottomNavigationBar: Container(
        color: kQuaternaryColor,
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Row(
                children: [
                  MyText(
                    text: "Recent",
                    size: 14,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(width: 10,),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
            Stack(
              children: [
                GestureDetector(
                  onTap: (){
                    Get.to(()=>BrandPostAddDetailScreen());
                  },
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0),
                    physics: NeverScrollableScrollPhysics(),
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
                ),
                Positioned(
                  bottom: 15,
                  left: 60,
                  right: 60,

                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      spacing: 10,
                      children: [
                        MyText(
                          text: "Post",
                          size: 14,
                          weight: FontWeight.w500,
                        ),
                        MyText(
                          text: "Campaign",
                          size: 14,
                          weight: FontWeight.w500,
                        ),
                        MyText(
                          text: "Story",
                          size: 14,
                          weight: FontWeight.w500,
                          color: kPrimaryColor,
                        ),
                        MyText(
                          text: "Video",
                          size: 14,
                          weight: FontWeight.w500,
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: CommonImageView(
        imagePath: Assets.imagesFp,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
