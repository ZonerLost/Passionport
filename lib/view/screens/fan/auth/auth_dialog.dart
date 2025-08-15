import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passion_port/config/constants/app_sizes.dart';
import 'package:passion_port/view/custom/common_image_view_widget.dart';
import 'package:passion_port/view/custom/my_button.dart';
import 'package:passion_port/view/custom/my_text_widget.dart';
import '../../../../config/constants/app_colors.dart';
import '../../../../generated/assets.dart';

class AuthDialog {
  static void showAuthDialog({
    required String title,
    required String desc,
    required String buttonText,
    required VoidCallback onTap,
  }) {
    Get.dialog(
      Dialog(
        backgroundColor: kQuaternaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonImageView(svgPath: Assets.svgDialogLogo),
              const SizedBox(height: 30),

              // dynamic title
              MyText(
                text: title,
                size: 22,
                weight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              // dynamic description
              MyText(
                text: desc,
                size: 15,
                weight: FontWeight.w400,
                color: kGreyTxColor,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              // dynamic button
              MyButton(
                onTap: onTap,
                buttonText: buttonText,
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false, // user must act
    );
  }
}
