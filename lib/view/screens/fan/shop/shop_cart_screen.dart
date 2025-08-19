import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:passion_port/config/constants/app_sizes.dart';
import 'package:passion_port/view/custom/common_image_view_widget.dart';
import 'package:passion_port/view/custom/custom_appbar.dart';
import 'package:passion_port/view/custom/my_button.dart';
import 'package:passion_port/view/custom/my_text_widget.dart';
import 'package:passion_port/view/screens/fan/shop/shop_payment_screen.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../generated/assets.dart';



class ShopCartScreen extends StatelessWidget {
  const ShopCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "Cart",
        actions: [
          CommonImageView(
            svgPath: Assets.svgMore,
          ),
          SizedBox(width: 15,),

        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: kCBGColor),
          child: Padding(
            padding: AppSizes.DEFAULT,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: "Total Amount",
                      size: 12,
                      weight: FontWeight.w400,
                      color: kGreyTxColor,
                    ),
                    SizedBox(height: 8,),
                    MyText(
                      text: "\$300.00",
                      size: 22,
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(
                  width: 140,
                    child: MyButton(onTap: (){
                      Get.to(()=>ShopPaymentScreen());
                    }, buttonText: "Buy Now")),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: AppSizes.HORIZONTAL,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: kWhiteLightColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    CommonImageView(
                      imagePath: Assets.imagesC1,
                      height: 63,
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: "Track Suit",
                            size: 15,
                            weight: FontWeight.w500,
                          ),
                          SizedBox(height: 5,),
                          MyText(
                            text: 'Lorem ipsum dolor sit amet consectetur.',
                            size: 10,
                            weight: FontWeight.w400,
                            color: kGreyTxColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MyText(
                          text: "\$100.00",
                          size: 15,
                          weight: FontWeight.w600,
                          color: kPrimaryColor,
                        ),
                        SizedBox(height: 5,),
                        SizedBox(
                            height: 35,
                            width: 80,
                            child: MyButton(onTap: (){
                              Get.to(()=>ShopPaymentScreen());
                            }, buttonText: "Buy Now"))
                      ],
                    ),
                  ],
                ),
              ),
            );
          },),
        ),
      ),
    );
  }
}
