import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../config/constants/app_colors.dart';
import '../../../../../config/constants/app_sizes.dart';
import '../../../../../generated/assets.dart';
import '../../../../custom/common_image_view_widget.dart';
import '../../../../custom/my_button.dart';
import '../../../../custom/my_text_widget.dart';



class CampaignDialog{
  static void showCampaignDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: kQuaternaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonImageView(
                imagePath: Assets.imagesPm,
                height: 100,
              ),
              const SizedBox(height: 30),
              MyText(
                text: "Promotion Request",
                size: 22,
                weight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              MyText(
                text: "Send a message to brand to request a promotion for this campaign",
                size: 15,
                weight: FontWeight.w400,
                color: kGreyTxColor,
                textAlign: TextAlign.center,
                lineHeight: 1.3,
              ),
              const SizedBox(height: 30),
              MyButton(onTap: () {}, buttonText: "Send Request"),
              const SizedBox(height: 15),
              MyText(
                text: "Cancel",
                size: 17,
                weight: FontWeight.w600,
                color: kPrimaryColor,
              )
            ],
          ),
        ),
      ),
      barrierDismissible: false, // user must act
    );
  }
}