import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_sizes.dart';
import '../../../../generated/assets.dart';
import '../../../../main.dart';
import '../../../custom/common_image_view_widget.dart';
import '../../../custom/custom_appbar.dart';
import '../../../custom/my_text_widget.dart';
import 'message_screen.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "Messages",
        actions: [
          CommonImageView(
            svgPath: Assets.svgMore,
          ),
          SizedBox(width: 15,),
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
                onTap: (){
                  Get.to(()=>ChatUiScreen());
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
                  weight: FontWeight.w500,
                ),
                subtitle: MyText(
                  text: "Nice shirt buddy",
                  size: 12,
                  weight: FontWeight.w400,
                  color: kGreyTxColor,
                ),
                trailing: MyText(
                  text: "12:00 PM",
                  size: 12,
                  weight: FontWeight.w400,
                  color: kPrimaryColor,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
