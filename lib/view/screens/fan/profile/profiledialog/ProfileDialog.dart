import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../config/constants/app_colors.dart';
import '../../../../../config/constants/app_sizes.dart';
import '../../../../../generated/assets.dart';
import '../../../../custom/common_image_view_widget.dart';
import '../../../../custom/my_button.dart';
import '../../../../custom/my_text_widget.dart';
import '../../../../custom/my_textfeild.dart';

class ProfileDialog {
  static void showAuthDialog() {
    RxBool showPassword = false.obs;
    RxBool showConfirmPassword = false.obs;
    Get.dialog(
      Dialog(
        backgroundColor: kQuaternaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonImageView(svgPath: Assets.svgResetPassword),
              const SizedBox(height: 30),

              // dynamic title
              MyText(
                text: "Reset Password",
                size: 22,
                weight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              // dynamic description
              MyText(
                text: "Create a new password",
                size: 15,
                weight: FontWeight.w400,
                color: kGreyTxColor,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Obx(
                () => MyTextField(
                  label: "Current Password",
                  hint: "******",
                  isObSecure: !showPassword.value, // toggle visibility
                  suffix: GestureDetector(
                    onTap: () => showPassword.value = !showPassword.value,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: CommonImageView(
                        svgPath:
                            showPassword.value
                                ? Assets
                                    .svgShow // 👁 open eye
                                : Assets.svgHide, // 👁 closed eye
                      ),
                    ),
                  ),
                  marginBottom: 5,
                ),
              ),
              Obx(
                () => MyTextField(
                  label: "New Password",
                  hint: "******",
                  isObSecure: !showConfirmPassword.value, // toggle visibility
                  suffix: GestureDetector(
                    onTap:
                        () =>
                            showConfirmPassword.value =
                                !showConfirmPassword.value,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: CommonImageView(
                        svgPath:
                            showConfirmPassword.value
                                ? Assets
                                    .svgShow // 👁 open eye
                                : Assets.svgHide, // 👁 closed eye
                      ),
                    ),
                  ),
                  marginBottom: 5,
                ),
              ),
              const SizedBox(height: 10),
              MyButton(onTap: () {}, buttonText: "Set new password"),
            ],
          ),
        ),
      ),
      barrierDismissible: false, // user must act
    );
  }
}
