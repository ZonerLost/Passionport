import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:passion_port/config/constants/app_sizes.dart';
import 'package:passion_port/view/custom/custom_appbar.dart';
import 'package:passion_port/view/custom/my_button.dart';
import 'package:passion_port/view/custom/my_text_widget.dart';
import 'package:passion_port/view/custom/my_textfeild.dart';
import 'package:passion_port/view/screens/fan/post/edit_post_add_details_screen.dart';

import '../../../../generated/assets.dart';
import '../../../custom/common_image_view_widget.dart';

class PostAddDetailsScreen extends StatelessWidget {
  const PostAddDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: "Add Details"),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(onTap: () {
            Get.to(()=>EditPostAddDetailsScreen());
          }, buttonText: "Post"),
        ),
      ),
      body: Padding(
        padding: AppSizes.DEFAULT,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonImageView(
              imagePath: Assets.imagesP1,
              radius: 10,
              height: 200,
              width: 200,
            ),
            SizedBox(height: 15),
            MyTextField(label: "Caption", hint: "Add a caption", maxLines: 5),
            Align(
              alignment: Alignment.topLeft,
              child: MyText(text: "Tag", size: 12, weight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CommonImageView(imagePath: Assets.imagesNike, height: 25),
                SizedBox(width: 10),
                MyText(
                  text: "@nike_official",
                  size: 12,
                  weight: FontWeight.w400,
                ),
                SizedBox(width: 20),
                CommonImageView(imagePath: Assets.imagesNike, height: 25),
                SizedBox(width: 10),
                MyText(
                  text: "@nike_official",
                  size: 12,
                  weight: FontWeight.w400,
                ),
              ],
            ),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.topLeft,
              child: MyText(text: "Privacy", size: 12, weight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            ListTile(
              contentPadding: EdgeInsets.zero,
              minTileHeight: 5,
              leading: CommonImageView(svgPath: Assets.svgViews),
              title: MyText(
                text: "Who can see the post",
                size: 15,
                weight: FontWeight.w400,
              ),
              trailing: CommonImageView(svgPath: Assets.svgArrowRightblack),
            ),
            SizedBox(height: 5),
            ListTile(
              contentPadding: EdgeInsets.zero,
              minTileHeight: 5,
              leading: CommonImageView(svgPath: Assets.svgSharing),
              title: MyText(
                text: "Allow Sharing",
                size: 15,
                weight: FontWeight.w400,
              ),
              trailing: CommonImageView(svgPath: Assets.svgArrowRightblack),
            ),
          ],
        ),
      ),
    );
  }
}
