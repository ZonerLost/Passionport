import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:passion_port/view/custom/my_textfeild.dart';

import '../../../../../config/constants/app_colors.dart';
import '../../../../../config/constants/app_sizes.dart';
import '../../../../../generated/assets.dart';
import '../../../../custom/common_image_view_widget.dart';
import '../../../../custom/custom_dropdown.dart';
import '../../../../custom/my_button.dart';
import '../../../../custom/my_text_widget.dart';

class BrandPostDialog {
  static void showBrandPostDialog() {
    RxString selectedOccupation = "\$100".obs;
    final List<String> occupationList = [
      "\$100",
      "\$200",
      "\$300",
      "\$400",
    ];
    Get.dialog(
      Dialog(
        backgroundColor: kQuaternaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonImageView(imagePath: Assets.imagesReward,height: 100,),
              const SizedBox(height: 30),
              MyText(
                text: "Add Reward",
                size: 22,
                weight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              MyText(
                text: "Enter reward details for the promotors",
                size: 15,
                weight: FontWeight.w400,
                color: kGreyTxColor,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              MyTextField(label: "Name", hint: "Thank You"),
              MyTextField(label: "Description", hint: "Short Description"),
              Obx(() => CustomDropDown(
                labelText: "Reward",
                hint: "\$100",
                items: occupationList,
                selectedValue: selectedOccupation.value, // ✅ reactive binding
                onChanged: (value) {
                  if (value != null) {
                    selectedOccupation.value = value;   // ✅ update state
                  }
                },
              ),),

              // dynamic button
              MyButton(onTap: () {}, buttonText: "Add Reward"),
            ],
          ),
        ),
      ),
      barrierDismissible: false, // user must act
    );
  }
}
