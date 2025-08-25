import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:passion_port/config/constants/app_sizes.dart';
import 'package:passion_port/view/custom/common_image_view_widget.dart';
import 'package:passion_port/view/custom/my_text_widget.dart';
import 'package:passion_port/view/screens/fan/profile/account_settings_screen.dart';
import 'package:passion_port/view/screens/fan/profile/login_account_screen.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../custom/custom_appbar.dart';



class GeneralSettingScreen extends StatelessWidget {
  const GeneralSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "General Settings",

      ),
      body: Padding(
        padding: AppSizes.DEFAULT,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: ShapeDecoration(
                color: kQuaternaryColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: kWhiteLightColor,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  SettingsRow(
                    title: "Account Settings",
                    subtitle: "Email, ph....",
                    onTap: () {
                      Get.to(()=>AccountSettingsScreen());
                    },
                  ),
                  SizedBox(height: 12,),
                  SettingsRow(
                    title: "Login Account",
                    subtitle: "Gmail",
                    onTap: () {
                      Get.to(()=>LoginAccountScreen());
                    },
                  ),

                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}




class SettingsRow extends StatelessWidget {
  final String title;
  final String? subtitle; // optional
  final VoidCallback? onTap;

  const SettingsRow({
    Key? key,
    required this.title,
    this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          MyText(
            text: title,
            size: 15,
            weight: FontWeight.w600,
          ),
          const Spacer(),
          if (subtitle != null && subtitle!.isNotEmpty) ...[   // ✅ optional text
            MyText(
              text: subtitle!,
              size: 13,
              weight: FontWeight.w400,
              color: kGreyTxColor,
            ),
            const SizedBox(width: 8),
          ],
          CommonImageView(
            svgPath: Assets.svgArrowRight,
            height: 20,
          ),
        ],
      ),
    );
  }
}
