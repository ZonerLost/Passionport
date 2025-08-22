import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passion_port/config/constants/app_sizes.dart';
import 'package:passion_port/view/custom/common_image_view_widget.dart';
import 'package:passion_port/view/custom/custom_appbar.dart';
import 'package:passion_port/view/custom/my_button.dart';
import 'package:passion_port/view/custom/my_textfeild.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../custom/custom_dropdown.dart';
import '../../../custom/my_text_widget.dart';
import 'brand_post_dialog/brand_post_dialog_screen.dart';



class BrandCampaignScreen extends StatelessWidget {
   BrandCampaignScreen({super.key});
  final selectedReward = ''.obs;
   RxString selectedOccupation = "30 days (month)".obs;
   final List<String> occupationList = [
     "30 days (month)",
     "60 days (2 month)",
     "90 days (3 month)",
     "120 days (4 month)",
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "Add Details",
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            children: [
              CommonImageView(
                imagePath: Assets.imagesDd1,
              ),
              SizedBox(height: 10,),
              MyTextField(
                label: "Campaign Title",
                hint: "Jordans Hype",
              ),
              MyTextField(
                label: "Short Description",
                hint: "Add a description",
                maxLines: 4,
              ),
              MyTextField(
                label: "Funding Goal",
                hint: "\$500,000",
              ),
             Obx(() => CustomDropDown(
            labelText: "Duration",
            hint: "30 days (month)",
            items: occupationList,
            selectedValue: selectedOccupation.value, // ✅ reactive binding
            onChanged: (value) {
              if (value != null) {
                selectedOccupation.value = value;   // ✅ update state
              }
            },
          ),),
              MyTextField(
                label: "Product Link",
                hint: "https.nike.com/jordans",
              ),
              Align(
                alignment: Alignment.topLeft,
                child: MyText(text: "Tag", size: 12, weight: FontWeight.w600),
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
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: MyText(text: "Rewards", size: 12, weight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              Obx(() => Column(
                children: [
                  RewardOption(
                    value: "gold",
                    groupValue: selectedReward.value,
                    onChanged: (val) => selectedReward.value = val,
                    title: "Thank You",
                    subtitle: "Reverted 10 users through promotion",
                    subval1: "\$100",
                  ),
                  const SizedBox(height: 8),
                  RewardOption(
                    value: "silver",
                    groupValue: selectedReward.value,
                    onChanged: (val) => selectedReward.value = val,
                    title: "Surprise",
                    subtitle: "Reverted 50 users through promotion",
                    subval1: "Sample Win",
                  ),
                  const SizedBox(height: 8),
                  RewardOption(
                    value: "bronze",
                    groupValue: selectedReward.value,
                    onChanged: (val) => selectedReward.value = val,
                    title: "Ambassador",
                    subtitle: "Bought 2 samples",
                    subval1: "\$500",
                  ),
                ],
              )),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
                decoration: ShapeDecoration(
                  color: kPrimaryLight2Color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonImageView(
                      svgPath: Assets.svgAddCircle,
                    ),
                    SizedBox(width: 8,),
                    MyText(
                      text: "Add Another",
                      size: 15,
                      weight: FontWeight.w600,
                      color: kPrimaryColor,
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              MyButton(onTap: (){
                BrandPostDialog.showBrandPostDialog();
              }, buttonText: "Post")
            ],
          ),
        ),
      ),

    );
  }
}






class RewardOption extends StatelessWidget {
  final dynamic value;
  final dynamic groupValue;
  final Function(dynamic)? onChanged;
  final String title;
  final String subtitle;
  final String subval1;

  const RewardOption({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    required this.subtitle,
    required this.subval1,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged!(value); // ✅ Change value on tap
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
        decoration: ShapeDecoration(
          color: isSelected ? kPrimaryLightColor : kCBGColor, // ✅ Change bg color
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: isSelected ? kPrimaryColor : kWhiteLightColor, // ✅ Change border color
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          children: [
            RadioTheme(
              data: RadioThemeData(
                fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                  if (states.contains(MaterialState.selected)) {
                    return kPrimaryColor; // ✅ Selected color
                  }
                  return kGreyTxColor; // ✅ Unselected color
                }),
              ),
              child: Radio(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            ),


            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        text: title,
                        size: 15,
                        weight: FontWeight.w600,
                        color: isSelected ? kPrimaryColor : kGreyTxColor,
                      ),
                      MyText(
                        text: subval1,
                        size: 17,
                        weight: FontWeight.w600,
                        color: isSelected ? kPrimaryColor : kGreyTxColor,
                      ),
                    ],
                  ),
                  MyText(
                    text: subtitle,
                    size: 12,
                    weight: FontWeight.w400,
                    color: kGreyTxColor,
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




