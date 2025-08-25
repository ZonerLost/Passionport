import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_sizes.dart';
import '../../../../generated/assets.dart';
import '../../../custom/common_image_view_widget.dart';
import '../../../custom/custom_appbar.dart';
import '../../../custom/my_text_widget.dart';
import '../../fan/profile/account_settings_screen.dart';
import '../../fan/profile/general_setting_screen.dart';
import '../../fan/profile/notification_screen.dart';
import '../../fan/profile/payment_method_screen.dart';

class BrandSettingScreen extends StatelessWidget {
  const BrandSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "Settings",
      ),
      body: Padding(
        padding: AppSizes.HORIZONTAL,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              text: "Account",
              size: 14,
              weight: FontWeight.w600,
            ),
            SizedBox(height: 10,),
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
                    title: "Payment Methods",
                    onTap: () {
                      Get.to(()=>PaymentMethodScreen());
                    },
                  ),

                ],
              ),
            ),
            SizedBox(height: 20,),
            MyText(
              text: "App",
              size: 14,
              weight: FontWeight.w600,
            ),
            SizedBox(height: 10,),
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
                    title: "Notifications",
                    onTap: () {
                      Get.to(()=>NotificationScreen());
                    },
                  ),
                  SizedBox(height: 12,),
                  SettingsRow(
                    title: "Blocked Accounts",
                    onTap: () {},
                  ),
                  SizedBox(height: 12,),
                  SettingsRow(
                    title: "Privacy",
                    onTap: () {},
                  ),

                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                CommonImageView(
                  svgPath: Assets.svgProfileDelete,
                ),
                SizedBox(width: 12,),
                MyText(
                  text: "Deactivate Account",
                  size: 15,
                  weight: FontWeight.w600,
                  color: kGreyTxColor,
                )
              ],
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                CommonImageView(
                  svgPath: Assets.svgLogout,
                ),
                SizedBox(width: 12,),
                MyText(
                  text: "Logout",
                  size: 15,
                  weight: FontWeight.w600,
                  color: kRedColor,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
