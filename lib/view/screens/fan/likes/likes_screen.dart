import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:passion_port/config/constants/app_sizes.dart';
import 'package:passion_port/main.dart';
import 'package:passion_port/view/custom/common_image_view_widget.dart';
import 'package:passion_port/view/custom/my_text_widget.dart';
import 'package:passion_port/view/screens/fan/likes/likes_detail_screen.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../custom/custom_appbar.dart';

class LikesScreen extends StatelessWidget {
  const LikesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "Likes",
        actions: [
          CommonImageView(svgPath: Assets.svgMore),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: AppSizes.HORIZONTAL,
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Get.to(() => LikesDetailScreen());
                },
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 0,
                visualDensity: VisualDensity.compact,
                leading: CommonImageView(
                  height: 50,
                  width: 50,
                  url: dummyImage1,
                  radius: 25,
                ),
                title: MyText(
                  text: "User_name",
                  size: 13,
                  weight: FontWeight.w600,
                ),
                subtitle: MyText(
                  text: "Liked your post",
                  size: 12,
                  weight: FontWeight.w400,
                  color: kGreyTxColor,
                ),
                trailing: CommonImageView(
                  height: 50,
                  width: 50,
                  imagePath: Assets.imagesFeed,
                  radius: 10,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
