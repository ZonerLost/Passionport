import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:passion_port/config/constants/app_sizes.dart';
import 'package:passion_port/view/custom/common_image_view_widget.dart';
import 'package:passion_port/view/custom/custom_appbar.dart';
import 'package:passion_port/view/custom/my_button.dart';
import 'package:passion_port/view/custom/my_textfeild.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../custom/custom_dropdown.dart';


class BrandAddProductScreen extends StatelessWidget {
   BrandAddProductScreen({super.key});
   RxString selectedOccupation = "Category".obs;
   RxString selectedGender = "Gender".obs;
   RxString selectedColor = "4".obs;
   final List<String> occupationList = [
     "Bank Of America",
     "PayPal",
     "Debit",
     "Credit",
   ];
   final List<String> genderList = [
     "Male",
     "Female",
   ];
   final List<String> colorList = [
     "1",
     "2",
     "3",
     "4",
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "Add Product",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 333,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color:kWhiteLightColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                  child: CommonImageView(
                    svgPath: Assets.svgAddCircleGrey,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 75,
                    height: 100,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color:kWhiteLightColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: CommonImageView(
                        svgPath: Assets.svgAddCircleGrey,
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 100,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color:kWhiteLightColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: CommonImageView(
                        svgPath: Assets.svgAddCircleGrey,
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 100,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color:kWhiteLightColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: CommonImageView(
                        svgPath: Assets.svgAddCircleGrey,
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 100,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color:kWhiteLightColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: CommonImageView(
                        svgPath: Assets.svgAddCircleGrey,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Obx(() => CustomDropDown(
                hint: "Category",
                items: occupationList,
                selectedValue: selectedOccupation.value, // ✅ reactive binding
                onChanged: (value) {
                  if (value != null) {
                    selectedOccupation.value = value;   // ✅ update state
                  }
                },
              ),),
              MyTextField(
                label: "Product Name",
                hint: "Track Suit",
              ),
              MyTextField(
                label: "Short description",
                hint: "Enter description",
              ),
              Obx(() => CustomDropDown(
                labelText: "Gender",
                hint: "Gender",
                items: genderList,
                selectedValue: selectedGender.value, // ✅ reactive binding
                onChanged: (value) {
                  if (value != null) {
                    selectedGender.value = value;   // ✅ update state
                  }
                },
              ),),
              Obx(() => CustomDropDown(
                labelText: "Colors",
                hint: "4",
                items: colorList,
                selectedValue: selectedColor.value, // ✅ reactive binding
                onChanged: (value) {
                  if (value != null) {
                    selectedColor.value = value;   // ✅ update state
                  }
                },
              ),),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: kCBGColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: kWhiteLightColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 70,
                      height: 80,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color:kWhiteLightColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: CommonImageView(
                          svgPath: Assets.svgAddCircleGrey,
                        ),
                      ),
                    ),
                    Container(
                      width: 70,
                      height: 80,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color:kWhiteLightColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: CommonImageView(
                          svgPath: Assets.svgAddCircleGrey,
                        ),
                      ),
                    ),
                    Container(
                      width: 70,
                      height: 80,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color:kWhiteLightColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: CommonImageView(
                          svgPath: Assets.svgAddCircleGrey,
                        ),
                      ),
                    ),
                    Container(
                      width: 70,
                      height: 80,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color:kWhiteLightColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: CommonImageView(
                          svgPath: Assets.svgAddCircleGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              MyTextField(
                label: "Price",
                hint: "\$100",
              ),
              SizedBox(height: 15,),
              MyButton(onTap: (){}, buttonText: "Add Product")

            ],
          ),
        ),
      ),
    );
  }
}
